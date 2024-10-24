# frozen_string_literal: true

require_relative "lib/protobug/version"

Gem::Specification.new do |spec|
  spec.name = "protobug"
  spec.version = Protobug::VERSION
  spec.authors = ["Samuel Giddins"]
  spec.email = ["segiddins@segiddins.me"]

  spec.summary = "An embeddable protobuf compiler & runtime for Ruby"
  spec.homepage = "https://github.com/segiddins/protobug"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files =
    IO.popen(["git", "-C", __dir__, "ls-files", "-z", "--", "exe/", "lib/", "*.md", "*.txt"],
             &:read).split("\x0")
      .reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile gen/ tmp/ protobug-compiler/
                          conformance/ .vscode/ Rakefile tasks/])
    end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
