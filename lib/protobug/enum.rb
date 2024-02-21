module Protobug
  module Enum
    def self.extended(klass)
      klass.class_eval do
        @values = {}
        @reserved_ranges = []
        extend BaseDescriptor
        include Protobug::Enum::InstanceMethods
      end
      klass.singleton_class.class_eval do
        attr_reader :values
        attr_reader :reserved_ranges

        def const_added(name)
          super
          value = const_get(name)
          raise "expected #{self}::#{name} to be a #{self}, got #{value.inspect}" unless value.is_a? self
          raise "expected #{value.name} to be #{name}" unless name.name == value.name
          raise "duplicate value #{value.inspect}" if values[value.name]

          @values[name.name] = value
          @values[value.value] ||= value
        end

        def reserved_range(range)
          raise "expected Range, got #{range.inspect}" unless range.is_a? Range

          reserved_ranges << range
        end

        def freeze
          @values.freeze
          @reserved_ranges.freeze
          full_name.freeze
          super
        end
      end
    end

    def decode_json_hash(json, registry: nil)
      case json
      when UNSET
        default
      when String
        values.fetch(json) { new("<unknown:#{json}>", 0) }
      when Integer
        values.fetch(json) { new("<unknown:#{json}>", json) }
      else
        raise "expected string for #{full_name}, got #{json.inspect}"
      end
    end

    def decode(value)
      raise "expected Integer, got #{value.inspect}" unless value.is_a? Integer

      values.fetch(value) { new("<unknown:#{value}>", value) }
    end

    def default
      values.values.first
    end

    module InstanceMethods
      def self.included(base)
        base.class_eval do
          attr_reader :value
          attr_reader :name
        end
      end

      def initialize(name, value)
        @name = -name
        @value = value
      end

      def pretty_print(pp)
        pp.group 0, "#{self.class}.new(", ")" do
          pp.pp name
          pp.breakable(", ")
          pp.pp value
        end
      end

      def hash
        value.hash
      end

      def to_s
        name
      end

      def eql?(other)
        value.eql?(other.value)
      end

      def ==(other)
        case other
        when self.class
          value == other.value
        when Integer
          value == other
        when String, Symbol
          name.to_s == other.to_s
        else
          raise "expected #{self.class}, got #{other.inspect}"
        end
      end

      alias === ==

      def to_text
        "#{self.class.full_name}.#{name}"
      end

      def as_json
        name
      end
    end
  end
end
