# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: in_toto_attestation/v1/statement.proto
# syntax: proto3
# package: in_toto_attestation.v1
# options:
#   java_package: "io.github.intoto.attestation.v1"
#   go_package: "github.com/in-toto/attestation/go/v1"

require "protobug"

require "google/protobuf/struct_pb"

require_relative "resource_descriptor_pb"

module InTotoAttestation
  module V1
    # Proto representation of the in-toto v1 Statement.
    # https://github.com/in-toto/attestation/tree/main/spec/v1
    # Validation of all fields is left to the users of this proto.
    class Statement
      extend Protobug::Message

      self.full_name = "in_toto_attestation.v1.Statement"

      # Expected to always be "https://in-toto.io/Statement/v1"
      optional(
        1,
        "type",
        type: :string,
        json_name: "_type",
        proto3_optional: false
      )
      repeated(
        2,
        "subject",
        type: :message,
        message_type: "in_toto_attestation.v1.ResourceDescriptor"
      )
      optional(
        3,
        "predicate_type",
        type: :string,
        json_name: "predicateType",
        proto3_optional: false
      )
      optional(
        4,
        "predicate",
        type: :message,
        message_type: "google.protobuf.Struct",
        proto3_optional: false
      )
    end

    def self.register_statement_protos(registry)
      Google::Protobuf.register_struct_protos(registry)
      InTotoAttestation::V1.register_resource_descriptor_protos(registry)
      registry.register(InTotoAttestation::V1::Statement)
    end
  end
end
