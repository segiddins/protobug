# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "protobug_googleapis_field_behavior_protos"
  spec.version = Protobug::VERSION
  spec.authors = ["Samuel Giddins"]
  spec.email = ["segiddins@segiddins.me"]

  spec.summary = "Field behavior protos for protobug"
  # spec.homepage = "https://github.com/segiddins/protobug"
  # spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "protobug_well_known_protos", spec.version
end
