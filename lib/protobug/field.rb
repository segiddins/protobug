module Protobug
  class Field
    attr_accessor :number, :name, :type, :json_name, :cardinality, :oneof, :ivar, :setter, :message_type, :enum_type, :adder

    def initialize(number, name, type: nil, json_name: nil, cardinality: :optional, oneof: nil, message_type: nil, enum_type: nil, packed: false)
      raise "message_type only allowed for message fields" if !!message_type ^ type == :message
      raise "enum_type only allowed for enum fields" if !!enum_type ^ type == :enum
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
      if cardinality == :repeated
        []
      else
        case type
        when :int32, :int64, :uint32, :uint64
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
        when :bool
          false
        else
          raise "unhandled type in #{self}.#{__method__}: #{type.inspect}"
        end
      end
    end

    def repeated?
      cardinality == :repeated
    end

    def packed?
      @packed
    end

    def to_text(value)
      case [cardinality, scalar?]
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

    private

    def scalar?
      case type
      when :message
        if @message_type == "google.protobuf.Timestamp"
          true
        else
          false
        end
      else
        true
      end
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
