# frozen_string_literal: true

require_relative "binary_encoding"
require_relative "errors"
require_relative "field"
require "stringio"

module Protobug
  class << self
    attr_reader :known_type_names

    def resolve_known_type(name)
      known_type_names.fetch(name) do
        raise KeyError.new("unknown type name. known: #{known_type_names.keys}", receiver: known_type_names, key: name)
      end
    end
  end
  @known_type_names = {}

  module Message
    def self.extended(base)
      base.class_eval do
        @full_name = nil
        @declared_fields = []
        @fields_by_number = {}
        @fields_by_json_name = {}
        @fields_by_name = {}
        @reserved_ranges = []
        @oneofs = {}
        extend BaseDescriptor
        include Protobug::Message::InstanceMethods

        base.include(base.send(:__protobug_module__))
      end
    end

    attr_reader :declared_fields, :fields_by_number, :fields_by_name, :fields_by_json_name, :reserved_ranges, :oneofs

    def freeze
      declared_fields.freeze
      fields_by_number.freeze
      fields_by_name.freeze
      fields_by_json_name.freeze
      full_name.freeze
      reserved_ranges.freeze
      oneofs.each_value(&:freeze)
      oneofs.freeze
      super
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
      if kwargs[:type] && kwargs[:type] != :map
        raise DefinitionError,
              "expected type: :map, got #{kwargs[:type].inspect}"
      end
      repeated(number, name, type: :map, **kwargs)
    end

    def required(number, name, **kwargs)
      if kwargs[:cardinality] && kwargs[:cardinality] != :required
        raise DefinitionError,
              "expected cardinality: :required, got #{kwargs[:cardinality].inspect}"
      end
      field(number, name, cardinality: :required, **kwargs)
    end

    def reserved_range(range)
      raise DefinitionError, "expected Range, got #{range.inspect}" unless range.is_a? Range

      reserved_ranges << range
    end

    def decode_json(json, ignore_unknown_fields: false)
      require "json"
      hash = begin
        JSON.parse(json, allow_blank: false, create_additions: false, allow_nan: false, allow_infinity: false)
      rescue JSON::ParserError => e
        raise DecodeError, "JSON failed to parse: #{e.message}"
      end
      raise DecodeError, "expected hash, got #{hash.inspect}" unless hash.is_a? Hash

      decode_json_hash(hash, ignore_unknown_fields: ignore_unknown_fields)
    end

    def decode_json_hash(json, ignore_unknown_fields: false)
      return if json.nil?
      raise DecodeError, "expected hash for #{self} (#{full_name}), got #{json.inspect}" unless json.is_a? Hash

      message = new

      json.each do |key, value|
        field = fields_by_json_name[key]
        unless field
          next if ignore_unknown_fields

          raise(UnknownFieldError, "unknown field #{key.inspect} in #{full_name}")
        end

        if field.oneof && message.send(field.oneof) && !value.nil?
          raise DecodeError, "multiple oneof fields set in #{full_name}: #{message.send(field.oneof)} and #{field.name}"
        end

        field.json_decode(value, message, ignore_unknown_fields)
      end

      message
    end

    def encode(message)
      raise EncodeError, "expected #{self}, got #{message.inspect}" unless message.is_a? self

      buf = declared_fields.each_with_object("".b) do |field, outbuf|
        next unless message.send(field.haser)

        value = message.instance_variable_get(field.ivar)

        field.binary_encode(value, outbuf)
      end
      message.unknown_fields&.each_with_object(buf) do |(number, wire_type, value), outbuf|
        BinaryEncoding.encode_varint((number << 3) | wire_type, outbuf)
        case wire_type
        when 0, 5
          BinaryEncoding.encode_varint(value, outbuf)
        when 2
          BinaryEncoding.encode_length(value, outbuf)
        else
          raise EncodeError, "unknown wire_type: #{wire_type}"
        end
      end
      buf
    end

    def decode(binary)
      new.__protobug_binary_decode(binary, 0, binary.bytesize)
    rescue NoMethodError => e
      raise EOFError if e.receiver.nil? && e.name == :<

      raise
    end

    def field(number, name, type:, **kwargs)
      raise ArgumentError unless number.is_a? Integer

      case name
      when String
        # OK
      when Symbol
        name = name.name
      else
        raise ArgumentError, "expected String or Symbol for name, got #{name.inspect}"
      end

      field =
        case type
        when :message
          Field::MessageField
        when :enum
          Field::EnumField
        when :bytes
          Field::BytesField
        when :string
          Field::StringField
        when :map
          kwargs.delete(:cardinality) if kwargs[:cardinality] == :repeated
          Field::MapField
        when :int64
          Field::Int64Field
        when :uint64
          Field::UInt64Field
        when :sint64
          Field::SInt64Field
        when :fixed64
          Field::Fixed64Field
        when :sfixed64
          Field::SFixed64Field
        when :int32
          Field::Int32Field
        when :uint32
          Field::UInt32Field
        when :sint32
          Field::SInt32Field
        when :fixed32
          Field::Fixed32Field
        when :sfixed32
          Field::SFixed32Field
        when :bool
          Field::BoolField
        when :float
          Field::FloatField
        when :double
          Field::DoubleField
        when :group
          Field::GroupField
        else
          raise ArgumentError, "Unknown field type #{type.inspect}"
        end.new(number, name, **kwargs, proto3_optional_count: declared_fields.count(&:proto3_optional?)).freeze

      raise DefinitionError, "duplicate field number #{number}" if fields_by_number[number]
      raise DefinitionError, "duplicate field name #{name}" if fields_by_name[name]

      declared_fields << field unless field.group?
      fields_by_number[number] = field
      fields_by_name[name] = field

      fields_by_json_name[name] = field
      fields_by_json_name[field.json_name] = field

      raise DefinitionError, "field number #{number} is reserved" if reserved_ranges.any? do |range|
                                                                       range.cover? number
                                                                     end

      raise DefinitionError, "too many optional fields" if declared_fields.count(&:proto3_optional?) > 64

      __protobug_module__.module_eval(__protobug_instance_method_definitions__,
                                      "(instance method definitions for #{self})")
      __protobug_module__.module_eval(field.method_definitions, "(field #{field} for #{self})")

      return unless field.oneof

      unless (oneof = oneofs[field.oneof])
        oneofs[field.oneof] = oneof = []
      end
      oneof << field
    end

    def __protobug_module__
      name = "Protobug::Message(#{full_name.inspect})"
      @__protobug_module__ ||= Module.new do
        set_temporary_name(name) if respond_to?(:set_temporary_name)
      end
    end

    def __protobug_read_varint__
      <<~RUBY
        if (byte0 = binary.getbyte(index)) < 0x80
          index += 1
          byte0
        elsif (byte1 = binary.getbyte(index + 1)) < 0x80
          index += 2
          (byte1 << 7) | (byte0 & 0x7F)
        elsif (byte2 = binary.getbyte(index + 2)) < 0x80
          index += 3
          (byte2 << 14) |
            ((byte1 & 0x7F) << 7) |
            (byte0 & 0x7F)
        elsif (byte3 = binary.getbyte(index + 3)) < 0x80
          index += 4
          (byte3 << 21) |
            ((byte2 & 0x7F) << 14) |
            ((byte1 & 0x7F) << 7) |
            (byte0 & 0x7F)
        elsif (byte4 = binary.getbyte(index + 4)) < 0x80
          index += 5
          (byte4 << 28) |
            ((byte3 & 0x7F) << 21) |
            ((byte2 & 0x7F) << 14) |
            ((byte1 & 0x7F) << 7) |
            (byte0 & 0x7F)
        elsif (byte5 = binary.getbyte(index + 5)) < 0x80
          index += 6
          (byte5 << 35) |
            ((byte4 & 0x7F) << 28) |
            ((byte3 & 0x7F) << 21) |
            ((byte2 & 0x7F) << 14) |
            ((byte1 & 0x7F) << 7) |
            (byte0 & 0x7F)
        elsif (byte6 = binary.getbyte(index + 6)) < 0x80
          index += 7
          (byte6 << 42) |
            ((byte5 & 0x7F) << 35) |
            ((byte4 & 0x7F) << 28) |
            ((byte3 & 0x7F) << 21) |
            ((byte2 & 0x7F) << 14) |
            ((byte1 & 0x7F) << 7) |
            (byte0 & 0x7F)
        elsif (byte7 = binary.getbyte(index + 7)) < 0x80
          index += 8
          (byte7 << 49) |
            ((byte6 & 0x7F) << 42) |
            ((byte5 & 0x7F) << 35) |
            ((byte4 & 0x7F) << 28) |
            ((byte3 & 0x7F) << 21) |
            ((byte2 & 0x7F) << 14) |
            ((byte1 & 0x7F) << 7) |
            (byte0 & 0x7F)
        elsif (byte8 = binary.getbyte(index + 8)) < 0x80
          index += 9
          (byte8 << 56) |
            ((byte7 & 0x7F) << 49) |
            ((byte6 & 0x7F) << 42) |
            ((byte5 & 0x7F) << 35) |
            ((byte4 & 0x7F) << 28) |
            ((byte3 & 0x7F) << 21) |
            ((byte2 & 0x7F) << 14) |
            ((byte1 & 0x7F) << 7) |
            (byte0 & 0x7F)
        elsif (byte9 = binary.getbyte(index + 9)) < 0x80
          index += 10
          (byte9 << 63) |
            ((byte8 & 0x7F) << 56) |
            ((byte7 & 0x7F) << 49) |
            ((byte6 & 0x7F) << 42) |
            ((byte5 & 0x7F) << 35) |
            ((byte4 & 0x7F) << 28) |
            ((byte3 & 0x7F) << 21) |
            ((byte2 & 0x7F) << 14) |
            ((byte1 & 0x7F) << 7) |
            (byte0 & 0x7F)
        end
      RUBY
    end

    def __protobug_instance_method_definitions__
      str = +"# frozen_string_literal: true\n" \
             "def initialize(\n"
      declared_fields.each do |field|
        str << "  #{field.escaped_name}: #{if field.map?
                                             "{}"
                                           elsif field.repeated?
                                             "[]"
                                           else
                                             (field.optional? || field.oneof ? :nil : field.default.inspect)
                                           end},\n"
      end
      str.delete_suffix!(",\n")
      str << "\n)\n" \
             "  @unknown_fields = nil\n"
      str << "  @__proto3_optional = 0,\n" if declared_fields.any?(&:proto3_optional?)
      oneofs.each do |name, fields|
        next unless fields.size > 1

        str << "  @#{name} = nil\n"
      end
      declared_fields.each do |field|
        str << "  #{field.ivar} = #{field.escaped_name}\n"
        next unless field.oneof && (oneofs[field.oneof]&.size&.> 1) && oneofs[field.oneof].first != field

        str << "  unless #{field.escaped_name}.nil?\n" \
               "    raise ArgumentError, \" #{field.oneof} is a oneof, but \#{@#{field.oneof}} and " \
               "#{field.escaped_name} were both given\" if @#{field.oneof}\n" \
               "    @#{field.oneof} = #{field.name.inspect}\n" \
               "  end\n"
      end

      str << "end\n"
      oneofs.each_key do |name|
        str << "attr_reader :#{name}\n"
      end
      str << "def hash\n" \
             "  [#{full_name&.dump || :nil}, #{declared_fields.map(&:ivar).join(", ")}].hash\n" \
             "end\n"

      str << "def __protobug_binary_decode(binary, index, max)\n" \
             "  return self if index == max\n" \
             "  header = #{__protobug_read_varint__}\n" \
             "  raise EOFError, \"message contains only tag with no values\" if index >= max\n" \
             "  found = true\n" \
             "  while true\n"

      cases = {}

      str << <<~RUBY
        raise EOFError, "premature EOF after tag before value (index \#{index})" if index >= max
        unless found
          wire_type = header & 0b111
          number = (header ^ wire_type) >> 3
          unless number > 0
            raise DecodeError,
              "unexpected field number \#{number} in \#{self.class.full_name || self.class.fields_by_name.inspect}"
          end
          value = case wire_type
          when 0
            #{__protobug_read_varint__}
          when 1
            index += 8
            binary.byteslice(index - 8, 8)
          when 2
            length = #{__protobug_read_varint__}

            index += length
            binary.byteslice(index - length , length)
          when 3, 4
            raise GroupsUnsupportedError.new(self)
          when 5
            index += 4
            binary.byteslice(index - 4, 4)
          else
            raise DecodeError, "unsupported wire type \#{wire_type}"
          end
          (@unknown_fields ||= []) << [number, wire_type, value]
          return self if index == max
          header = #{__protobug_read_varint__}
        end
      RUBY

      str << "found = false\n"

      declared_fields.each do |field|
        number = field.number
        header = (number << 3) | field.wire_type
        case_s = "# #{field}\n" <<
                 field.binary_decode_code(__protobug_read_varint__)
        case_s << "  @#{field.oneof} = #{field.name.inspect}\n" if field.oneof

        cases[header] = [field.repeated? && field, case_s]

        next unless field.repeated? && [0, 1, 5].include?(field.wire_type)

        header = (number << 3) | 2
        case_s = "# #{field} packed\n"

        case_s << "@#{field.oneof} = #{field.name.inspect}\n" if field.oneof
        case_s << "packed_length = #{__protobug_read_varint__}\n" \
                  "packed_max = index + packed_length\n" \
                  "list = #{field.ivar}\n" \
                  "while index < packed_max\n" <<
          field.binary_decode_code(__protobug_read_varint__).gsub(field.ivar.name, "list")

        case_s << "end\n" \
                  "raise EOFError unless index == packed_max\n"
        cases[header] = [false, case_s]
      end
      cases.sort_by(&:first).each do |header, (repeated, s)|
        str <<
          if repeated
            s.gsub!(/^/m, "    ")
            s.gsub!(repeated.ivar.name, "list")
            <<~RUBY
              if header == 0x#{header.to_s(16)}
                found = true
                list = #{repeated.ivar}
                while true
                  #{s}
                  return self if index == max
                  header = #{__protobug_read_varint__}
                  break unless header == 0x#{header.to_s(16)}
                end

                return self if index == max
              end
            RUBY
          else
            s.gsub!(/^/m, "  ")
            <<~RUBY
              if header == 0x#{header.to_s(16)}
                found = true
                #{s}
                return self if index == max
                header = #{__protobug_read_varint__}
              end
            RUBY
          end
      end

      str << "  end\n" \
             "  raise EOFError, \"index \#{index} != max \#{max}\" unless index == max\n" \
             "  self\n" \
             "end\n"

      str << "def __protobug_initialize_defaults\n" \
             "  @unknown_fields = nil\n"
      str << "  @__proto3_optional = 0\n" if declared_fields.any?(&:proto3_optional?)
      oneofs.each do |name, fields|
        next unless fields.size > 1

        str << "  @#{name} = nil\n"
      end

      declared_fields.each do |field|
        str << "  #{field.ivar} = #{if field.map?
                                      "{}"
                                    elsif field.repeated?
                                      "[]"
                                    else
                                      (field.optional? || field.oneof ? :nil : field.default.inspect)
                                    end}\n"
      end

      str << "  self\n" \
             "end\n"
    end

    module InstanceMethods
      def ==(other)
        return false unless other.is_a? Protobug::Message::InstanceMethods

        self.class.full_name == other.class.full_name &&
          self.class.fields_by_name.all? do |name, _|
            send(name) == other.send(name)
          end
      end
      alias eql? ==

      def initialize
        @unknown_fields = nil
      end

      def __protobug_initialize_defaults
        @unknown_fields = nil
        self
      end

      attr_reader :unknown_fields

      def pretty_print(pp)
        fields_with_values = self.class.fields_by_name.select do |_name, field|
          send(field.haser)
        end
        pp.group 2, "#{self.class}.new(", ")" do
          pp.seplist(fields_with_values) do |(name, field)|
            pp.nest 2 do
              pp.text "#{name}:"
              pp.breakable
              pp.pp send(field.name)
            end
          end
        end
      end

      def hash
        self.class.full_name.hash
      end

      def to_text
        fields_with_values = self.class.fields_by_name.select do |_name, field|
          send(field.haser)
        end

        fields_with_values.map do |_name, field|
          value = send(field.name)
          field.to_text(value)
        end.join("\n")
      end

      def to_proto
        self.class.encode(self)
      end

      def as_json(print_unknown_fields: false)
        fields_with_values = self.class.fields_by_name.select do |_name, field|
          send(field.haser)
        end

        fields_with_values.to_h do |_name, field|
          value = send(field.name)

          [field.json_name, field.json_encode(value, print_unknown_fields: print_unknown_fields)]
        end
      end

      def to_json(print_unknown_fields: false)
        require "json"
        JSON.generate(as_json(print_unknown_fields: print_unknown_fields), allow_infinity: true)
      rescue JSON::GeneratorError => e
        raise EncodeError, "failed to generate JSON: #{e}"
      end
    end
  end
end
