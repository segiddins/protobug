# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: in_toto_attestation/predicates/vsa/v0/vsa.proto
# syntax: proto3
# package: in_toto_attestation.predicates.vsa.v0
# options:
#   java_package: "io.github.intoto.attestation.predicates.vsa.v0"
#   go_package: "github.com/in-toto/attestation/go/predicates/vsa/v0"

require "protobug"

require "google/protobuf/timestamp_pb"

module InTotoAttestation
  module Predicates
    module Vsa
      module V0
        # Proto representation of predicate type https://slsa.dev/verification_summary/v0.2
        # Validation of all fields is left to the users of this proto.
        class VerificationSummary
          extend Protobug::Message

          self.full_name = "in_toto_attestation.predicates.vsa.v0.VerificationSummary"

          class Verifier
            extend Protobug::Message

            self.full_name = "in_toto_attestation.predicates.vsa.v0.VerificationSummary.Verifier"

            optional(1, "id", type: :string, proto3_optional: false)
          end

          optional(
            1,
            "verifier",
            type: :message,
            message_class:
            "InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Verifier",
            proto3_optional: false
          )
          optional(
            2,
            "time_verified",
            type: :message,
            message_class: "Google::Protobuf::Timestamp",
            proto3_optional: false
          )
          optional(3, "resource_uri", type: :string, proto3_optional: false)
          class Policy
            extend Protobug::Message

            self.full_name = "in_toto_attestation.predicates.vsa.v0.VerificationSummary.Policy"

            optional(1, "uri", type: :string, proto3_optional: false)
            map(2, "digest", key_type: :string, value_type: :string)
          end

          optional(
            4,
            "policy",
            type: :message,
            message_class:
            "InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Policy",
            proto3_optional: false
          )
          class InputAttestation
            extend Protobug::Message

            self.full_name = "in_toto_attestation.predicates.vsa.v0.VerificationSummary.InputAttestation"

            optional(1, "uri", type: :string, proto3_optional: false)
            map(2, "digest", key_type: :string, value_type: :string)
          end

          repeated(
            5,
            "input_attestations",
            type: :message,
            message_class:
            "InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::InputAttestation"
          )
          optional(
            6,
            "verification_result",
            type: :string,
            proto3_optional: false
          )
          optional(7, "policy_level", type: :string, proto3_optional: false)
          map(8, "dependency_levels", key_type: :string, value_type: :uint64)
        end
      end
    end
  end
end
