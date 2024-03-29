# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: envelope.proto
# syntax: proto3
# package: io.intoto
# options:
#   go_package: "github.com/sigstore/protobuf-specs/gen/pb-go/dsse"
#   ruby_package: "Sigstore::DSSE"

# https://raw.githubusercontent.com/secure-systems-lab/dsse/9c813476bd36de70a5738c72e784f123ecea16af/envelope.proto

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "protobug"

module Sigstore
  module DSSE
    # An authenticated message of arbitrary type.
    class Envelope
      extend Protobug::Message

      self.full_name = "io.intoto.Envelope"

      # Message to be signed. (In JSON, this is encoded as base64.)
      # REQUIRED.
      optional(1, "payload", type: :bytes, proto3_optional: false)
      # String unambiguously identifying how to interpret payload.
      # REQUIRED.
      optional(2, "payloadType", type: :string, proto3_optional: false)
      # Signature over:
      #     PAE(type, payload)
      # Where PAE is defined as:
      # PAE(type, payload) = "DSSEv1" + SP + LEN(type) + SP + type + SP + LEN(payload) + SP + payload
      # +               = concatenation
      # SP              = ASCII space [0x20]
      # "DSSEv1"        = ASCII [0x44, 0x53, 0x53, 0x45, 0x76, 0x31]
      # LEN(s)          = ASCII decimal encoding of the byte length of s, with no leading zeros
      # REQUIRED (length >= 1).
      repeated(
        3,
        "signatures",
        type: :message,
        message_type: "io.intoto.Signature"
      )
    end

    class Signature
      extend Protobug::Message

      self.full_name = "io.intoto.Signature"

      # Signature itself. (In JSON, this is encoded as base64.)
      # REQUIRED.
      optional(1, "sig", type: :bytes, proto3_optional: false)
      # *Unauthenticated* hint identifying which public key was used.
      # OPTIONAL.
      optional(2, "keyid", type: :string, proto3_optional: false)
    end

    def self.register_envelope_protos(registry)
      registry.register(Sigstore::DSSE::Envelope)
      registry.register(Sigstore::DSSE::Signature)
    end
  end
end
