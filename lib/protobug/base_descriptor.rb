# frozen_string_literal: true

module Protobug
  module BaseDescriptor
    attr_reader :full_name

    def full_name=(name)
      raise DefinitionError, "full_name already set" if @full_name

      warn "[Protobug] overwriting known type #{name.inspect}" if Protobug.known_type_names.key?(name)
      Protobug.known_type_names[name] = self
      @full_name = name
    end
  end
end
