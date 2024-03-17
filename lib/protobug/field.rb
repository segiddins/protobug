# frozen_string_literal: true

module Protobug
  class Field
    attr_accessor :number, :name, :type, :json_name, :cardinality, :oneof, :ivar, :setter, :message_type, :enum_type,
                  :adder

    def initialize(number, name, type: nil, json_name: nil, cardinality: :optional, oneof: nil, message_type: nil,
                   enum_type: nil, packed: false, key_type: nil, value_type: nil, group_type: nil,
                   proto3_optional: cardinality == :optional)
      raise "message_type only allowed for message fields" if !!message_type ^ type == :message
      raise "enum_type only allowed for enum fields" if !!enum_type ^ type == :enum
      raise "key_type only allowed for map fields" if !!key_type ^ type == :map
      raise "value_type only allowed for map fields" if !!value_type ^ type == :map
      raise "group_type only allowed for group fields" if !!group_type ^ type == :group

      @number = number
      @name = name.to_sym
      @type = type
      @json_name = json_name || name.to_s
      @cardinality = cardinality || raise
      @oneof = oneof
      @setter = :"#{name}="
      @adder = :"add_#{name}" if repeated?
      @ivar = :"@#{name}"
      @message_type = message_type
      @enum_type = enum_type
      @packed = packed
      @proto3_optional = proto3_optional
    end

    def pretty_print(pp)
      pp.group 0, "#{self.class}.new(", ")" do
        pp.text @number.to_s
        pp.breakable(", ")
        pp.text(@name.inspect)
        pp.breakable(", ")
        pp.text("type: ")
        pp.pp @type
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

    def default
      return [] if repeated?

      case type
      when :int32, :int64, :uint32, :uint64, :sint32, :sint64, :fixed32, :fixed64, :sfixed32, :sfixed64
        0
      when :string
        ""
      when :message
        nil
      when :bytes
        "".b
      when :enum
        # enum_type.default
        0
      when :float, :double
        0.0
      when :bool
        false
      else
        raise "unhandled type in #{self}.#{__method__}: #{type.inspect}"
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
            Protobug::Message::BinaryEncoding.encode_varint (number << 3) | wire_type, outbuf
            binary_encode_one(v, outbuf)
          end
        end
      elsif (!optional? || !proto3_optional?) && !oneof && default == value
        # omit
      else
        Protobug::Message::BinaryEncoding.encode_varint (number << 3) | wire_type, outbuf
        binary_encode_one(value, outbuf)
      end
    end

    def binary_decode(binary, message, registry, wire_type)
      raise UnsupportedFeatureError.new(:map, "#{self}.#{__method__}") if type == :map

      if repeated? && wire_type == 2 && [0, 1, 5].include?(self.wire_type)
        len = StringIO.new(Protobug::Message::BinaryEncoding.decode_length(binary))
        len.binmode

        message.send(adder, binary_decode_one(len, registry, self.wire_type)) until len.eof?
      elsif wire_type != self.wire_type
        raise "wrong wire type for #{self}: #{wire_type.inspect}"
      else
        message.send(adder || setter, binary_decode_one(binary, registry, wire_type))
      end
    end

    def json_encode(value)
      if repeated?
        value.map { |v| json_encode_one(v) }
      elsif (!optional? || !proto3_optional?) && !oneof && default == value
        # omit
      else
        json_encode_one(value)
      end
    end

    def json_decode(value, message, registry)
      raise UnsupportedFeatureError.new(:map, "#{self}.#{__method__}") if type == :map

      if repeated?
        return if value.nil?
        raise DecodeError, "expected Array for #{inspect}, got #{value.inspect}" unless value.is_a?(Array)

        value.map { |v| message.send(adder, json_decode_one(v, registry)) }
      else
        message.send(setter, json_decode_one(value, registry))
      end
    end

    private

    def binary_encode_packed(value, outbuf)
      return if value.empty?

      Protobug::Message::BinaryEncoding.encode_varint (number << 3) | 2, outbuf

      Protobug::Message::BinaryEncoding.encode_length(value.each_with_object("".b) do |v, buf|
        binary_encode_one(v, buf)
      end, outbuf)
    end

    def binary_encode_one(value, outbuf)
      case type
      when :int32, :int64, :uint32, :uint64
        Protobug::Message::BinaryEncoding.encode_varint value, outbuf
      when :enum
        Protobug::Message::BinaryEncoding.encode_varint value.value, outbuf
      when :sint32
        Protobug::Message::BinaryEncoding.encode_zigzag 32, value, outbuf
      when :sint64
        Protobug::Message::BinaryEncoding.encode_zigzag 64, value, outbuf
      when :fixed64
        outbuf << [value].pack("Q")
      when :fixed32
        outbuf << [value].pack("V")
      when :sfixed64
        outbuf << [value].pack("q")
      when :sfixed32
        outbuf << [value].pack("l")
      when :double
        outbuf << [value].pack("E")
      when :float
        outbuf << [value].pack("e")
      when :string
        value = value.encode("utf-8") if value.encoding != Encoding::UTF_8
        Protobug::Message::BinaryEncoding.encode_length value.b, outbuf
      when :bytes
        Protobug::Message::BinaryEncoding.encode_length value.b, outbuf
      when :message
        Protobug::Message::BinaryEncoding.encode_length value.class.encode(value), outbuf
      when :bool
        Protobug::Message::BinaryEncoding.encode_varint value ? 1 : 0, outbuf
      else
        raise "unhandled type in #{self}.#{__method__}: #{type.inspect}"
      end
    end

    def binary_decode_one(io, registry, wire_type)
      case wire_type
      when 0
        value = Protobug::Message::BinaryEncoding.decode_varint(io) || raise(EOFError, "unexpected EOF")
      when 1
        value = io.read(8)
        raise EOFError, "unexpected EOF" if value&.bytesize != 8
      when 2
        value = Protobug::Message::BinaryEncoding.decode_length(io)
      when 5
        value = io.read(4)
        raise EOFError, "unexpected EOF" if value&.bytesize != 4
      else
        raise DecodeError, "unhandled wire type #{wire_type}"
      end

      case type
      when :int32
        [value].pack("l>").unpack1("l>")
      when :int64
        [value].pack("q>").unpack1("q>")
      when :uint32
        [value].pack("L>").unpack1("L>")
      when :uint64
        [value].pack("Q>").unpack1("Q>")
      when :sint32
        Protobug::Message::BinaryEncoding.decode_zigzag 32, value
      when :sint64
        Protobug::Message::BinaryEncoding.decode_zigzag 64, value
      when :fixed64
        value.unpack1("Q")
      when :fixed32
        value.unpack1("V")
      when :sfixed64
        value.unpack1("q")
      when :sfixed32
        value.unpack1("l")
      when :double
        value.unpack1("E")
      when :float
        value.unpack1("e")
      when :string
        value.force_encoding("utf-8")
        raise DecodeError, "invalid utf-8 for string" unless value.valid_encoding?

        value
      when :bytes
        value # already in binary encoding
      when :message
        registry.fetch(message_type).decode(StringIO.new(value), registry: registry)
      when :enum
        registry.fetch(enum_type).decode(value)
      when :bool
        value != 0
      else
        raise "unhandled type in #{self}.#{__method__}: #{type.inspect}"
      end
    end

    def json_decode_one(value, registry)
      return if value.nil?

      case type
      when :int32, :int64, :uint32, :uint64, :sint32, :sint64
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
      when :fixed32, :fixed64, :sfixed32, :sfixed64
        value
      when :bool
        case value
        when TrueClass, FalseClass
          value
        else
          raise DecodeError, "expected boolean, got #{value.inspect}"
        end
      when :float, :double
        case value
        when Float
          value
        when "Infinity"
          Float::INFINITY
        when "-Infinity"
          -Float::INFINITY
        when "NaN"
          Float::NAN
        when /\A-?\d+\z/
          Float(value)
        when NilClass
          value
        else
          raise DecodeError, "expected float for #{inspect}, got #{value.inspect}"
        end
      when :string, :bytes
        case value
        when String
          if type == :bytes
            # url decode 64
            value.tr!("-_", "+/")
            begin
              value.unpack1("m").force_encoding(Encoding::BINARY)
            rescue ArgumentError => e
              raise DecodeError, "Invalid URL-encoded base64 #{value.inspect} for #{inspect}: #{e}"
            end
          else
            value.force_encoding("utf-8")
          end
        else
          raise DecodeError, "expected string for #{inspect}, got #{value.inspect}"
        end
      when :message
        klass = registry.fetch(message_type)
        klass.decode_json_hash(value, registry: registry)
      when :enum
        klass = registry.fetch(enum_type)
        klass.decode_json_hash(value, registry: registry)
      else
        raise DecodeError, "unhandled type in #{self}.#{__method__}: #{inspect}"
      end
    end

    def json_encode_one(value)
      case type
      when :bytes
        [value].pack("m0")
      when :string
        value.encode("utf-8")
      when :message, :enum
        value.as_json
      when :float, :double
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
      when :int64, :uint64, :sint64, :sfixed64, :fixed64
        value.to_s
      when :int32, :uint32, :sint32, :sfixed32, :fixed32
        value
      when :bool
        value
      else
        raise EncodeError, "unhandled type in #{self}.#{__method__}: #{field.type.inspect}"
      end
    end

    def wire_type
      case type
      when :int32, :int64, :uint32, :uint64, :sint32, :sint64, :bool, :enum
        0
      when :fixed64, :sfixed64, :double
        1
      when :fixed32, :sfixed32, :float
        5
      when :string, :bytes, :message
        2
      else
        raise "unhandled type in #{self}.#{__method__}: #{type.inspect}"
      end
    end

    def scalar?
      case type
      when :enum, :message
        false
      else
        true
      end
    end

    def json_scalar?
      scalar? || (type == :message && %w[google.protobuf.Timestamp google.protobuf.duration].include?(message_type))
    end

    def scalar_to_text(value)
      case type
      when :int32, :int64
        value.to_s
      when :string
        value.encode("utf-8").dump
      when :bytes
        value.b.dump
      when "google.protobuf.Timestamp"
        value.rfc3339.inspect
      when :enum
        value
      when :bool
        value.inspect
      else
        raise "unhandled type in #{self}.#{__method__}: #{type.inspect}"
      end
    end
  end
end
