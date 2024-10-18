# frozen_string_literal: true

module Protobug
  module Enum
    def self.extended(klass)
      klass.class_eval do
        @values = {}
        @names = {}
        @reserved_ranges = []
        extend BaseDescriptor
      end
    end

    attr_reader :values, :names, :reserved_ranges

    def new(name, value)
      @names[value] = name
      @values[name] = value
      value
    end

    def register(name, value)
      name = -name
      @names[value] = name
      @values[name] = value
      value
    end

    def reserved_range(range)
      raise "expected Range, got #{range.inspect}" unless range.is_a? Range

      reserved_ranges << range
    end

    def freeze
      @values.freeze
      @reserved_ranges.freeze
      @names.freeze
      full_name.freeze
      super
    end

    def decode_json_hash(json, ignore_unknown_fields: false)
      case json
      when NilClass, Integer
        json
      when String
        value = values[json]
        return value if value
        return nil if ignore_unknown_fields

        raise(DecodeError, "unknown value: #{json.inspect} among #{names.keys.inspect}")
      else
        raise ArgumentError, "expected string or integer for #{full_name}, got #{json.inspect}"
      end
    end

    def default
      # TODO: default is 0 on proto3, first value on proto2
      values.values.first
    end

    def as_json(value, print_unknown_fields: false)
      _ = print_unknown_fields
      names.fetch(value) { value }
    end
  end
end
