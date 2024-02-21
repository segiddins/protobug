module Protobug
  class Registry
    def initialize(&blk)
      @registry = {}
      if blk
        yield self
        freeze
      end
    end

    def freeze
      @registry.freeze
      super
    end

    def register(klass)
      raise ArgumentError, "expected Protobug::BaseDescriptor, got #{klass.inspect}" unless klass.is_a? Protobug::BaseDescriptor
      full_name = klass.full_name
      existing = @registry[full_name]
      raise ArgumentError, "duplicate class #{full_name}" if existing && existing != klass
      @registry[full_name] = klass
      klass.freeze
    end

    def fetch(*args, &blk)
      @registry.fetch(*args, &blk)
    end
  end
end
