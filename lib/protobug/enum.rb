# frozen_string_literal: true

module Protobug
  module Enum
    def self.extended(klass)
      klass.class_eval do
        @values = {}
        @reserved_ranges = []
        extend BaseDescriptor
        include Protobug::Enum::InstanceMethods
      end
    end

    attr_reader :values, :reserved_ranges

    def const_added(name)
      super
      value = const_get(name)

      const_name = value.name.start_with?("k") ? "K_#{value.name[1..]}" : value.name
      const_name = "K_#{const_name}" unless const_name.match?(/\A[A-Z]/)

      raise "expected #{self}::#{name} to be a #{self}, got #{value.inspect}" unless value.is_a? self
      raise "expected #{value.name} to be #{const_name}" unless name.name == const_name
      raise "duplicate value #{value.inspect}" if values[value.name]

      @values[value.name] = value
      @values[value.value] ||= value
    end

    def reserved_range(range)
      raise "expected Range, got #{range.inspect}" unless range.is_a? Range

      reserved_ranges << range
    end

    def freeze
      # const_added was added in 3.2
      unless RUBY_VERSION >= "3.2"
        constants.each do |n|
          c = const_get(n)
          next unless c.is_a? self

          @values[c.name] ||= c
          @values[c.value] ||= c
        end
      end

      @values.freeze
      @reserved_ranges.freeze
      full_name.freeze
      super
    end

    def decode_json_hash(json, ignore_unknown_fields: false)
      case json
      when NilClass
        nil
      when String
        value = values[json]
        return value if value
        return nil if ignore_unknown_fields

        raise(DecodeError, "unknown value: #{json.inspect}")
      when Integer
        values[json] || new("<unknown:#{json}>", json)
      else
        raise ArgumentError, "expected string for #{full_name}, got #{json.inspect}"
      end
    end

    def decode(value)
      values.fetch(value) { new("<unknown:#{value}>", value) }
    end

    def default
      # TODO: default is 0 on proto3, first value on proto2
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
        raise ArgumentError, "expected String, got #{name.inspect}" unless name.is_a? String
        raise ArgumentError, "expected Integer, got #{value.inspect}" unless value.is_a? Integer

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
        return value unless equal?(self.class.values[value]) || equal?(self.class.values[name])

        name
      end
    end
  end
end
