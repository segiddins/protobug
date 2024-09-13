# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: in_toto_attestation/predicates/release/v0/release.proto
# syntax: proto3
# package: in_toto_attestation.predicates.release.v0
# options:
#   java_package: "io.github.intoto.attestation.predicates.release.v0"
#   go_package: "github.com/in-toto/attestation/go/predicates/release/v0"

require "protobug"

module InTotoAttestation
  module Predicates
    module Release
      module V0
        class Release
          extend Protobug::Message

          self.full_name = "in_toto_attestation.predicates.release.v0.Release"

          optional(1, "purl", type: :string, proto3_optional: false)
          optional(2, "release_id", type: :string, json_name: "releaseId")
        end

        def self.register_release_protos(registry)
          registry.register(InTotoAttestation::Predicates::Release::V0::Release)
        end
      end
    end
  end
end