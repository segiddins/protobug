# frozen_string_literal: true

require_relative "../lib/protobug/version"

Gem::Specification.new do |spec|
  spec.name = "protobug-compiler"
  spec.version = Protobug::VERSION
  spec.authors = ["Samuel Giddins"]
  spec.email = ["segiddins@segiddins.me"]

  spec.summary = "An protobuf compiler for protobug"
  spec.homepage = "https://github.com/segiddins/protobug"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "delegate"
  spec.add_dependency "forwardable"
  spec.add_dependency "prettier_print", "~> 1.2", ">= 1.2.1"

  spec.add_dependency "protobug", spec.version
  spec.add_dependency "protobug_compiler_protos", spec.version
end
