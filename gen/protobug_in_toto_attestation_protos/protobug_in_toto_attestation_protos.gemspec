# -*- encoding: utf-8 -*-
# stub: protobug_in_toto_attestation_protos 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "protobug_in_toto_attestation_protos".freeze
  s.version = "0.1.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Giddins".freeze]

  s.email = ["segiddins@segiddins.me".freeze]
  s.files = ["lib/in_toto_attestation/predicates/link/v0/link_pb.rb".freeze, "lib/in_toto_attestation/predicates/provenance/v1/provenance_pb.rb".freeze, "lib/in_toto_attestation/predicates/release/v0/release_pb.rb".freeze, "lib/in_toto_attestation/predicates/scai/v0/scai_pb.rb".freeze, "lib/in_toto_attestation/predicates/test_result/v0/test_result_pb.rb".freeze, "lib/in_toto_attestation/predicates/vsa/v0/vsa_pb.rb".freeze, "lib/in_toto_attestation/predicates/vsa/v1/vsa_pb.rb".freeze, "lib/in_toto_attestation/v1/resource_descriptor_pb.rb".freeze, "lib/in_toto_attestation/v1/statement_pb.rb".freeze, "lib/protobug_in_toto_attestation_protos.rb".freeze, "sig/in_toto_attestation/predicates/link/v0/link_pb.rbs".freeze, "sig/in_toto_attestation/predicates/provenance/v1/provenance_pb.rbs".freeze, "sig/in_toto_attestation/predicates/release/v0/release_pb.rbs".freeze, "sig/in_toto_attestation/predicates/scai/v0/scai_pb.rbs".freeze, "sig/in_toto_attestation/predicates/test_result/v0/test_result_pb.rbs".freeze, "sig/in_toto_attestation/predicates/vsa/v0/vsa_pb.rbs".freeze, "sig/in_toto_attestation/predicates/vsa/v1/vsa_pb.rbs".freeze, "sig/in_toto_attestation/v1/resource_descriptor_pb.rbs".freeze, "sig/in_toto_attestation/v1/statement_pb.rbs".freeze]
  s.homepage = "https://github.com/segiddins/protobug/blob/v0.1.1/gen/protobug_in_toto_attestation_protos".freeze
  s.licenses = ["Unlicense".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1.0".freeze)

  s.summary = "Compiled protos for protobug from https://github.com/in-toto/attestation (in_toto_attestation_protos)".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<protobug>.freeze, ["= 0.1.1".freeze])
  s.add_runtime_dependency(%q<protobug_well_known_protos>.freeze, ["= 0.1.1".freeze])
end
