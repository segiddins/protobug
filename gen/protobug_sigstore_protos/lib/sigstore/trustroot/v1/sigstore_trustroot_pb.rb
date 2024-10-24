# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: sigstore_trustroot.proto
# syntax: proto3
# package: dev.sigstore.trustroot.v1
# options:
#   java_package: "dev.sigstore.proto.trustroot.v1"
#   java_outer_classname: "TrustRootProto"
#   java_multiple_files: true
#   go_package: "github.com/sigstore/protobuf-specs/gen/pb-go/trustroot/v1"
#   ruby_package: "Sigstore::TrustRoot::V1"

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
  module TrustRoot
    module V1
      # TransparencyLogInstance describes the immutable parameters from a
      # transparency log.
      # See https://www.rfc-editor.org/rfc/rfc9162.html#name-log-parameters
      # for more details.
      # The included parameters are the minimal set required to identify a log,
      # and verify an inclusion proof/promise.
      class TransparencyLogInstance
        extend Protobug::Message

        self.full_name = "dev.sigstore.trustroot.v1.TransparencyLogInstance"

        # The base URL at which can be used to URLs for the client.
        optional(
          1,
          "base_url",
          type: :string,
          json_name: "baseUrl",
          proto3_optional: false
        )
        # The hash algorithm used for the Merkle Tree.
        optional(
          2,
          "hash_algorithm",
          type: :enum,
          enum_type: "dev.sigstore.common.v1.HashAlgorithm",
          json_name: "hashAlgorithm",
          proto3_optional: false
        )
        # The public key used to verify signatures generated by the log.
        # This attribute contains the signature algorithm used by the log.
        optional(
          3,
          "public_key",
          type: :message,
          message_type: "dev.sigstore.common.v1.PublicKey",
          json_name: "publicKey",
          proto3_optional: false
        )
        # The unique identifier for this transparency log.
        # Represented as the SHA-256 hash of the log's public key,
        # calculated over the DER encoding of the key represented as
        # SubjectPublicKeyInfo.
        # See https://www.rfc-editor.org/rfc/rfc6962#section-3.2
        optional(
          4,
          "log_id",
          type: :message,
          message_type: "dev.sigstore.common.v1.LogId",
          json_name: "logId",
          proto3_optional: false
        )
        # The checkpoint key identifier for the log used in a checkpoint.
        # Optional, not provided for logs that do not generate checkpoints.
        # For logs that do generate checkpoints, if not set, assume
        # log_id equals checkpoint_key_id.
        # Follows the specification described here
        # for ECDSA and Ed25519 signatures:
        # https://github.com/C2SP/C2SP/blob/main/signed-note.md#signatures
        # For RSA signatures, the key ID will match the ECDSA format, the
        # hashed DER-encoded SPKI public key. Publicly witnessed logs MUST NOT
        # use RSA-signed checkpoints, since witnesses do not support
        # RSA signatures.
        # This is provided for convenience. Clients can also calculate the
        # checkpoint key ID given the log's public key.
        # SHOULD be set for logs generating Ed25519 signatures.
        # SHOULD be 4 bytes long, as a truncated hash.
        optional(
          5,
          "checkpoint_key_id",
          type: :message,
          message_type: "dev.sigstore.common.v1.LogId",
          json_name: "checkpointKeyId",
          proto3_optional: false
        )
      end

      # CertificateAuthority enlists the information required to identify which
      # CA to use and perform signature verification.
      class CertificateAuthority
        extend Protobug::Message

        self.full_name = "dev.sigstore.trustroot.v1.CertificateAuthority"

        # The root certificate MUST be self-signed, and so the subject and
        # issuer are the same.
        optional(
          1,
          "subject",
          type: :message,
          message_type: "dev.sigstore.common.v1.DistinguishedName",
          proto3_optional: false
        )
        # The URI identifies the certificate authority.
        #
        # It is RECOMMENDED that the URI is the base URL for the certificate
        # authority, that can be provided to any SDK/client provided
        # by the certificate authority to interact with the certificate
        # authority.
        optional(2, "uri", type: :string, proto3_optional: false)
        # The certificate chain for this CA. The last certificate in the chain
        # MUST be the trust anchor. The trust anchor MAY be a self-signed root
        # CA certificate or MAY be an intermediate CA certificate.
        optional(
          3,
          "cert_chain",
          type: :message,
          message_type: "dev.sigstore.common.v1.X509CertificateChain",
          json_name: "certChain",
          proto3_optional: false
        )
        # The time the *entire* chain was valid. This is at max the
        # longest interval when *all* certificates in the chain were valid,
        # but it MAY be shorter. Clients MUST check timestamps against *both*
        # the `valid_for` time range *and* the entire certificate chain.
        #
        # The TimeRange should be considered valid *inclusive* of the
        # endpoints.
        optional(
          4,
          "valid_for",
          type: :message,
          message_type: "dev.sigstore.common.v1.TimeRange",
          json_name: "validFor",
          proto3_optional: false
        )
      end

      # TrustedRoot describes the client's complete set of trusted entities.
      # How the TrustedRoot is populated is not specified, but can be a
      # combination of many sources such as TUF repositories, files on disk etc.
      #
      # The TrustedRoot is not meant to be used for any artifact verification, only
      # to capture the complete/global set of trusted verification materials.
      # When verifying an artifact, based on the artifact and policies, a selection
      # of keys/authorities are expected to be extracted and provided to the
      # verification function. This way the set of keys/authorities can be kept to
      # a minimal set by the policy to gain better control over what signatures
      # that are allowed.
      #
      # The embedded transparency logs, CT logs, CAs and TSAs MUST include any
      # previously used instance -- otherwise signatures made in the past cannot
      # be verified.
      #
      # All the listed instances SHOULD be sorted by the 'valid_for' in ascending
      # order, that is, the oldest instance first. Only the last instance is
      # allowed to have their 'end' timestamp unset. All previous instances MUST
      # have a closed interval of validity. The last instance MAY have a closed
      # interval. Clients MUST accept instances that overlaps in time, if not
      # clients may experience problems during rotations of verification
      # materials.
      #
      # To be able to manage planned rotations of either transparency logs or
      # certificate authorities, clienst MUST accept lists of instances where
      # the last instance have a 'valid_for' that belongs to the future.
      # This should not be a problem as clients SHOULD first seek the trust root
      # for a suitable instance before creating a per artifact trust root (that
      # is, a sub-set of the complete trust root) that is used for verification.
      class TrustedRoot
        extend Protobug::Message

        self.full_name = "dev.sigstore.trustroot.v1.TrustedRoot"

        # MUST be application/vnd.dev.sigstore.trustedroot.v0.1+json
        # when encoded as JSON.
        # Clients MUST be able to process and parse content with the media
        # type defined in the old format:
        # application/vnd.dev.sigstore.trustedroot+json;version=0.1
        optional(
          1,
          "media_type",
          type: :string,
          json_name: "mediaType",
          proto3_optional: false
        )
        # A set of trusted Rekor servers.
        repeated(
          2,
          "tlogs",
          type: :message,
          message_type: "dev.sigstore.trustroot.v1.TransparencyLogInstance"
        )
        # A set of trusted certificate authorities (e.g Fulcio), and any
        # intermediate certificates they provide.
        # If a CA is issuing multiple intermediate certificate, each
        # combination shall be represented as separate chain. I.e, a single
        # root cert may appear in multiple chains but with different
        # intermediate and/or leaf certificates.
        # The certificates are intended to be used for verifying artifact
        # signatures.
        repeated(
          3,
          "certificate_authorities",
          type: :message,
          message_type: "dev.sigstore.trustroot.v1.CertificateAuthority",
          json_name: "certificateAuthorities"
        )
        # A set of trusted certificate transparency logs.
        repeated(
          4,
          "ctlogs",
          type: :message,
          message_type: "dev.sigstore.trustroot.v1.TransparencyLogInstance"
        )
        # A set of trusted timestamping authorities.
        repeated(
          5,
          "timestamp_authorities",
          type: :message,
          message_type: "dev.sigstore.trustroot.v1.CertificateAuthority",
          json_name: "timestampAuthorities"
        )
      end

      # SigningConfig represents the trusted entities/state needed by Sigstore
      # signing. In particular, it primarily contains service URLs that a Sigstore
      # signer may need to connect to for the online aspects of signing.
      class SigningConfig
        extend Protobug::Message

        self.full_name = "dev.sigstore.trustroot.v1.SigningConfig"

        # MUST be application/vnd.dev.sigstore.signingconfig.v0.1+json
        optional(
          5,
          "media_type",
          type: :string,
          json_name: "mediaType",
          proto3_optional: false
        )
        # A URL to a Fulcio-compatible CA, capable of receiving
        # Certificate Signing Requests (CSRs) and responding with
        # issued certificates.
        #
        # This URL **MUST** be the "base" URL for the CA, which clients
        # should construct an appropriate CSR endpoint on top of.
        # For example, if `ca_url` is `https://example.com/ca`, then
        # the client **MAY** construct the CSR endpoint as
        # `https://example.com/ca/api/v2/signingCert`.
        optional(
          1,
          "ca_url",
          type: :string,
          json_name: "caUrl",
          proto3_optional: false
        )
        # A URL to an OpenID Connect identity provider.
        #
        # This URL **MUST** be the "base" URL for the OIDC IdP, which clients
        # should perform well-known OpenID Connect discovery against.
        optional(
          2,
          "oidc_url",
          type: :string,
          json_name: "oidcUrl",
          proto3_optional: false
        )
        # One or more URLs to Rekor-compatible transparency log.
        #
        # Each URL **MUST** be the "base" URL for the transparency log,
        # which clients should construct appropriate API endpoints on top of.
        repeated(3, "tlog_urls", type: :string, json_name: "tlogUrls")
        # One ore more URLs to RFC 3161 Time Stamping Authority (TSA).
        #
        # Each URL **MUST** be the **full** URL for the TSA, meaning that it
        # should be suitable for submitting Time Stamp Requests (TSRs) to
        # via HTTP, per RFC 3161.
        repeated(4, "tsa_urls", type: :string, json_name: "tsaUrls")
      end

      # ClientTrustConfig describes the complete state needed by a client
      # to perform both signing and verification operations against a particular
      # instance of Sigstore.
      class ClientTrustConfig
        extend Protobug::Message

        self.full_name = "dev.sigstore.trustroot.v1.ClientTrustConfig"

        # MUST be application/vnd.dev.sigstore.clienttrustconfig.v0.1+json
        optional(
          1,
          "media_type",
          type: :string,
          json_name: "mediaType",
          proto3_optional: false
        )
        # The root of trust, which MUST be present.
        optional(
          2,
          "trusted_root",
          type: :message,
          message_type: "dev.sigstore.trustroot.v1.TrustedRoot",
          json_name: "trustedRoot",
          proto3_optional: false
        )
        # Configuration for signing clients, which MUST be present.
        optional(
          3,
          "signing_config",
          type: :message,
          message_type: "dev.sigstore.trustroot.v1.SigningConfig",
          json_name: "signingConfig",
          proto3_optional: false
        )
      end

      def self.register_sigstore_trustroot_protos(registry)
        Google::Api.register_field_behavior_protos(registry)
        Sigstore::Common::V1.register_sigstore_common_protos(registry)
        registry.register(Sigstore::TrustRoot::V1::TransparencyLogInstance)
        registry.register(Sigstore::TrustRoot::V1::CertificateAuthority)
        registry.register(Sigstore::TrustRoot::V1::TrustedRoot)
        registry.register(Sigstore::TrustRoot::V1::SigningConfig)
        registry.register(Sigstore::TrustRoot::V1::ClientTrustConfig)
      end
    end
  end
end
