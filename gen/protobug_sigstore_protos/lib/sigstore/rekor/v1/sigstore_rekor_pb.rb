# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: sigstore_rekor.proto
# syntax: proto3
# package: dev.sigstore.rekor.v1
# options:
#   java_package: "dev.sigstore.proto.rekor.v1"
#   java_outer_classname: "RekorProto"
#   java_multiple_files: true
#   go_package: "github.com/sigstore/protobuf-specs/gen/pb-go/rekor/v1"
#   ruby_package: "Sigstore::Rekor::V1"

# Copyright 2022 The Sigstore Authors.
#
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

require "google/api/field_behavior_pb"

require_relative "../../common/v1/sigstore_common_pb"

module Sigstore
  module Rekor
    module V1
      # KindVersion contains the entry's kind and api version.
      class KindVersion
        extend Protobug::Message

        self.full_name = "dev.sigstore.rekor.v1.KindVersion"

        # Kind is the type of entry being stored in the log.
        # See here for a list: https://github.com/sigstore/rekor/tree/main/pkg/types
        optional(1, "kind", type: :string, proto3_optional: false)
        # The specific api version of the type.
        optional(2, "version", type: :string, proto3_optional: false)
      end

      # The checkpoint MUST contain an origin string as a unique log identifier,
      # the tree size, and the root hash. It MAY also be followed by optional data,
      # and clients MUST NOT assume optional data. The checkpoint MUST also contain
      # a signature over the root hash (tree head). The checkpoint MAY contain additional
      # signatures, but the first SHOULD be the signature from the log. Checkpoint contents
      # are concatenated with newlines into a single string.
      # The checkpoint format is described in
      # https://github.com/transparency-dev/formats/blob/main/log/README.md
      # and https://github.com/C2SP/C2SP/blob/main/tlog-checkpoint.md.
      # An example implementation can be found in https://github.com/sigstore/rekor/blob/main/pkg/util/signed_note.go
      class Checkpoint
        extend Protobug::Message

        self.full_name = "dev.sigstore.rekor.v1.Checkpoint"

        optional(1, "envelope", type: :string, proto3_optional: false)
      end

      # InclusionProof is the proof returned from the transparency log. Can
      # be used for offline or online verification against the log.
      class InclusionProof
        extend Protobug::Message

        self.full_name = "dev.sigstore.rekor.v1.InclusionProof"

        # The index of the entry in the tree it was written to.
        optional(
          1,
          "log_index",
          type: :int64,
          json_name: "logIndex",
          proto3_optional: false
        )
        # The hash digest stored at the root of the merkle tree at the time
        # the proof was generated.
        optional(
          2,
          "root_hash",
          type: :bytes,
          json_name: "rootHash",
          proto3_optional: false
        )
        # The size of the merkle tree at the time the proof was generated.
        optional(
          3,
          "tree_size",
          type: :int64,
          json_name: "treeSize",
          proto3_optional: false
        )
        # A list of hashes required to compute the inclusion proof, sorted
        # in order from leaf to root.
        # Note that leaf and root hashes are not included.
        # The root hash is available separately in this message, and the
        # leaf hash should be calculated by the client.
        repeated(4, "hashes", type: :bytes)
        # Signature of the tree head, as of the time of this proof was
        # generated. See above info on 'Checkpoint' for more details.
        optional(
          5,
          "checkpoint",
          type: :message,
          message_type: "dev.sigstore.rekor.v1.Checkpoint",
          proto3_optional: false
        )
      end

      # The inclusion promise is calculated by Rekor. It's calculated as a
      # signature over a canonical JSON serialization of the persisted entry, the
      # log ID, log index and the integration timestamp.
      # See https://github.com/sigstore/rekor/blob/a6e58f72b6b18cc06cefe61808efd562b9726330/pkg/api/entries.go#L54
      # The format of the signature depends on the transparency log's public key.
      # If the signature algorithm requires a hash function and/or a signature
      # scheme (e.g. RSA) those has to be retrieved out-of-band from the log's
      # operators, together with the public key.
      # This is used to verify the integration timestamp's value and that the log
      # has promised to include the entry.
      class InclusionPromise
        extend Protobug::Message

        self.full_name = "dev.sigstore.rekor.v1.InclusionPromise"

        optional(
          1,
          "signed_entry_timestamp",
          type: :bytes,
          json_name: "signedEntryTimestamp",
          proto3_optional: false
        )
      end

      # TransparencyLogEntry captures all the details required from Rekor to
      # reconstruct an entry, given that the payload is provided via other means.
      # This type can easily be created from the existing response from Rekor.
      # Future iterations could rely on Rekor returning the minimal set of
      # attributes (excluding the payload) that are required for verifying the
      # inclusion promise. The inclusion promise (called SignedEntryTimestamp in
      # the response from Rekor) is similar to a Signed Certificate Timestamp
      # as described here https://www.rfc-editor.org/rfc/rfc6962.html#section-3.2.
      class TransparencyLogEntry
        extend Protobug::Message

        self.full_name = "dev.sigstore.rekor.v1.TransparencyLogEntry"

        # The global index of the entry, used when querying the log by index.
        optional(
          1,
          "log_index",
          type: :int64,
          json_name: "logIndex",
          proto3_optional: false
        )
        # The unique identifier of the log.
        optional(
          2,
          "log_id",
          type: :message,
          message_type: "dev.sigstore.common.v1.LogId",
          json_name: "logId",
          proto3_optional: false
        )
        # The kind (type) and version of the object associated with this
        # entry. These values are required to construct the entry during
        # verification.
        optional(
          3,
          "kind_version",
          type: :message,
          message_type: "dev.sigstore.rekor.v1.KindVersion",
          json_name: "kindVersion",
          proto3_optional: false
        )
        # The UNIX timestamp from the log when the entry was persisted.
        optional(
          4,
          "integrated_time",
          type: :int64,
          json_name: "integratedTime",
          proto3_optional: false
        )
        # The inclusion promise/signed entry timestamp from the log.
        # Required for v0.1 bundles, and MUST be verified.
        # Optional for >= v0.2 bundles if another suitable source of
        # time is present (such as another source of signed time,
        # or the current system time for long-lived certificates).
        # MUST be verified if no other suitable source of time is present,
        # and SHOULD be verified otherwise.
        optional(
          5,
          "inclusion_promise",
          type: :message,
          message_type: "dev.sigstore.rekor.v1.InclusionPromise",
          json_name: "inclusionPromise",
          proto3_optional: false
        )
        # The inclusion proof can be used for offline or online verification
        # that the entry was appended to the log, and that the log has not been
        # altered.
        optional(
          6,
          "inclusion_proof",
          type: :message,
          message_type: "dev.sigstore.rekor.v1.InclusionProof",
          json_name: "inclusionProof",
          proto3_optional: false
        )
        # Optional. The canonicalized transparency log entry, used to
        # reconstruct the Signed Entry Timestamp (SET) during verification.
        # The contents of this field are the same as the `body` field in
        # a Rekor response, meaning that it does **not** include the "full"
        # canonicalized form (of log index, ID, etc.) which are
        # exposed as separate fields. The verifier is responsible for
        # combining the `canonicalized_body`, `log_index`, `log_id`,
        # and `integrated_time` into the payload that the SET's signature
        # is generated over.
        # This field is intended to be used in cases where the SET cannot be
        # produced determinisitically (e.g. inconsistent JSON field ordering,
        # differing whitespace, etc).
        #
        # If set, clients MUST verify that the signature referenced in the
        # `canonicalized_body` matches the signature provided in the
        # `Bundle.content`.
        # If not set, clients are responsible for constructing an equivalent
        # payload from other sources to verify the signature.
        optional(
          7,
          "canonicalized_body",
          type: :bytes,
          json_name: "canonicalizedBody",
          proto3_optional: false
        )
      end

      def self.register_sigstore_rekor_protos(registry)
        Google::Api.register_field_behavior_protos(registry)
        Sigstore::Common::V1.register_sigstore_common_protos(registry)
        registry.register(Sigstore::Rekor::V1::KindVersion)
        registry.register(Sigstore::Rekor::V1::Checkpoint)
        registry.register(Sigstore::Rekor::V1::InclusionProof)
        registry.register(Sigstore::Rekor::V1::InclusionPromise)
        registry.register(Sigstore::Rekor::V1::TransparencyLogEntry)
      end
    end
  end
end
