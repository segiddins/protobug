# -*- encoding: utf-8 -*-
# stub: protobug_well_known_protos 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "protobug_well_known_protos".freeze
  s.version = "0.1.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Giddins".freeze]
  s.date = "2024-03-24"
  s.email = ["segiddins@segiddins.me".freeze]
  s.files = ["google/protobuf/any_pb.rb".freeze, "google/protobuf/api_pb.rb".freeze, "google/protobuf/descriptor_pb.rb".freeze, "google/protobuf/duration_pb.rb".freeze, "google/protobuf/empty_pb.rb".freeze, "google/protobuf/field_mask_pb.rb".freeze, "google/protobuf/source_context_pb.rb".freeze, "google/protobuf/struct_pb.rb".freeze, "google/protobuf/timestamp_pb.rb".freeze, "google/protobuf/type_pb.rb".freeze, "google/protobuf/wrappers_pb.rb".freeze, "lib/protobug_well_known_protos.rb".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.6".freeze
  s.summary = "Compiled protos for protobug from https://github.com/protocolbuffers/protobuf (well_known_protos)".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<protobug>.freeze, [">= 0".freeze])
end
