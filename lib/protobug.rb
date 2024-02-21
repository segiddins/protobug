# frozen_string_literal: true

require_relative "protobug/version"

module Protobug
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "protobug/base_descriptor"
require_relative "protobug/enum"
require_relative "protobug/message"
require_relative "protobug/registry"
require 'date'
