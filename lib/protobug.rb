# frozen_string_literal: true

module Protobug
  class Error < StandardError; end
end

require_relative "protobug/version"
require_relative "protobug/base_descriptor"
require_relative "protobug/enum"
require_relative "protobug/message"
