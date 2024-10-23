# frozen_string_literal: true

require_relative "binary_encoding"

module Protobug
  class Field
    RUBY_KEYWORDS = %i[alias and begin break case class def do else elsif end ensure false for if in module next nil
                       not or redo rescue retry return self super then true undef unless until when while yield]
                    .to_h do |k|
      [k, :"__#{k}__"]
    end.freeze
    private_constant :RUBY_KEYWORDS

    attr_accessor :number, :name, :json_name, :cardinality, :oneof, :ivar, :setter,
                  :adder, :haser, :clearer, :escaped_name

    def initialize(number, name, json_name: nil, cardinality: :optional, oneof: nil, packed: false,
                   proto3_optional: cardinality == :optional, proto3_optional_count: nil,
                   default: nil)
      raise DefinitionError, "packed is only valid for repeated fields" if packed && cardinality != :repeated

      if proto3_optional && cardinality != :optional
        raise DefinitionError,
              "proto3_optional is only valid for optional fields"
      end

      raise DefinitionError, "default is only valid for singular scalar fields" if repeated? && default

      @number = number
      @name = name.to_sym
      @json_name = -(json_name || name.to_s)
      @cardinality = cardinality || raise(ArgumentError, "cardinality is required")
      @oneof = oneof
      @setter = :"#{name}="
      @adder = repeated? && !map? ? :"add_#{name}" : nil
      @ivar = :"@#{name}"
      @clearer = :"clear_#{name}"
      @haser = :"has_#{name}?"
      @packed = packed
      @proto3_optional = proto3_optional
      @escaped_name = RUBY_KEYWORDS.fetch(@name, @name)
      @escaped_name = :"__#{escaped_name}__" if @escaped_name.match?(/\A[A-Z]/)
      @proto3_optional_index = proto3_optional ? proto3_optional_count : nil
      @default = default
    end

    def to_s
      "#{map? ? :map : cardinality}(#{number}, #{name.inspect}, type: #{BY_TYPE.key(self.class).inspect})"
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

    def map?
      false
    end

    def group?
      false
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

    def method_definitions
      str = +"# frozen_string_literal: true\n"

      unless repeated?
        str << "def #{setter}(value)\n"
        str << "  return #{ivar}#{oneof && " = @#{oneof}"} = nil if value.nil?\n" if proto3_optional?
        str << validate_code
        str << "  @#{oneof} = #{name.inspect}\n" if oneof
        str << "  #{ivar} = value\n" \
               "end\n"
      end

      if !oneof && (!optional? || repeated?)
        str << "attr_reader #{name.inspect}\n"
      else
        str << "def #{name}\n" \
               "  value = #{ivar}\n"
        str << "  value = nil if @#{oneof} != #{name.inspect}\n" if oneof
        str << "  return value unless value.nil?\n"
        str << "  @#{oneof} = #{name.inspect}\n" if oneof
        str << "  #{ivar} = #{default_code}\n" \
               "end\n"
      end

      str << "def #{haser}\n"
      str << "  return false unless @#{oneof} == #{name.inspect}\n" if oneof
      str << "  value = #{ivar}\n" \
             "  return false if value.nil?"
      if (!optional? || !proto3_optional?) && !oneof && !repeated? && !is_a?(MessageField)
        str << " || #{default_code} == value"
      end
      str << "\n"
      str << if repeated?
               "  !value.empty?\n"
             else
               "  true\n"
             end
      str << "end\n"

      str << "def #{clearer}\n"
      str << "  @#{oneof} = nil\n" if oneof
      str << if repeated?
               "  #{ivar}.clear\n"
             else
               "  #{ivar} = nil\n"
             end
      str << "end\n"

      if adder
        str << "def #{adder}(value)\n" \
               "  existing = #{ivar}\n" \
               << validate_code
        str << "  existing << value\n" \
               "end\n"
      end

      if is_a?(EnumField) && !repeated?
        str << "def #{name}_case_name\n"
        str << "  #{enum_class}.names.fetch(#{ivar})\n"
        str << "end\n"
      end

      str
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

    def as_json_code
      ivar.name
    end

    def default_code
      return "[]" if repeated?

      default.inspect
    end

    def json_decode(value, message, ignore_unknown_fields)
      if repeated?
        return if value.nil?

        unless value.is_a?(Array)
          raise DecodeError,
                "expected Array for #{inspect}, got #{value.inspect}"
        end

        value.map do |v|
          v = json_decode_one(v, ignore_unknown_fields)
          raise DecodeError, "nil is invalid for repeated #{name} in #{message}" if v.nil?

          message.send(adder, v)
        end
      else
        value = json_decode_one(value, ignore_unknown_fields)
        message.send(setter, value) unless value.nil?
      end
    end

    def validate!(value, message)
      raise DecodeError, "nil is invalid for #{name} in #{message}" if value.nil?
    end

    def validate_code
      <<~RUBY
        raise Protobug::InvalidValueError.new(self, #{name.name.dump}, value) unless value.is_a?(#{expected_class})
      RUBY
    end

    private

    def binary_encode_packed(value, outbuf)
      BinaryEncoding.encode_varint (number << 3) | 2, outbuf

      BinaryEncoding.encode_length(value.each_with_object("".b) do |v, buf|
        binary_encode_one(v, buf)
      end, outbuf)
    end

    class MessageField < Field
      attr_reader :message_class

      def initialize(number, name, message_class: nil, **kwargs)
        super(number, name, **kwargs)
        @message_class = message_class
      end

      def binary_encode_one(value, outbuf)
        BinaryEncoding.encode_length value.class.encode(value), outbuf
      end

      def json_decode_one(value, ignore_unknown_fields)
        Object.const_get(message_class).decode_json_hash(value, ignore_unknown_fields: ignore_unknown_fields)
      end

      def default
        return [] if repeated?

        # TODO: message_type.default
        nil
      end

      def wire_type
        2
      end

      def binary_decode_code(protobug_read_varint)
        raise DefinitionError, "can't decode message field #{self} without message_class" unless message_class

        fetch = "#{message_class}.allocate.__protobug_initialize_defaults"
        fetch = "#{ivar} || #{fetch}" unless repeated?
        <<~RUBY
          length = #{protobug_read_varint}
          #{ivar} #{adder ? :<< : :"="} (#{fetch}).__protobug_binary_decode(binary, index, index += length)
        RUBY
      end

      def expected_class
        message_class
      end

      def as_json_code
        repeated? ? %(#{ivar}.map(&:as_json)) : %(#{ivar}.as_json)
      end

      def default_code
        "#{message_class}.allocate.__protobug_initialize_defaults"
      end
    end

    class MapField < MessageField
      SUPER_INITIALIZE = instance_method(:initialize).super_method
      def initialize(number, name, key_type:, value_type:, # rubocop:disable Lint/MissingSuper,
                     enum_class: nil, message_class: nil, **kwargs)

        SUPER_INITIALIZE.bind_call(
          self, number, name,
          **kwargs,
          cardinality: :repeated
        )

        @map_class = Class.new do
          extend Protobug::Message

          optional(1, "key", type: key_type, proto3_optional: false)
          value_type_kwargs = { enum_class: enum_class, message_class: message_class }
          value_type_kwargs.compact!
          optional(2, "value", type: value_type, **value_type_kwargs, proto3_optional: false)
        end
      end

      def default_code
        "{}"
      end

      def default
        {}
      end

      def repeated?
        true
      end

      def map?
        true
      end

      def binary_encode(value, outbuf)
        key_field, value_field = @map_class.fields_by_number.values_at(1, 2)
        scratch = +"".b
        value.each do |k, v|
          key_field.binary_encode(k, scratch)
          value_field.binary_encode(v, scratch) unless v.nil?
          BinaryEncoding.encode_varint (number << 3) | wire_type, outbuf
          BinaryEncoding.encode_length scratch, outbuf
          scratch.clear
        end
      end

      def json_decode(value, message, ignore_unknown_fields)
        return if value.nil?

        unless value.is_a?(Hash)
          raise DecodeError,
                "expected Hash for #{inspect}, got #{value.inspect}"
        end

        value.each do |k, v|
          entry = @map_class.decode_json_hash(
            { "key" => k, "value" => v },
            ignore_unknown_fields: ignore_unknown_fields
          )
          # can't use haser because default values should also be counted...
          if entry.instance_variable_get(:@value).nil?
            next if ignore_unknown_fields && @map_class.fields_by_name.fetch("value").is_a?(EnumField)

            raise DecodeError, "nil values are not allowed in map #{name} in #{message.class}"
          end

          message.send(name)[entry.key] = entry.value
        end
      end

      def binary_decode_code(protobug_read_varint)
        key_field, value_field = @map_class.fields_by_number.values_at(1, 2)
        <<~RUBY
          kv_length = #{protobug_read_varint}
          kv_max = index + kv_length
          kv_key = #{key_field.default.inspect}
          kv_value = #{value_field.default.inspect}
          while index < kv_max
            kv_header = #{protobug_read_varint}
            case kv_header
            when #{0b1000 | key_field.wire_type}
              #{key_field.binary_decode_code(protobug_read_varint).gsub("@key", "kv_key")}
            when #{0b10000 | value_field.wire_type}
              #{value_field.binary_decode_code(protobug_read_varint).gsub("@value", "kv_value")}
            else
              raise "unknown map field \#{kv_header} \#{kv_length}"
            end
          end
          raise EOFError unless index == kv_max
          #{@ivar}[kv_key] = kv_value || #{value_field.default_code}
        RUBY
      end

      def as_json_code
        _key_field, value_field = @map_class.fields_by_number.values_at(1, 2)
        if value_field.is_a?(MessageField)
          "#{ivar}.transform_values(&:as_json)"
        elsif value_field.is_a?(EnumField)
          "#{ivar}.transform_values { |value| #{value_field.enum_class}.as_json(value) }"
        else
          "#{ivar}.transform_values { #{value_field.as_json_code.gsub("@value", "_1")}}"
        end
      end

      def expected_class
        Hash
      end
    end

    class BytesField < Field
      def binary_encode_one(value, outbuf)
        BinaryEncoding.encode_length value.b, outbuf
      end

      def json_decode_one(value, _ignore_unknown_fields)
        return nil if value.nil?

        # url decode 64
        value.tr!("-_", "+/")
        begin
          value = value.unpack1("m").force_encoding(Encoding::BINARY)
        rescue ArgumentError => e
          raise DecodeError, "Invalid URL-encoded base64 #{value.inspect} for #{inspect}: #{e}"
        end

        value
      end

      def as_json_code
        if repeated?
          %(#{ivar}.map { [_1].pack("m0") })
        else
          "[#{ivar}].pack(\"m0\")"
        end
      end

      def default
        return [] if repeated?

        @default || "".b
      end

      def default_code
        '"".b'
      end

      def wire_type
        2
      end

      def binary_decode_code(protobug_read_varint)
        <<~RUBY
          length = #{protobug_read_varint}
          value = binary.byteslice(index, length)
          #{ivar} #{adder ? :<< : :"="} value
          index += length
        RUBY
      end

      def expected_class
        String
      end
    end

    class StringField < BytesField
      def binary_encode_one(value, outbuf)
        value = value.encode("utf-8") if value.encoding != Encoding::UTF_8
        super
      end

      def json_decode_one(value, _ignore_unknown_fields)
        return nil if value.nil?
        raise DecodeError, "expected string, got #{value.inspect}" unless value.is_a?(String)

        value.force_encoding(Encoding::UTF_8) if value.encoding != Encoding::UTF_8
        raise DecodeError, "invalid utf-8 for string" unless value.valid_encoding?

        value
      end

      def default
        return [] if repeated?

        @default || +""
      end

      def default_code
        '+""'
      end

      def binary_decode_code(protobug_read_varint)
        <<~RUBY
          length = #{protobug_read_varint}
          value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
          raise Protobug::DecodeError, "invalid UTF-8 in string \#{value.inspect}" unless value.valid_encoding?
          #{ivar} #{adder ? :<< : :"="} value
          index += length
        RUBY
      end

      def as_json_code
        ivar.name
      end
    end

    class IntegerField < Field
      def default
        return [] if repeated?

        @default || 0
      end

      def binary_decode_code(protobug_read_varint)
        if encoding == :zigzag
          length_mask = " & 0x#{(1 << bit_length).pred.to_s(16)}" if bit_length < 64
          <<~RUBY
            value = #{protobug_read_varint.chomp}#{length_mask}
            #{ivar} #{adder ? :<< : :"="} (if value.even?
              value >> 1
            else
              -((value + 1) >> 1)
            end)
          RUBY
        elsif encoding == :fixed
          "#{ivar} #{adder ? :<< : :"="} binary.unpack1(#{binary_pack.dump}, offset: index)\n" \
            "index += #{bit_length / 8}\n"
        elsif signed
          sign_mask = bit_length == 32 ? "0x8000_0000" : "0x8000_0000_0000_0000"
          length_mask = bit_length == 32 ? "0x7FFF_FFFF" : "0x7fff_ffff_ffff_ffff"
          <<~RUBY
            value = #{protobug_read_varint.chomp}
            #{ivar} #{adder ? :<< : :"="} (if (value & #{sign_mask}) != 0
              -(((value & #{length_mask}) ^ #{length_mask}) + 1)
            else
              value & #{length_mask}
            end)
          RUBY
        else
          length_mask = " & 0x#{(1 << bit_length).pred.to_s(16)}" if bit_length < 64
          <<~RUBY
            #{ivar} #{adder ? :<< : :"="} (#{protobug_read_varint.chomp}#{length_mask})
          RUBY
        end
      end

      def binary_encode_one(value, outbuf)
        case encoding
        when :zigzag
          BinaryEncoding.encode_zigzag bit_length, value, outbuf
        when :varint
          BinaryEncoding.encode_varint value, outbuf
        when :fixed
          [value].pack(binary_pack, buffer: outbuf)
        end
      end

      def json_decode_one(value, _ignore_unknown_fields)
        return nil if value.nil?

        case value
        when Integer
          # nothing
        when /\A-?\d+\z/
          value = Integer(value)
        when Float
          value, remainder = value.divmod(1)
          raise DecodeError, "expected integer for #{inspect}, got #{value.inspect}" unless remainder == 0
        else
          raise DecodeError, "expected integer for #{inspect}, got #{value.inspect}"
        end
        raise DecodeError, "#{value.inspect} does not fit in 64 bits" if value && value.bit_length > 64

        value
      end

      def maximum
        if signed
          (2**(bit_length - 1)) - 1
        else
          (2**bit_length) - 1
        end
      end

      def minimum
        if signed
          -(2**(bit_length - 1))
        else
          0
        end
      end

      def validate!(value, message)
        raise InvalidValueError.new(message, name, value, "expected integer") unless value.is_a?(Integer)

        if value < minimum || value >= maximum
          raise InvalidValueError.new(message, name, value, "does not fit into [#{minimum}, #{maximum})")
        end

        super
      end

      def validate_code
        super +
          <<~RUBY
            raise Protobug::InvalidValueError.new(self, #{name.name.dump}, value, "does not fit into [#{minimum}, #{maximum}]") unless value <= #{maximum} && value >= #{minimum}
          RUBY
      end

      def expected_class
        Integer
      end

      def as_json_code
        if bit_length < 64
          super
        elsif repeated?
          "#{ivar}.map(&:to_s)"
        else
          "#{ivar}.to_s"
        end
      end
    end

    # encoding: fixed, varint, zigzag
    # bitlength: 32, 64
    # signed: true, false
    # EXCEPT: no unsigned zigzag
    class Int64Field < IntegerField
      def encoding
        :varint
      end

      def bit_length
        64
      end

      def signed
        true
      end

      def wire_type
        0
      end
    end

    class UInt64Field < IntegerField
      def encoding
        :varint
      end

      def bit_length
        64
      end

      def signed
        false
      end

      def wire_type
        0
      end
    end

    class SInt64Field < IntegerField
      def encoding
        :zigzag
      end

      def bit_length
        64
      end

      def signed
        true
      end

      def wire_type
        0
      end
    end

    class Fixed64Field < IntegerField
      def encoding
        :fixed
      end

      def bit_length
        64
      end

      def signed
        false
      end

      def wire_type
        1
      end

      def binary_pack
        "Q"
      end
    end

    class SFixed64Field < IntegerField
      def encoding
        :fixed
      end

      def bit_length
        64
      end

      def signed
        true
      end

      def wire_type
        1
      end

      def binary_pack
        "q"
      end
    end

    class Int32Field < IntegerField
      def encoding
        :varint
      end

      def bit_length
        32
      end

      def signed
        true
      end

      def wire_type
        0
      end
    end

    class UInt32Field < IntegerField
      def encoding
        :varint
      end

      def bit_length
        32
      end

      def signed
        false
      end

      def wire_type
        0
      end
    end

    class SInt32Field < IntegerField
      def encoding
        :zigzag
      end

      def bit_length
        32
      end

      def signed
        true
      end

      def wire_type
        0
      end
    end

    class Fixed32Field < IntegerField
      def encoding
        :fixed
      end

      def bit_length
        32
      end

      def signed
        false
      end

      def wire_type
        5
      end

      def binary_pack
        "V"
      end
    end

    class SFixed32Field < IntegerField
      def encoding
        :fixed
      end

      def bit_length
        32
      end

      def signed
        true
      end

      def wire_type
        5
      end

      def binary_pack
        "l"
      end
    end

    class BoolField < UInt64Field
      def binary_encode_one(value, outbuf)
        super(value ? 1 : 0, outbuf)
      end

      def json_decode_one(value, _ignore_unknown_fields)
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

      def validate_code
        <<~RUBY
          raise InvalidValueError.new(self, #{name.name.dump}, value, "expected boolean") unless true == value || false == value
        RUBY
      end

      def default
        return [] if repeated?

        @default || false
      end

      def binary_decode_code(protobug_read_varint)
        <<~RUBY
          value = #{protobug_read_varint}
          #{ivar} #{adder ? :<< : :"="} (value != 0)
        RUBY
      end
    end

    class EnumField < Int32Field
      attr_reader :enum_class

      def initialize(number, name, enum_class: nil, **kwargs)
        super(number, name, **kwargs)
        @enum_class = enum_class
      end

      def json_decode(value, message, ignore_unknown_fields)
        return super unless ignore_unknown_fields

        if repeated?
          return if value.nil?

          unless value.is_a?(Array)
            raise DecodeError,
                  "expected Array for #{inspect}, got #{value.inspect}"
          end

          value.map do |v|
            v = json_decode_one(v, ignore_unknown_fields)
            next if v.nil?

            message.send(adder, v)
          end.tap(&:compact!)
        else
          value = json_decode_one(value, ignore_unknown_fields)
          message.send(setter, value) unless value.nil?
        end
      end

      def json_decode_one(value, ignore_unknown_fields)
        Object.const_get(enum_class).decode_json_hash(value, ignore_unknown_fields: ignore_unknown_fields)
      end

      def default
        return [] if repeated?

        # TODO: enum_type.default
        @default || 0
      end

      def as_json_code
        if repeated?
          "#{ivar}.map { |value| #{enum_class}.as_json(value) }"
        else
          "#{enum_class}.as_json(#{ivar})"
        end
      end
    end

    class DoubleField < Field
      def binary_pack
        "E"
      end

      def wire_type
        1
      end

      def binary_encode_one(value, outbuf)
        [value].pack(binary_pack, buffer: outbuf)
      end

      def json_decode_one(value, _ignore_unknown_fields)
        case value
        when Float
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
        when NilClass
          nil
        else
          raise DecodeError, "expected float for #{inspect}, got #{value.inspect}"
        end
      end

      def as_json_code
        code = <<~RUBY
          if #{repeated? ? "value" : "(value = #{ivar.name})"}.nan?
            "NaN"
          elsif (sign = value.infinite?)
            sign == -1 ? "-Infinity" : "Infinity"
          else
            value
          end
        RUBY
        if repeated?
          <<~RUBY
            #{ivar}.map do |value|
              #{code}
            end
          RUBY
        else
          code
        end.chomp
      end

      def default
        return [] if repeated?

        @default || 0.0
      end

      def binary_decode_code(_)
        <<~RUBY
          #{ivar} #{adder ? :<< : :"="} binary.unpack1(#{binary_pack.dump}, offset: index)
          index += #{wire_type == 1 ? 8 : 4}
        RUBY
      end

      def expected_class
        Float
      end
    end

    class FloatField < DoubleField
      def binary_pack
        "e"
      end

      def wire_type
        5
      end
    end

    class GroupField < Field
      def wire_type
        3
      end

      def binary_decode_code(_)
        <<~RUBY
          raise UnsupportedFeatureError.new(:group, "reading groups from binary protos (in \#{self})")
        RUBY
      end

      def default
        nil
      end

      def group?
        true
      end

      def validate_code
        "raise UnsupportedFeatureError.new(:group, \"setting group\")\n"
      end
    end

    BY_TYPE = {
      message: Field::MessageField,
      enum: Field::EnumField,
      bytes: Field::BytesField,
      string: Field::StringField,
      map: Field::MapField,
      int64: Field::Int64Field,
      uint64: Field::UInt64Field,
      sint64: Field::SInt64Field,
      fixed64: Field::Fixed64Field,
      sfixed64: Field::SFixed64Field,
      int32: Field::Int32Field,
      uint32: Field::UInt32Field,
      sint32: Field::SInt32Field,
      fixed32: Field::Fixed32Field,
      sfixed32: Field::SFixed32Field,
      bool: Field::BoolField,
      float: Field::FloatField,
      double: Field::DoubleField,
      group: Field::GroupField
    }.freeze
  end
end
