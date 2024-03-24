# -*- encoding: utf-8 -*-
# stub: protobug_sigstore_protos 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "protobug_sigstore_protos".freeze
  s.version = "0.1.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Giddins".freeze]
  s.date = "2024-03-24"
  s.email = ["segiddins@segiddins.me".freeze]
  s.files = ["lib/dev/sigstore/events/v1/events_pb.rb".freeze, "lib/protobug_sigstore_protos.rb".freeze, "lib/sigstore/bundle/v1/sigstore_bundle_pb.rb".freeze, "lib/sigstore/common/v1/sigstore_common_pb.rb".freeze, "lib/sigstore/dsse/envelope_pb.rb".freeze, "lib/sigstore/rekor/v1/sigstore_rekor_pb.rb".freeze, "lib/sigstore/trustroot/v1/sigstore_trustroot_pb.rb".freeze, "lib/sigstore/verification/v1/sigstore_verification_pb.rb".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.6".freeze
  s.summary = "Compiled protos for protobug from https://github.com/sigstore/protobuf-specs (sigstore_protos)".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<protobug>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<protobug_well_known_protos>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<protobug_googleapis_field_behavior_protos>.freeze, [">= 0".freeze])
end
