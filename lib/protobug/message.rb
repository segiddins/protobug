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

        time = DateTime.rfc3339(json, Date::GREGORIAN).to_time
        json = {
          "seconds" => time.to_i,
          "nanos" => time.nsec
        }
      when "google.protobuf.Duration"
        raise DecodeError, "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String

        if /\A(-)?(\d+)(?:\.(\d+))?s\z/ =~ json
          sign = $1 ? -1 : 1
          seconds = $2.to_i
          nanos = $3 || "0"
          raise RangeError if seconds < -315_576_000_000 || seconds > +315_576_000_000

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
      when "google.protobuf.Any"
        raise DecodeError, "expected hash, got #{json.inspect}" unless json.is_a? Hash

        json = json.dup
        type_url = json.delete("@type") || raise(DecodeError, "missing @type")
        raise DecodeError, "expected string for @type, got #{type_url.inspect}" unless type_url.is_a? String

        unless type_url.start_with?("type.googleapis.com/")
          raise DecodeError, "only type.googleapis.com/ types are supported for Any"
        end

        # TODO: specifically check for well-known type with custom JSON representation
        json = json["value"] if json.key?("value") && json.size == 1

        type = registry.fetch(type_url.delete_prefix("type.googleapis.com/"))
        v = type.decode_json_hash(json, registry: registry)
        json = {
          "type_url" => type_url,
          "value" => [type.encode(v)].pack("m0")
        }
      when "google.protobuf.FieldMask"
        raise DecodeError, "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String

        json = { "paths" => json.split(",").each do |field|
          field.gsub!(/(?<!\A)([A-Z])/) { |m| "_#{m.downcase}" }
        end }
      when "google.protobuf.Struct"
        json = { "fields" => json }
      when "google.protobuf.ListValue"
        json = { "values" => json }
      when "google.protobuf.DoubleValue", "google.protobuf.FloatValue",
          "google.protobuf.Int64Value", "google.protobuf.UInt64Value",
          "google.protobuf.Int32Value", "google.protobuf.UInt32Value",
          "google.protobuf.BoolValue",
          "google.protobuf.StringValue", "google.protobuf.BytesValue"
        json = { "value" => json }
      end

      return if json.nil?

      raise DecodeError, "expected hash for #{full_name}, got #{json.inspect}" unless json.is_a? Hash

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

    def decode(binary, registry:, object: new)
      binary.binmode
      loop do
        header = decode_varint(binary)
        break if header.nil?

        wire_type = header & 0b111
        number = (header ^ wire_type) >> 3

        raise DecodeError,
              "unexpected field number #{number} in #{full_name || fields_by_name.inspect}" unless number > 0

        field = fields_by_number[number]

        if field
          field.binary_decode(binary, object, registry, wire_type)
        else
          object.unknown_fields << [number, wire_type, read_field_value(binary, wire_type)]
        end
      end
      object
    end

    def encode(message)
      raise EncodeError, "expected #{self}, got #{message.inspect}" unless message.is_a? self

      buf = fields_by_number.each_with_object("".b) do |(number, field), outbuf|
        next unless message.send(field.haser)

        value = message.instance_variable_get(field.ivar)

        field.binary_encode(value, outbuf)
      end
      message.unknown_fields.each_with_object(buf) do |(number, wire_type, value), outbuf|
        encode_varint((number << 3) | wire_type, outbuf)
        case wire_type
        when 0, 5
          encode_varint(value, outbuf)
        when 2
          encode_length(value, outbuf)
        else
          raise EncodeError, "unknown wire_type: #{wire_type}"
        end
      end
    end

    module BinaryEncoding
      module_function

      def encode_varint(value, outbuf)
        raise EncodeError, "expected integer, got #{value.inspect}" unless value.is_a? Integer
        raise RangeError, "expected 64-bit integer" if value > 2**64 - 1 || value < -2**63

        negative = value < 0
        value = 2**64 + value if negative
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
        return unless byte

        value = 0
        bl = 0
        loop do
          raise DecodeError, "varint too large" if bl > 63
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
        value %= 2**size
        value >>= 1
        value = -value - 1 if negative

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
          raise UnsupportedFeatureError.new(:group, "reading groups from binary protos (in #{self})")
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
        return instance_variable_set(field.ivar, UNSET) if value.nil? && field.optional? && field.proto3_optional?

        field.validate!(value, self)
        instance_variable_set(field.ivar, value)
      end

      define_method(name) do
        value = instance_variable_get(field.ivar)
        UNSET == value ? field.default : value
      end

      define_method(field.haser) do
        value = instance_variable_get(field.ivar)
        return false if UNSET == value

        return false if (!field.optional? || !field.proto3_optional?) && !field.oneof && field.default == value

        if field.repeated?
          !value.empty?
        else
          true
        end
      end

      define_method(field.clearer) do
        instance_variable_set(field.ivar, UNSET)
      end

      define_method(field.adder) do |value|
        field.validate!(value, self)

        existing = instance_variable_get(field.ivar)
        if UNSET == existing
          existing = []
          instance_variable_set(field.ivar, existing)
        end

        existing << value
      end if field.repeated?

      define_method(field.adder) do |value|
        existing = instance_variable_get(field.ivar)
        if UNSET == existing
          existing = {}
          instance_variable_set(field.ivar, existing)
        end

        existing[value.key] = value.value
      end if field.map?

      if field.oneof
        unless oneofs[field.oneof]
          oneofs[field.oneof] = ary = []
          define_method(field.oneof) do
            ary.find { |f| send(f.haser) }&.name
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

      attr_reader :unknown_fields

      def initialize
        super
        self.class.fields_by_name.each_value do |field|
          instance_variable_set(field.ivar, UNSET)
        end
        @unknown_fields = []
      end

      def pretty_print(pp)
        fields_with_values = self.class.fields_by_name.select do |name, field|
          send(field.haser)
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
          send(field.haser)
        end

        fields_with_values.map do |name, field|
          value = send(field.name)
          field.to_text(value)
        end.join("\n")
      end

      def to_proto
        self.class.encode(self)
      end

      def as_json(print_unknown_fields: false)
        case self.class.full_name
        when "google.protobuf.Timestamp"
          time = Time.at(seconds, nanos, :nanosecond, in: 0)
          raise EncodeError, "time value too large #{time.inspect}" if time.year > 9999
          raise EncodeError, "time value too small #{time.inspect}" if time.year <= 0

          nanosecs = time.nsec

          if nanosecs > 0
            nanosecs = nanosecs.to_s.rjust(9, "0")
            nil while nanosecs.delete_suffix!("000")
            digits = nanosecs.size
            format = "%FT%H:%M:%S.%#{digits}NZ"
          else
            format = "%FT%H:%M:%SZ"
          end

          return time.strftime(format)
        when "google.protobuf.Duration"
          seconds = self.seconds
          nanos = self.nanos
          if seconds != 0 && nanos != 0 && (seconds.negative? ^ nanos.negative?)
            raise EncodeError, "seconds and nanos must have the same sign"
          end

          raise RangeError if seconds < -315_576_000_000 || seconds > +315_576_000_000

          sign = seconds < 0 ? "-" : ""
          sign = "-" if seconds == 0 && nanos < 0
          seconds = seconds.abs
          nanos = nanos.abs
          if nanos.nonzero?
            nanos_s = ".#{nanos.to_s.rjust(9, "0")}"
            nil while nanos_s.delete_suffix!("000")
          end
          return "#{sign}#{seconds}#{nanos_s}s"
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
            return list_value.values.map(&:as_json)
          else
            raise EncodeError, "unknown kind: #{kind.inspect}"
          end
        when "google.protobuf.Struct"
          return fields.transform_values(&:as_json)
        when "google.protobuf.ListValue"
          return values.map(&:as_json)
        when "google.protobuf.DoubleValue", "google.protobuf.FloatValue",
            "google.protobuf.Int64Value", "google.protobuf.UInt64Value",
            "google.protobuf.Int32Value", "google.protobuf.UInt32Value",
            "google.protobuf.BoolValue",
            "google.protobuf.StringValue", "google.protobuf.BytesValue"
          return self.class.fields_by_name.fetch("value").send(:json_encode_one, value,
                                                               print_unknown_fields: print_unknown_fields)
        when "google.protobuf.Any"
          # TODO: need a registry to look up the type
          raise UnsupportedFeatureError.new(:any, "serializing to json")
          # return value.as_json.merge("@type" => "type.googleapis.com/#{value.class.full_name}")
        end
        fields_with_values = self.class.fields_by_name.select do |name, field|
          send(field.haser)
        end

        fields_with_values.to_h do |name, field|
          value = send(field.name)

          [field.json_name, field.json_encode(value, print_unknown_fields: print_unknown_fields)]
        end
      end

      def to_json(print_unknown_fields: false)
        require "json"
        JSON.generate(as_json(print_unknown_fields: print_unknown_fields), allow_infinity: true)
      end
    end
  end
end
