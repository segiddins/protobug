# frozen_string_literal: true

require_relative "binary_encoding"

module Protobug
  class Field
    attr_accessor :number, :name, :json_name, :cardinality, :oneof, :ivar, :setter, :message_type, :enum_type,
                  :adder, :key_type, :value_type, :haser, :clearer

    def initialize(number, name, json_name: nil, cardinality: :optional, oneof: nil, message_type: nil,
                   enum_type: nil, packed: false, key_type: nil, value_type: nil, group_type: nil,
                   proto3_optional: cardinality == :optional)
      _ = group_type
      @number = number
      @name = name.to_sym
      @json_name = json_name || name.to_s
      @cardinality = cardinality || raise(ArgumentError, "cardinality is required")
      @oneof = oneof
      @setter = :"#{name}="
      @adder = :"add_#{name}" if repeated?
      @ivar = :"@#{name}"
      @clearer = :"clear_#{name}"
      @haser = :"#{name}?"
      @message_type = message_type
      @enum_type = enum_type
      @packed = packed
      @proto3_optional = proto3_optional
      @key_type = key_type
      @value_type = value_type
      @map_type = nil
    end

    def pretty_print(pp)
      pp.group 0, "#{self.class}.new(", ")" do
        pp.text @number.to_s
        pp.breakable(", ")
        pp.text(@name.inspect)
        pp.breakable(", ")
        if json_name != name.name
          pp.breakable(", ")
          pp.text("json_name: ")
          pp.text(@json_name.inspect)
        end
        pp.breakable(", ")
        pp.text("cardinality: ")
        pp.pp(@cardinality)
        if oneof
          pp.breakable(", ")
          pp.text("oneof: ")
          pp.text(@oneof.inspect)
        end
      end
    end

    def repeated?
      cardinality == :repeated
    end

    def packed?
      @packed
    end

    def optional?
      cardinality == :optional
    end

    def proto3_optional?
      @proto3_optional
    end

    def define_adder(message)
      field = self
      message.define_method(adder) do |value|
        field.validate!(value, self)

        existing = instance_variable_get(field.ivar)
        if UNSET == existing
          existing = field.default
          instance_variable_set(field.ivar, existing)
        end

        existing << value
      end
    end

    def to_text(value)
      case [cardinality, json_scalar?]
      when [:repeated, true]
        Array(value).map { |v| "#{name}: #{scalar_to_text(v)}" }.join("\n")
      when [:repeated, false]
        Array(value).map { |v| "#{name} {\n#{v.to_text.gsub(/^/, "  ")}\n}" }.join("\n")
      when [:optional, true]
        "#{name}: #{scalar_to_text(value)}"
      when [:optional, false]
        "#{name} {\n#{value.to_text.gsub(/^/, "  ")}\n}"
      end
    end

    def binary_encode(value, outbuf)
      if repeated?
        if packed?
          binary_encode_packed(value, outbuf)
        else
          value.each do |v|
            BinaryEncoding.encode_varint (number << 3) | wire_type, outbuf
            binary_encode_one(v, outbuf)
          end
        end
      elsif (!optional? || !proto3_optional?) && !oneof && default == value
        # omit
      else
        BinaryEncoding.encode_varint (number << 3) | wire_type, outbuf
        binary_encode_one(value, outbuf)
      end
    end

    def binary_decode(binary, message, registry, wire_type)
      if repeated? && wire_type == 2 && [0, 1, 5].include?(self.wire_type)
        len = StringIO.new(BinaryEncoding.decode_length(binary))
        len.binmode

        message.send(adder, binary_decode_one(len, message, registry, self.wire_type)) until len.eof?
      elsif wire_type != self.wire_type
        raise DecodeError, "wrong wire type for #{self}: #{wire_type.inspect}"
      else
        message.send(adder || setter, binary_decode_one(binary, message, registry, wire_type))
      end
    end

    def json_encode(value, print_unknown_fields:)
      if repeated?
        value.map { |v| json_encode_one(v, print_unknown_fields: print_unknown_fields) }
      elsif (!optional? || !proto3_optional?) && !oneof && default == value
        # omit
      else
        json_encode_one(value, print_unknown_fields: print_unknown_fields)
      end
    end

    def json_key_encode(value)
      case value
      when String
        value
      when Integer, Float
        value.to_s
      when TrueClass
        "true"
      when FalseClass
        "false"
      else
        raise EncodeError, "unexpected type for map key: #{value.inspect}"
      end
    end

    def json_decode(value, message, registry)
      if repeated?
        return if value.nil?

        unless value.is_a?(Array)
          raise DecodeError,
                "expected Array for #{inspect}, got #{value.inspect}"
        end

        value.map do |v|
          message.send(adder, json_decode_one(v, registry))
        end
      else
        message.send(setter, json_decode_one(value, registry))
      end
    end

    def validate!(_value, message)
      return unless oneof

      message.class.oneofs[oneof].each do |f|
        next if f == self

        message.send(f.clearer)
      end
    end

    private

    def binary_encode_packed(value, outbuf)
      return if value.empty?

      BinaryEncoding.encode_varint (number << 3) | 2, outbuf

      BinaryEncoding.encode_length(value.each_with_object("".b) do |v, buf|
        binary_encode_one(v, buf)
      end, outbuf)
    end

    class MessageField < Field
      def initialize(number, name, cardinality:, message_type:, json_name: name, oneof: nil,
                     proto3_optional: cardinality == :optional)
        super(number, name, json_name: json_name, cardinality: cardinality, oneof: oneof,
                            message_type: message_type, proto3_optional: proto3_optional)
      end

      def binary_encode_one(value, outbuf)
        BinaryEncoding.encode_length value.class.encode(value), outbuf
      end

      def binary_decode_one(io, message, registry, wire_type)
        value = BinaryEncoding.read_field_value(io, wire_type)
        kwargs = {}
        kwargs[:object] = message.send(name) if !repeated? && message.send(haser)
        type_lookup(registry).decode(StringIO.new(value), registry: registry, **kwargs)
      end

      def json_decode_one(value, registry)
        return if value.nil?

        klass = type_lookup(registry)
        klass.decode_json_hash(value, registry: registry)
      end

      def type_lookup(registry)
        registry.fetch(message_type)
      end

      def json_encode_one(value, print_unknown_fields:)
        value.as_json(print_unknown_fields: print_unknown_fields)
      end

      def default
        return [] if repeated?

        # TODO: message_type.default
        nil
      end

      def wire_type = 2
    end

    class MapField < MessageField
      SUPER_INITIALIZE = instance_method(:initialize).super_method
      def initialize(number, name, key_type:, value_type:, json_name: name, oneof: nil, # rubocop:disable Lint/MissingSuper,
                     enum_type: nil, message_type: nil)
        SUPER_INITIALIZE.bind_call(
          self, number, name,
          cardinality: repeated,
          json_name: json_name,
          oneof: oneof,
          enum_type: enum_type, message_type: message_type,
          key_type: key_type, value_type: value_type
        )

        @map_class = Class.new do
          extend Protobug::Message

          optional(1, "key", type: key_type, proto3_optional: false)
          value_type_kwargs = { enum_type: enum_type, message_type: message_type }.compact
          optional(2, "value", type: value_type, **value_type_kwargs, proto3_optional: false)
        end
      end

      def repeated = true
      def default = {}
      def repeated? = true

      def binary_encode(value, outbuf)
        value.each_with_object(@map_class.new) do |(k, v), entry|
          entry.key = k
          entry.value = v
          BinaryEncoding.encode_varint (number << 3) | wire_type, outbuf
          BinaryEncoding.encode_length @map_class.encode(entry), outbuf
        end
      end

      def json_encode(value, print_unknown_fields:)
        value.to_h do |k, v|
          value = @map_class.fields_by_name["value"].json_encode(v, print_unknown_fields: print_unknown_fields)
          [json_key_encode(k), value]
        end
      end

      def json_decode(value, message, registry)
        return if value.nil?

        unless value.is_a?(Hash)
          raise DecodeError,
                "expected Hash for #{inspect}, got #{value.inspect}"
        end

        value.each do |k, v|
          entry = @map_class.decode_json_hash({ "key" => k, "value" => v }, registry: registry)
          message.send(adder, entry)
        end
      end

      def type_lookup(_registry) = @map_class

      def define_adder(message)
        field = self
        message.define_method(adder) do |value|
          existing = instance_variable_get(field.ivar)
          if UNSET == existing
            existing = field.default
            instance_variable_set(field.ivar, existing)
          end

          existing[value.key] = value.value
        end
      end
    end

    class BytesField < Field
      def self.type = :bytes

      def initialize(number, name, cardinality:, json_name: name, oneof: nil,
                     proto3_optional: cardinality == :optional)
        super(number, name, json_name: json_name, cardinality: cardinality, oneof: oneof,
                            proto3_optional: proto3_optional)
      end

      def binary_encode_one(value, outbuf)
        BinaryEncoding.encode_length value.b, outbuf
      end

      def binary_decode_one(io, _message, _registry, wire_type)
        BinaryEncoding.read_field_value(io, wire_type)
      end

      def json_decode_one(value, _registry)
        return if value.nil?

        # url decode 64
        value.tr!("-_", "+/")
        begin
          value = value.unpack1("m").force_encoding(Encoding::BINARY)
        rescue ArgumentError => e
          raise DecodeError, "Invalid URL-encoded base64 #{value.inspect} for #{inspect}: #{e}"
        end

        value
      end

      def json_encode_one(value, print_unknown_fields:) # rubocop:disable Lint/UnusedMethodArgument
        [value].pack("m0")
      end

      def default
        return [] if repeated?

        "".b
      end

      def wire_type = 2
    end

    class StringField < BytesField
      def self.type = :string

      def initialize(number, name, cardinality:, json_name: name, oneof: nil,
                     proto3_optional: cardinality == :optional)
        super(number, name, json_name: json_name, cardinality: cardinality, oneof: oneof,
                            proto3_optional: proto3_optional)
      end

      def binary_encode_one(value, outbuf)
        value = value.encode("utf-8") if value.encoding != Encoding::UTF_8
        super
      end

      def binary_decode_one(io, _message, _registry, wire_type)
        value = super

        value.force_encoding("utf-8") if value.encoding != Encoding::UTF_8
        raise DecodeError, "invalid utf-8 for string" unless value.valid_encoding?

        value
      end

      def json_decode_one(value, _registry)
        return if value.nil?

        value.force_encoding("utf-8") if value.encoding != Encoding::UTF_8
        raise DecodeError, "invalid utf-8 for string" unless value.valid_encoding?

        value
      end

      def json_encode_one(value, print_unknown_fields:) # rubocop:disable Lint/UnusedMethodArgument
        value.encode("utf-8")
      end

      def default
        return [] if repeated?

        +""
      end
    end

    class IntegerField < Field
      def default
        return [] if repeated?

        0
      end

      def binary_decode_one(io, _message, _registry, wire_type)
        value = BinaryEncoding.read_field_value(io, wire_type)
        case encoding
        when :zigzag
          BinaryEncoding.decode_zigzag bit_length, value
        when :varint
          length_mask = (2**bit_length) - 1
          negative = signed && value & (2**bit_length.pred) != 0
          # warn negative
          length_mask >> 1 if signed
          if negative
            value &= length_mask # remove sign bit

            # 2's complement
            value ^= length_mask
            value += 1
            # value &= length_mask
            -value
          else
            value & length_mask
          end
        when :fixed
          value.unpack1(binary_pack)
        end
      end

      def binary_encode_one(value, outbuf)
        case encoding
        when :zigzag
          BinaryEncoding.encode_zigzag bit_length, value, outbuf
        when :varint
          BinaryEncoding.encode_varint value, outbuf
        when :fixed
          outbuf << [value].pack(binary_pack)
        end
      end

      def json_decode_one(value, _registry)
        return if value.nil?

        case value
        when Integer
          # nothing
        when /\A-?\d+\z/
          value = Integer(value)
        when Float
          value, remainder = value.divmod(1)
          raise DecodeError, "expected integer for #{inspect}, got #{value.inspect}" unless remainder.zero?
        else
          raise DecodeError, "expected integer for #{inspect}, got #{value.inspect}"
        end
        raise DecodeError, "#{value.inspect} does not fit in 64 bits" if value && value.bit_length > 64

        value
      end

      def json_encode_one(value, print_unknown_fields:) # rubocop:disable Lint/UnusedMethodArgument
        if bit_length >= 64
          value.to_s
        else
          value
        end
      end

      def validate!(value, _message)
        raise "expected integer, got #{value.inspect}" unless value.is_a?(Integer)

        if signed
          min = -2**(bit_length - 1)
          max = 2**(bit_length - 1)
        else
          min = 0
          max = 2**bit_length
        end

        if value < min || value >= max
          raise RangeError,
                "#{value} does not fit into a #{self.class.name} [#{min}, #{max})"
        end

        super
      end
    end

    # encoding: fixed, varint, zigzag
    # bitlength: 32, 64
    # signed: true, false
    # EXCEPT: no unsigned zigzag
    class Int64Field < IntegerField
      def encoding = :varint
      def bit_length = 64
      def signed = true
      def wire_type = 0
    end

    class UInt64Field < IntegerField
      def encoding = :varint
      def bit_length = 64
      def signed = false
      def wire_type = 0
    end

    class SInt64Field < IntegerField
      def encoding = :zigzag
      def bit_length = 64
      def signed = true
      def wire_type = 0
    end

    class Fixed64Field < IntegerField
      def encoding = :fixed
      def bit_length = 64
      def signed = false
      def wire_type = 1
      def binary_pack = "Q"
    end

    class SFixed64Field < IntegerField
      def encoding = :fixed
      def bit_length = 64
      def signed = true
      def wire_type = 1
      def binary_pack = "q"
    end

    class Int32Field < IntegerField
      def encoding = :varint
      def bit_length = 32
      def signed = true
      def wire_type = 0
    end

    class UInt32Field < IntegerField
      def encoding = :varint
      def bit_length = 32
      def signed = false
      def wire_type = 0
    end

    class SInt32Field < IntegerField
      def encoding = :zigzag
      def bit_length = 32
      def signed = true
      def wire_type = 0
    end

    class Fixed32Field < IntegerField
      def encoding = :fixed
      def bit_length = 32
      def signed = false
      def wire_type = 5
      def binary_pack = "V"
    end

    class SFixed32Field < IntegerField
      def encoding = :fixed
      def bit_length = 32
      def signed = true
      def wire_type = 5
      def binary_pack = "l"
    end

    class BoolField < UInt64Field
      def binary_decode_one(*)
        super != 0
      end

      def binary_encode_one(value, outbuf)
        super(value ? 1 : 0, outbuf)
      end

      def json_decode_one(value, _registry)
        case value
        when TrueClass, FalseClass
          value
        when "true"
          true
        when "false"
          false
        when NilClass
          nil
        else
          raise DecodeError, "expected boolean, got #{value.inspect}"
        end
      end

      def validate!(value, message)
        raise "expected boolean, got #{value.inspect}" unless [true, false].include?(value)

        super(value ? 1 : 0, message)
      end

      def default
        return [] if repeated?

        false
      end
    end

    class EnumField < Int32Field
      def initialize(number, name, cardinality:, enum_type:, json_name: name, oneof: nil, packed: false,
                     proto3_optional: cardinality == :optional)
        super(number, name, json_name: json_name, cardinality: cardinality, oneof: oneof,
                            enum_type: enum_type, proto3_optional: proto3_optional, packed: packed)
      end

      def binary_encode_one(value, outbuf)
        super(value.value, outbuf)
      end

      def binary_decode_one(io, _message, registry, wire_type)
        value = super
        registry.fetch(enum_type).decode(value)
      end

      def json_decode_one(value, registry)
        klass = registry.fetch(enum_type)
        klass.decode_json_hash(value, registry: registry)
      end

      def json_encode_one(value, print_unknown_fields:) # rubocop:disable Lint/UnusedMethodArgument
        value&.as_json
      end

      def default
        return [] if repeated?

        # TODO: enum_type.default
        0
      end

      def validate!(value, message)
        value = value.value if value.is_a?(Enum::InstanceMethods)
        super
      end
    end

    class DoubleField < Field
      def type = :double
      def binary_pack = "E"
      def wire_type = 1

      def initialize(number, name, cardinality:, json_name: name, oneof: nil, packed: false,
                     proto3_optional: cardinality == :optional)
        super(number, name, json_name: json_name, cardinality: cardinality, oneof: oneof,
                            proto3_optional: proto3_optional, packed: packed)
      end

      def binary_encode_one(value, outbuf)
        outbuf << [value].pack(binary_pack)
      end

      def binary_decode_one(io, _message, _registry, wire_type)
        value = BinaryEncoding.read_field_value(io, wire_type)
        value.unpack1(binary_pack)
      end

      def json_decode_one(value, _registry)
        case value
        when Float, NilClass
          value
        when Integer
          value.to_f
        when "Infinity"
          Float::INFINITY
        when "-Infinity"
          -Float::INFINITY
        when "NaN"
          Float::NAN
        when /\A-?\d+\z/
          Float(value)
        else
          raise DecodeError, "expected float for #{inspect}, got #{value.inspect}"
        end
      end

      def json_encode_one(value, print_unknown_fields:) # rubocop:disable Lint/UnusedMethodArgument
        if value.nan?
          "NaN"
        elsif (sign = value.infinite?)
          if sign == -1
            "-Infinity"
          else
            "Infinity"
          end
        else
          value
        end
      end

      def default
        return [] if repeated?

        0.0
      end
    end

    class FloatField < DoubleField
      def type = :float
      def binary_pack = "e"
      def wire_type = 5
    end

    class GroupField < Field
    end
  end
end
