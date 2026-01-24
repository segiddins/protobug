# frozen_string_literal: true

module Protobug
  class Error < StandardError; end

  def self.Extension(extended, &)
    raise ArgumentError, "Protobug::Extension must extend a message" unless extended.is_a?(Protobug::Message)

    ext = Protobug::Extension.new(extended)
    ext.instance_eval(&)
    ext.freeze
  end

  class Extension
    def initialize(extended)
      @extended = extended
      @field = nil
    end

    def freeze
      singleton_class.module_eval @field.method_definitions
      super
    end

    def optional(*args, **kwargs)
      raise if frozen?

      @field = @extended.optional(*args, **kwargs, extension: self)
    end

    def required(*args, **kwargs)
      raise if frozen?

      @field = @extended.required(*args, **kwargs, extension: self)
    end

    def repeated(*args, **kwargs)
      raise if frozen?

      @field = @extended.repeated(*args, **kwargs, extension: self)
    end

    def map(*args, **kwargs)
      raise if frozen?

      @field = @extended.map(*args, **kwargs, extension: self)
    end
  end
end

require_relative "protobug/version"
require_relative "protobug/base_descriptor"
require_relative "protobug/enum"
require_relative "protobug/message"
