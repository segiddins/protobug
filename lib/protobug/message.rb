require_relative "field"
require "stringio"

module Protobug
  UNSET = Object.new
  def UNSET.inspect
    "<UNSET>"
  end

  def UNSET.===(other)
    other.equal? UNSET
  end
  UNSET.freeze

  module Message
    def self.extended(base)
      base.class_eval do
        @full_name = nil
        @fields_by_number = {}
        @fields_by_name = {}
        @reserved_ranges = []
        @oneofs = {}
        extend BaseDescriptor
        include Protobug::Message::InstanceMethods
      end
      base.singleton_class.class_eval do
        attr_accessor :full_name
        attr_reader :fields_by_number
        attr_reader :fields_by_name
        attr_reader :reserved_ranges
        attr_reader :oneofs

        def freeze
          fields_by_number.freeze
          fields_by_name.freeze
          full_name.freeze
          reserved_ranges.freeze
          oneofs.each_value(&:freeze)
          oneofs.freeze
          super
        end

        def reserved_range(range)
          raise "expected Range, got #{range.inspect}" unless range.is_a? Range
          reserved_ranges << range
        end
      end
    end

    def optional(number, name, **kwargs)
      raise ArgumentError, "expected cardinality: :optional, got #{kwargs[:cardinality].inspect}" if kwargs[:cardinality] && kwargs[:cardinality] != :optional
      field(number, name, cardinality: :optional, **kwargs)
    end

    def repeated(number, name, **kwargs)
      raise ArgumentError, "expected cardinality: :repeated, got #{kwargs[:cardinality].inspect}" if kwargs[:cardinality] && kwargs[:cardinality] != :repeated
      field(number, name, cardinality: :repeated, **kwargs)
    end

    def required(number, name, **kwargs)
      raise ArgumentError, "expected cardinality: :required, got #{kwargs[:cardinality].inspect}" if kwargs[:cardinality] && kwargs[:cardinality] != :required
      field(number, name, cardinality: :required, **kwargs)
    end

    def decode_json(json, registry:)
      require 'json'
      hash = JSON.parse(json, allow_blank: false, create_additions: false)
      raise "expected hash, got #{hash.inspect}" unless hash.is_a? Hash
      decode_json_hash(hash, registry: registry)
    end

    def decode_json_hash(json, registry:)
      return if json.nil?
      return json if UNSET == json

      if full_name == "google.protobuf.Timestamp"
        raise "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String
        time = DateTime.rfc3339(json).to_time
        json = {
          "seconds" => time.to_i,
          "nanos" => time.nsec
        }
      elsif full_name == "google.protobuf.Duration"
        raise "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String
        if /\A(-?)(\d+)\.(\d+)s\z/ =~ json
          sign = $1 ? -1 : 1
          seconds = $2.to_i
          nanos = $3
          nanos = nanos.ljust(9, "0").to_i
          json = {
            "seconds" => sign * seconds,
            "nanos" => sign * nanos
          }
        else
          raise "expected string for #{full_name}, got #{json.inspect}"
        end
      end

      raise "expected hash, got #{json.inspect}" unless json.is_a? Hash

      message = new

      json.each do |key, value|
        field = fields_by_name.values.find { |f| f.json_name == key } || raise("unknown field #{key.inspect} in #{full_name}")
        if field.oneof && message.send(field.oneof)
          raise "multiple oneof fields set in #{full_name}: #{message.send(field.oneof)} and #{field.name}"
        end
        case field.type
        when :int32, :int64, :uint32, :uint64, :sint32, :sint64
          case value
          when Integer
          when /\A-?\d+\z/
            value = Integer(value)
          else
            raise "expected integer for #{full_name}.#{field.name}, got #{value.inspect}"
          end
          message.send(field.setter, value)
        when :fixed32, :fixed64, :sfixed32, :sfixed64
          message.send(field.setter, value)
        when :bool
          case value
          when TrueClass, FalseClass
          else
            raise "expected boolean, got #{value.inspect}"
          end
          message.send(field.setter, value)
        when :float, :double
          case value
          when Float
          when "Infinity"
            value = Float::INFINITY
          when "-Infinity"
            value = -Float::INFINITY
          when "NaN"
            value = Float::NAN
          else
            raise "expected float for #{full_name}.#{field.name}, got #{value.inspect}"
          end
          message.send(field.setter, value)
        when :string, :bytes
          case value
          when String
            if field.type == :bytes
              value = value.unpack1("m")
            else
              value.force_encoding("utf-8")
            end
          else
            raise "expected string for #{full_name}.#{field.name}, got #{value.inspect}"
          end
          message.send("#{field.name}=", value)
        when :message
          klass = registry.fetch(field.message_type)
          if field.cardinality == :repeated
            raise "expected array, got #{value.inspect}" unless value.is_a? Array
            message.send(field.setter, value.map { |v| klass.decode_json_hash(v, registry: registry) || raise("null not allowed in repeated message")})
          else
            message.send(field.setter, klass.decode_json_hash(value, registry: registry))
          end
        when :enum
          klass = registry.fetch(field.enum_type)
          if field.cardinality == :repeated
            raise "expected array, got #{value.inspect}" unless value.is_a? Array
            message.send(field.setter, value.map { |v| klass.decode_json_hash(v, registry: registry) || raise("null not allowed in repeated enum") })
          else
            message.send(field.setter, klass.decode_json_hash(value, registry: registry))
          end
        when :group
          case value
          when UNSET
          else
            raise "unexpected group for #{full_name}.#{field.name}, got #{value.inspect}"
          end
        else
          raise "unhandled type in #{self}.#{__method__}: #{field.inspect}"
        end
      end

      message
    rescue => e
      raise RuntimeError, "error decoding #{full_name}: #{e.message}"
    end

    def decode(binary, registry:)
      binary.binmode
      object = new
      loop do
        header = decode_varint(binary)
        break if header.nil?
        wire_type = header & 0b111
        number = (header ^ wire_type)  >> 3

        raise "unexpected field number #{number} in #{full_name}" unless number > 0
        field = fields_by_number[number]
        # raise "#{full_name} missing field #{number}" unless field
        raise "expected LEN field for packed #{field}" if field && field.packed? && wire_type != 2

        case wire_type
        when 0
          value = decode_varint(binary) || raise(EOFError, "unexpected EOF")
        when 1
          value = binary.read(8)
          raise EOFError, "unexpected EOF" if value&.bytesize != 8
        when 2
          length = decode_varint(binary) || raise(EOFError, "unexpected EOF")
          value = binary.read(length)
          raise EOFError, "unexpected EOF" if value&.bytesize != length
        when 3
        when 4
        when 5
          value = binary.read(4)
          raise EOFError, "unexpected EOF" if value&.bytesize != 4
        else
          raise "unhandled wire type #{wire_type}"
        end

        next unless field

        # TODO: handle packed fields
        # TODO: handle unknown fields
        # TODO: verify field type & wire type match

        case field.type
        when :int32
          if field.packed? && field.repeated? && wire_type == 2
            len = StringIO.new(value)
            len.binmode
            until len.eof?
              value = decode_varint(len)
              raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
              value = [value].pack("l").unpack1("l")
              raise RangeError, "expected 32-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length <= 32
              object.send((field.adder || field.setter), value)
            end
          else
            raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
            value = [value].pack("l").unpack1("l")
            raise RangeError, "expected 32-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length <= 32
            object.send((field.adder || field.setter), value)
          end
        when :int64
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
          value = [value].pack("q").unpack1("q")
          raise RangeError, "expected 64-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length <= 64
          object.send((field.adder || field.setter), value)
        when :uint32, :uint64
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
          object.send((field.adder || field.setter), value)
        when :fixed32, :fixed64, :sfixed32, :sfixed64
        when :sint32, :sint64
        when :bool
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
          object.send((field.adder || field.setter), value!=0)
        when :string
          raise "expected string, got #{value.inspect}" unless value.is_a? String
          value.force_encoding("utf-8")
          object.send((field.adder || field.setter), value)
        when :bytes
          raise "expected string, got #{value.inspect}" unless value.is_a? String
          value.force_encoding(Encoding::BINARY)
          object.send((field.adder || field.setter), value)
        when :message
          klass = registry.fetch(field.message_type)
          object.send((field.adder || field.setter), klass.decode(StringIO.new(value), registry: registry))
        when :enum
          klass = registry.fetch(field.enum_type)
          object.send((field.adder || field.setter), klass.decode(value))
        when :float
          object.send((field.adder || field.setter), value.unpack1("e"))
        when :double
          object.send((field.adder || field.setter), value.unpack1("E"))
        else
          raise "unhandled type in #{self}.#{__method__}: #{field.type.inspect}"
        end
      rescue => e
        raise "error decoding #{full_name}: #{e.message} (field: #{field&.inspect || number})"
      end
      object
    end

    def encode(message)
      raise "expected #{self}, got #{message.inspect}" unless message.is_a? self
      set_fields = fields_by_number.select { |number, field| message.send(:"#{field.name}?") }
      outbuf = "".b

      set_fields.each do |number, field|
        value = message.instance_variable_get(:"@#{field.name}")

        Array(value).each do |value|
          case field.type
          when :int32, :int64
            raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
            encode_varint (number << 3) | 0, outbuf
            encode_varint value, outbuf
          when :bool
            raise "expected boolean, got #{value.inspect}" unless value.is_a?(TrueClass) || value.is_a?(FalseClass)
            encode_varint (number << 3) | 0, outbuf
            encode_varint(value ? 1 : 0, outbuf)
          when :float
            encode_varint (number << 3) | 5, outbuf
            outbuf << [value].pack("e")
          when :double
            encode_varint (number << 3) | 1, outbuf
            outbuf << [value].pack("E")
          when :string, :bytes
            raise "expected string, got #{value.inspect}" unless value.is_a? String
            encode_varint (number << 3) | 2, outbuf
            value = value.encode("utf-8") if field.type == :string
            encode_varint value.bytesize, outbuf
            outbuf << value.b
          when :message
            raise "expected #{field.message_type}, got #{value.inspect}" unless value.class.full_name == field.message_type
            msgval = value.class.encode(value)
            encode_varint (number << 3) | 2, outbuf
            encode_varint msgval.bytesize, outbuf
            outbuf << msgval
          when :enum
            raise "expected #{field.enum_type}, got #{value.inspect}" unless value.class.full_name == field.enum_type
            encode_varint (number << 3) | 0, outbuf
            encode_varint value.value, outbuf
          when :uint32, :uint64
            raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
            encode_varint (number << 3) | 0, outbuf
            encode_varint value, outbuf
          else
            raise "unhandled type in #{self}.#{__method__}: #{field.type.inspect}"
          end
        end
      end
      outbuf
    end

    private

    def encode_varint(value, outbuf)
      negative = value < 0
      value = 0b11111111_11111111_11111111_11111111_11111111_11111111_11111111_11111111 + value + 1 if negative
      out = []
      loop do
        if value.bit_length > 7
          out << (0b1000_0000 | (value & 0b0111_1111))
          value >>= 7
        else
          out << (value & 0b0111_1111)
          break
        end
      end
      outbuf << out.pack("c*")
    end

    def decode_varint(binary)
      byte = binary.getbyte
      value = 0 if byte
      bl = 0
      loop do
        return value if byte.nil?
        if byte & 0b1000_0000 == 0
          return value | (byte << bl)
        else
          value |= ((byte & 0b0111_1111) << bl)
          bl += 7
          byte = binary.getbyte || raise(EOFError, "unexpected EOF")
        end
      end
    end

    def field(number, name, **kwargs)
      field = Field.new(number, name, **kwargs).freeze

      raise "duplicate field number #{number}" if fields_by_number[number]
      fields_by_number[number] = field
      raise "duplicate field name #{name}" if fields_by_name[name]
      fields_by_name[name] = field

      define_method(field.setter) do |value|
        case field.type
        when :int32
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
          raise RangeError, "expected 32-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length < 32
        when :uint32
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
          raise RangeError, "expected 32-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length <= 32
        when :int64
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
          raise RangeError, "expected 64-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length < 64
        when :uint64
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer
          raise RangeError, "expected 64-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length <= 64
        end
        instance_variable_set(:"@#{name}", value)
      end



      define_method(name) do
        value = instance_variable_get(:"@#{name}")
        UNSET == value ? field.default : value
      end

      define_method(:"#{name}?") do
        value = instance_variable_get(:"@#{name}")
        UNSET != value
      end

      define_method(:"clear_#{name}") do
        instance_variable_set(:"@#{name}", UNSET)
      end

      define_method(field.adder) do |value|
        # TODO: validate value

        existing = instance_variable_get(:"@#{name}")
        if UNSET == existing
          existing = []
          instance_variable_set(:"@#{name}", existing)
        end

        existing << value
      end if field.repeated?

      if field.oneof
        unless oneofs[field.oneof]
          oneofs[field.oneof] = ary = []
          define_method(field.oneof) do
            ary.find { |f| send(:"#{f.name}?") }&.name
          end
        end
        oneofs[field.oneof] << field
      end
    end

    module InstanceMethods
      def ==(other)
        full_name == other.full_name &&
        self.class.fields_by_name.all? do |name, _|
          send(name) == other.send(name)
        end
      end
      alias eql? ==

      def initialize
        super
        self.class.fields_by_name.each do |name, field|
          instance_variable_set("@#{name}", UNSET)
        end
      end

      def pretty_print(pp)
        fields_with_values = self.class.fields_by_name.select do |name, field|
          value = send(name)
          UNSET != value && (field.cardinality != :repeated || !value.empty?) && (field.cardinality != :optional || !value.nil?)
          true
        end
        pp.group 2, "#{self.class}.new(", ")" do
          pp.breakable
          fields_with_values.each_with_index do |(name, field), idx|
            pp.nest 2 do
              unless idx.zero?
                pp.text ","
                pp.breakable " "
              end
              pp.text "#{name}: "
              pp.pp send(field.name)
            end
          end
        end
      end

      def hash
        self.class.fields_by_name.map { |name, _| send(name) }.hash
      end

      def to_text
        fields_with_values = self.class.fields_by_name.select do |name, field|
          value = send(name)
          UNSET != value && (field.cardinality != :repeated || !value.empty?) && (field.cardinality != :optional || !value.nil?)
        end

        fields_with_values.map do |name, field|
          value = send(field.name)
          field.to_text(value)
        end.join("\n")
      end

      def to_proto
        self.class.encode(self)
      end

      def as_json
        if self.class.full_name == "google.protobuf.Timestamp"
          time = Time.at(seconds, nanos, :nanosecond, in: 0)
          return time.strftime("%FT%H:%M:%S.%3NZ")
        elsif self.class.full_name == "google.protobuf.Duration"
          seconds = self.seconds
          nanos = self.nanos
          sign = seconds < 0 ? "-" : ""
          seconds = seconds.abs
          nanos = nanos.abs
          return "#{sign}#{seconds}.#{nanos.to_s.rjust(9, "0")}s"
        end
        fields_with_values = self.class.fields_by_name.select do |name, field|
          send(:"#{field.name}?")
        end

        fields_with_values.to_h do |name, field|
          value = send(field.name)
          case field.type
          when :bytes
            value = [value].pack("m0")
          when :string
            value = value.encode("utf-8")
          when :message, :enum
            if field.cardinality == :repeated
              value = value.map(&:as_json)
            else
              value = value.as_json
            end
          end

          [field.json_name, value]
        end
      end

      def to_json
        JSON.generate(as_json, allow_infinity: true)
      end
    end
  end
end
