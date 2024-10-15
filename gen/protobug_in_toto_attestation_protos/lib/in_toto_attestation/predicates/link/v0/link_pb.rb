# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: in_toto_attestation/predicates/link/v0/link.proto
# syntax: proto3
# package: in_toto_attestation.predicates.link.v0
# options:
#   java_package: "io.github.intoto.attestation.predicates.link.v0"
#   go_package: "github.com/in-toto/attestation/go/predicates/link/v0"

require "protobug"

require "google/protobuf/struct_pb"

require_relative "../../../v1/resource_descriptor_pb"

module InTotoAttestation
  module Predicates
    module Link
      module V0
        class Link
          extend Protobug::Message

          self.full_name = "in_toto_attestation.predicates.link.v0.Link"

          optional(1, "name", type: :string, proto3_optional: false)
          repeated(2, "command", type: :string)
          repeated(
            3,
            "materials",
            type: :message,
            message_class: "InTotoAttestation::V1::ResourceDescriptor"
          )
          optional(
            4,
            "byproducts",
            type: :message,
            message_class: "Google::Protobuf::Struct",
            proto3_optional: false
          )
          optional(
            5,
            "environment",
            type: :message,
            message_class: "Google::Protobuf::Struct",
            proto3_optional: false
          )
        end
      end
    end
  end
end
