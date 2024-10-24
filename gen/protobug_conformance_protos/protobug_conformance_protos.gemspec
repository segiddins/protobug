# -*- encoding: utf-8 -*-
# stub: protobug_conformance_protos 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "protobug_conformance_protos".freeze
  s.version = "0.1.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Giddins".freeze]

  s.email = ["segiddins@segiddins.me".freeze]
  s.files = ["lib/conformance/conformance_pb.rb".freeze, "lib/protobuf_test_messages/proto2/test_messages_proto2_pb.rb".freeze, "lib/protobuf_test_messages/proto3/test_messages_proto3_pb.rb".freeze, "lib/protobug_conformance_protos.rb".freeze, "sig/conformance/conformance_pb.rbs".freeze, "sig/protobuf_test_messages/proto2/test_messages_proto2_pb.rbs".freeze, "sig/protobuf_test_messages/proto3/test_messages_proto3_pb.rbs".freeze]
  s.homepage = "https://github.com/segiddins/protobug/blob/v0.1.1/gen/protobug_conformance_protos".freeze
  s.licenses = ["Unlicense".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)

  s.summary = "Compiled protos for protobug from https://github.com/protocolbuffers/protobuf (conformance_protos)".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<protobug>.freeze, ["= 0.1.1".freeze])
  s.add_runtime_dependency(%q<protobug_well_known_protos>.freeze, ["= 0.1.1".freeze])
end
