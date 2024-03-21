# frozen_string_literal: true

require "simplecov"

SimpleCov.root(File.expand_path("..", __dir__))
SimpleCov.start do
  enable_coverage :branch
end
