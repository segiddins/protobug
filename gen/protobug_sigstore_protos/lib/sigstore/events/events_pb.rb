# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: events.proto
# syntax: proto3
# package: dev.sigstore.events.v1
# options:
#   java_package: "dev.sigstore.proto.events.v1"
#   java_multiple_files: true
#   go_package: "github.com/sigstore/protobuf-specs/gen/pb-go/events/v1"
#   ruby_package: "Sigstore::Events"

# https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/formats/cloudevents.proto

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

# *
#  CloudEvent Protobuf Format
#
#  - Required context attributes are explicity represented.
#  - Optional and Extension context attributes are carried in a map structure.
#  - Data may be represented as binary, text, or protobuf messages.

require "protobug"

require "google/protobuf/any_pb"
require "google/protobuf/timestamp_pb"

module Sigstore
  module Events
    class CloudEvent
      extend Protobug::Message

      self.full_name = "dev.sigstore.events.v1.CloudEvent"

      # -- CloudEvent Context Attributes

      # Required Attributes
      optional(1, "id", type: :string, proto3_optional: false)
      optional(
        2,
        "source",
        type: :string,
        proto3_optional: false
      ) # URI-reference
      optional(
        3,
        "spec_version",
        type: :string,
        json_name: "specVersion",
        proto3_optional: false
      )
      optional(4, "type", type: :string, proto3_optional: false)
      # Optional & Extension Attributes
      map(
        5,
        "attributes",
        key_type: :string,
        value_type: :message,
        message_type:
        "dev.sigstore.events.v1.CloudEvent.CloudEventAttributeValue"
      )
      # -- CloudEvent Data (Bytes, Text, or Proto)

      optional(
        6,
        "binary_data",
        type: :bytes,
        json_name: "binaryData",
        oneof: :data,
        proto3_optional: false
      )
      optional(
        7,
        "text_data",
        type: :string,
        json_name: "textData",
        oneof: :data,
        proto3_optional: false
      )
      optional(
        8,
        "proto_data",
        type: :message,
        message_type: "google.protobuf.Any",
        json_name: "protoData",
        oneof: :data,
        proto3_optional: false
      )
      # *
      #  The CloudEvent specification defines
      #  seven attribute value types...

      class CloudEventAttributeValue
        extend Protobug::Message

        self.full_name = "dev.sigstore.events.v1.CloudEvent.CloudEventAttributeValue"

        optional(
          1,
          "ce_boolean",
          type: :bool,
          json_name: "ceBoolean",
          oneof: :attr,
          proto3_optional: false
        )
        optional(
          2,
          "ce_integer",
          type: :int32,
          json_name: "ceInteger",
          oneof: :attr,
          proto3_optional: false
        )
        optional(
          3,
          "ce_string",
          type: :string,
          json_name: "ceString",
          oneof: :attr,
          proto3_optional: false
        )
        optional(
          4,
          "ce_bytes",
          type: :bytes,
          json_name: "ceBytes",
          oneof: :attr,
          proto3_optional: false
        )
        optional(
          5,
          "ce_uri",
          type: :string,
          json_name: "ceUri",
          oneof: :attr,
          proto3_optional: false
        )
        optional(
          6,
          "ce_uri_ref",
          type: :string,
          json_name: "ceUriRef",
          oneof: :attr,
          proto3_optional: false
        )
        optional(
          7,
          "ce_timestamp",
          type: :message,
          message_type: "google.protobuf.Timestamp",
          json_name: "ceTimestamp",
          oneof: :attr,
          proto3_optional: false
        )
      end
    end

    # *
    #  CloudEvent Protobuf Batch Format

    class CloudEventBatch
      extend Protobug::Message

      self.full_name = "dev.sigstore.events.v1.CloudEventBatch"

      repeated(
        1,
        "events",
        type: :message,
        message_type: "dev.sigstore.events.v1.CloudEvent"
      )
    end

    def self.register_events_protos(registry)
      Google::Protobuf.register_any_protos(registry)
      Google::Protobuf.register_timestamp_protos(registry)
      registry.register(Sigstore::Events::CloudEvent)
      registry.register(Sigstore::Events::CloudEvent::CloudEventAttributeValue)
      registry.register(Sigstore::Events::CloudEventBatch)
    end
  end
end
