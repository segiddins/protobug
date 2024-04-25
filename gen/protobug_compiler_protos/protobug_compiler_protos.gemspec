# -*- encoding: utf-8 -*-
# stub: protobug_compiler_protos 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "protobug_compiler_protos".freeze
  s.version = "0.1.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Giddins".freeze]

  s.email = ["segiddins@segiddins.me".freeze]
  s.files = ["lib/google/protobuf/compiler/plugin_pb.rb".freeze, "lib/protobug_compiler_protos.rb".freeze]
  s.homepage = "https://github.com/segiddins/protobug/blob/v0.1.0/gen/protobug_compiler_protos".freeze
  s.licenses = [nil]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.9".freeze
  s.summary = "Compiled protos for protobug from https://github.com/protocolbuffers/protobuf (compiler_protos)".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<protobug>.freeze, ["= 0.1.0".freeze])
  s.add_runtime_dependency(%q<protobug_well_known_protos>.freeze, ["= 0.1.0".freeze])
end
