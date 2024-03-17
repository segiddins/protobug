# frozen_string_literal: true

require_relative "errors"
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
          raise DefinitionError, "expected Range, got #{range.inspect}" unless range.is_a? Range

          reserved_ranges << range
        end
      end
    end

    def optional(number, name, **kwargs)
      if kwargs[:cardinality] && kwargs[:cardinality] != :optional
        raise DefinitionError,
              "expected cardinality: :optional, got #{kwargs[:cardinality].inspect}"
      end
      field(number, name, cardinality: :optional, **kwargs)
    end

    def repeated(number, name, **kwargs)
      if kwargs[:cardinality] && kwargs[:cardinality] != :repeated
        raise DefinitionError,
              "expected cardinality: :repeated, got #{kwargs[:cardinality].inspect}"
      end
      field(number, name, cardinality: :repeated, **kwargs)
    end

    def map(number, name, **kwargs)
      raise DefinitionError,
            "expected type: :map, got #{kwargs[:type].inspect}" if kwargs[:type] && kwargs[:type] != :map
      repeated(number, name, type: :map, **kwargs)
    end

    def required(number, name, **kwargs)
      if kwargs[:cardinality] && kwargs[:cardinality] != :required
        raise DefinitionError,
              "expected cardinality: :required, got #{kwargs[:cardinality].inspect}"
      end
      field(number, name, cardinality: :required, **kwargs)
    end

    def decode_json(json, registry:)
      require "json"
      hash = JSON.parse(json, allow_blank: false, create_additions: false, allow_nan: false, allow_infinity: false)
      raise DecodeError, "expected hash, got #{hash.inspect}" unless hash.is_a? Hash

      decode_json_hash(hash, registry: registry)
    end

    def decode_json_hash(json, registry:)
      return json if UNSET == json

      case full_name # TODO: put this into the compiler
      when "google.protobuf.Timestamp"
        raise DecodeError, "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String

        time = DateTime.rfc3339(json).to_time
        json = {
          "seconds" => time.to_i,
          "nanos" => time.nsec
        }
      when "google.protobuf.Duration"
        raise DecodeError, "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String

        if /\A(-)?(\d+)\.(\d+)s\z/ =~ json
          sign = $1 ? -1 : 1
          seconds = $2.to_i
          nanos = $3
          nanos = nanos.ljust(9, "0").to_i
          json = {
            "seconds" => sign * seconds,
            "nanos" => sign * nanos
          }
        else
          raise DecodeError, "expected string for #{full_name}, got #{json.inspect}"
        end
      when "google.protobuf.Value"
        case json
        when NilClass
          json = { "nullValue" => "NULL_VALUE" }
        when Float, Integer
          json = { "numberValue" => json.to_f }
        when String
          json = { "stringValue" => json }
        when TrueClass, FalseClass
          json = { "boolValue" => json }
        when Hash
          json = { "structValue" => json }
        when Array
          json = { "listValue" => json }
        end
      end

      return if json.nil?

      raise DecodeError, "expected hash, got #{json.inspect}" unless json.is_a? Hash

      message = new

      json.each do |key, value|
        field = fields_by_name.values.find do |f|
          f.json_name == key
        end || fields_by_name[key] || raise(UnknownFieldError, "unknown field #{key.inspect} in #{full_name}")

        if field.oneof && message.send(field.oneof) && !value.nil?
          raise DecodeError, "multiple oneof fields set in #{full_name}: #{message.send(field.oneof)} and #{field.name}"
        end

        field.json_decode(value, message, registry)
      end

      message
    end

    def decode(binary, registry:)
      binary.binmode
      object = new
      loop do
        header = decode_varint(binary)
        break if header.nil?

        wire_type = header & 0b111
        number = (header ^ wire_type) >> 3

        raise DecodeError,
              "unexpected field number #{number} in #{full_name || fields_by_name.inspect}" unless number > 0

        field = fields_by_number[number]

        unless field
          read_field_value(binary, wire_type)
          next
          # TODO: allow raising on unknown fields?
          # raise UnknownFieldError, "unknown field number #{number} in #{full_name || fields_by_name.inspect} " \
          #       "of wire_type #{wire_type} (header=#{header.to_s(2)})"
        end

        field.binary_decode(binary, object, registry, wire_type)
      end
      object
    end

    def encode(message)
      raise EncodeError, "expected #{self}, got #{message.inspect}" unless message.is_a? self

      fields_by_number.each_with_object("".b) do |(number, field), outbuf|
        next unless message.send(:"#{field.name}?")

        value = message.instance_variable_get(:"@#{field.name}")

        field.binary_encode(value, outbuf)
      end
    end

    module BinaryEncoding
      module_function

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

      def encode_zigzag(size, value, outbuf)
        raise EncodeError, "expected integer, got #{value.inspect}" unless value.is_a? Integer

        raise EncodeError,
              "bitlength too large for #{size}-bit integer: #{value.bit_length}" unless value.bit_length <= size

        encoded = 2 * value.abs
        encoded -= 1 if value.negative?
        encode_varint encoded, outbuf
      end

      def encode_length(contents, outbuf)
        encode_varint contents.bytesize, outbuf
        outbuf << contents
      end

      def decode_varint(binary)
        byte = binary.getbyte
        value = 0 if byte
        bl = 0
        loop do
          return value if byte.nil?
          if byte & 0b1000_0000 == 0 # no continuation bit set
            return value | (byte << bl)
          else
            value |= ((byte & 0b0111_1111) << bl)
            bl += 7
            byte = binary.getbyte || raise(EOFError, "unexpected EOF")
          end
        end
      end

      def decode_length(binary)
        length = decode_varint(binary) || raise(EOFError, "unexpected EOF")
        string = binary.read(length) || raise(EOFError, "unexpected EOF")
        raise EOFError, "expected #{length} bytes, got #{string.bytesize}" unless string.bytesize == length

        string
      end

      def decode_zigzag(size, value)
        negative = value & 1 == 1
        value ^= 1 if negative
        value >>= 1
        if negative
          value *= -1
          value -= 1
        end

        raise DecodeError,
              "bitlength too large for #{size}-bit integer: #{value.bit_length}" unless value.bit_length <= size

        value
      end

      def read_field_value(binary, wire_type)
        case wire_type
        when 0
          Protobug::Message::BinaryEncoding.decode_varint(binary) || raise(EOFError, "unexpected EOF")
        when 1
          value = binary.read(8)
          raise EOFError, "unexpected EOF" if value&.bytesize != 8

          value
        when 2
          Protobug::Message::BinaryEncoding.decode_length(binary)
        when 3, 4
          raise DecodeError, "group not supported"
        when 5
          value = binary.read(4)
          raise EOFError, "unexpected EOF" if value&.bytesize != 4

          value
        else
          raise DecodeError, "unknown wire_type: #{wire_type}"
        end
      end
    end

    include BinaryEncoding

    def field(number, name, **kwargs)
      field = Field.new(number, name, **kwargs).freeze

      raise DefinitionError, "duplicate field number #{number}" if fields_by_number[number]

      fields_by_number[number] = field
      raise DefinitionError, "duplicate field name #{name}" if fields_by_name[name]

      fields_by_name[name] = field

      define_method(field.setter) do |value|
        return instance_variable_set(:"@#{name}", UNSET) if value.nil? && field.optional? && field.proto3_optional?

        case field.type
        when :int32
          raise InvalidValueError.new(self, field, value) unless value.is_a? Integer

          unless value.bit_length < 32
            raise InvalidValueError.new(self, field, value,
                                        "expected 32-bit integer, got bit_length: #{value.bit_length}")
          end
        when :uint32
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer

          raise RangeError,
                "expected 32-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length <= 32
        when :int64
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer

          raise RangeError,
                "expected 64-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length < 64
        when :uint64
          raise "expected integer, got #{value.inspect}" unless value.is_a? Integer

          raise RangeError,
                "expected 64-bit integer, got #{value} (bit_length: #{value.bit_length})" unless value.bit_length <= 64
        end
        if field.oneof
          self.class.oneofs[field.oneof].each do |f|
            next if f == field

            send(:"clear_#{f.name}")
          end
        end
        instance_variable_set(:"@#{name}", value)
      end

      define_method(name) do
        value = instance_variable_get(:"@#{name}")
        UNSET == value ? field.default : value
      end

      define_method(:"#{name}?") do
        value = instance_variable_get(:"@#{name}")
        return false if UNSET == value

        if field.repeated?
          !value.empty?
        else
          true
        end
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
        self.class.full_name == other.class.full_name &&
          self.class.fields_by_name.all? do |name, _|
            send(name) == other.send(name)
          end
      end
      alias eql? ==

      def initialize
        super
        self.class.fields_by_name.each_key do |name|
          instance_variable_set("@#{name}", UNSET)
        end
      end

      def pretty_print(pp)
        fields_with_values = self.class.fields_by_name.select do |name, field|
          send(:"#{name}?")
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
          send(:"#{name}?")
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
        case self.class.full_name
        when "google.protobuf.Timestamp"
          time = Time.at(seconds, nanos, :nanosecond, in: 0)
          raise EncodeError, "time value too large" if time.year > 9999
          raise EncodeError, "time value too small" if time.year <= 0

          return time.strftime("%FT%H:%M:%S.%3NZ")
        when "google.protobuf.Duration"
          seconds = self.seconds
          nanos = self.nanos
          if seconds != 0 && nanos != 0 && (seconds.negative? ^ nanos.negative?)
            raise EncodeError, "seconds and nanos must have the same sign"
          end

          sign = seconds < 0 ? "-" : ""
          seconds = seconds.abs
          nanos = nanos.abs
          return "#{sign}#{seconds}.#{nanos.to_s.rjust(9, "0")}s"
        when "google.protobuf.Value"
          case kind
          when :null_value
            return nil
          when :number_value
            return number_value
          when :string_value
            return string_value
          when :bool_value
            return bool_value
          when :struct_value
            return struct_value.as_json
          when :list_value
            return list_value.map(&:as_json)
          else
            raise EncodeError, "unknown kind: #{kind.inspect}"
          end
        end
        fields_with_values = self.class.fields_by_name.select do |name, field|
          send(:"#{field.name}?")
        end

        fields_with_values.to_h do |name, field|
          value = send(field.name)

          [field.json_name, field.json_encode(value)]
        end
      end

      def to_json
        require "json"
        JSON.generate(as_json, allow_infinity: true)
      end
    end
  end
end
