# frozen_string_literal: true

module Protobug
  class Error < StandardError
  end

  class UnsupportedFeatureError < Error
    def initialize(feature, msg)
      @feature = feature
      super("feature #{feature} is unsupported: #{msg}")
    end
  end

  class GroupsUnsupportedError < UnsupportedFeatureError
    def initialize(msg)
      super(:group, "reading groups from binary protos (in #{msg})")
    end
  end

  class EncodeError < Error
  end

  class DecodeError < Error
  end

  class UnknownFieldError < DecodeError
  end

  class DefinitionError < Error
  end

  class InvalidValueError < Error
    def initialize(msg, field_name, value, message = "")
      field = msg.class.fields_by_name.fetch(field_name)
      super("invalid value for #{field} of #{msg.class.full_name}#{" (#{message})" if message}\n" \
            "#{value.class.inspect}: #{value.inspect}")
    end
  end
end
