# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: in_toto_attestation/predicates/vsa/v1/vsa.proto
# syntax: proto3
# package: in_toto_attestation.predicates.vsa.v1
# options:
#   java_package: "io.github.intoto.attestation.predicates.vsa.v1"
#   go_package: "github.com/in-toto/attestation/go/predicates/vsa/v1"

require "protobug"

require "google/protobuf/timestamp_pb"

module InTotoAttestation
  module Predicates
    module Vsa
      module V1
        # Proto representation of predicate type https://slsa.dev/verification_summary/v1
        # Validation of all fields is left to the users of this proto.
        class VerificationSummary
          extend Protobug::Message

          self.full_name = "in_toto_attestation.predicates.vsa.v1.VerificationSummary"

          class Verifier
            extend Protobug::Message

            self.full_name = "in_toto_attestation.predicates.vsa.v1.VerificationSummary.Verifier"

            optional(1, "id", type: :string, proto3_optional: false)
          end

          optional(
            1,
            "verifier",
            type: :message,
            message_type:
            "in_toto_attestation.predicates.vsa.v1.VerificationSummary.Verifier",
            proto3_optional: false
          )
          optional(
            2,
            "time_verified",
            type: :message,
            message_type: "google.protobuf.Timestamp",
            json_name: "timeVerified",
            proto3_optional: false
          )
          optional(
            3,
            "resource_uri",
            type: :string,
            json_name: "resourceUri",
            proto3_optional: false
          )
          class Policy
            extend Protobug::Message

            self.full_name = "in_toto_attestation.predicates.vsa.v1.VerificationSummary.Policy"

            optional(1, "uri", type: :string, proto3_optional: false)
            map(2, "digest", key_type: :string, value_type: :string)
          end

          optional(
            4,
            "policy",
            type: :message,
            message_type:
            "in_toto_attestation.predicates.vsa.v1.VerificationSummary.Policy",
            proto3_optional: false
          )
          class InputAttestation
            extend Protobug::Message

            self.full_name = "in_toto_attestation.predicates.vsa.v1.VerificationSummary.InputAttestation"

            optional(1, "uri", type: :string, proto3_optional: false)
            map(2, "digest", key_type: :string, value_type: :string)
          end

          repeated(
            5,
            "input_attestations",
            type: :message,
            message_type:
            "in_toto_attestation.predicates.vsa.v1.VerificationSummary.InputAttestation",
            json_name: "inputAttestations"
          )
          optional(
            6,
            "verification_result",
            type: :string,
            json_name: "verificationResult",
            proto3_optional: false
          )
          optional(
            7,
            "verified_levels",
            type: :string,
            json_name: "verifiedLevels",
            proto3_optional: false
          )
          map(
            8,
            "dependency_levels",
            key_type: :string,
            value_type: :uint64,
            json_name: "dependencyLevels"
          )
          optional(
            9,
            "slsa_version",
            type: :string,
            json_name: "slsaVersion",
            proto3_optional: false
          )
        end

        def self.register_vsa_protos(registry)
          Google::Protobuf.register_timestamp_protos(registry)
          registry.register(
            InTotoAttestation::Predicates::Vsa::V1::VerificationSummary
          )
          registry.register(
            InTotoAttestation::Predicates::Vsa::V1::VerificationSummary::Verifier
          )
          registry.register(
            InTotoAttestation::Predicates::Vsa::V1::VerificationSummary::Policy
          )
          registry.register(
            InTotoAttestation::Predicates::Vsa::V1::VerificationSummary::InputAttestation
          )
        end
      end
    end
  end
end