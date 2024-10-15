# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: google/protobuf/test_messages_proto3.proto
# syntax: proto3
# package: protobuf_test_messages.proto3
# options:
#   java_package: "com.google.protobuf_test_messages.proto3"
#   optimize_for: SPEED
#   cc_enable_arenas: true
#   objc_class_prefix: "Proto3"

# Protocol Buffers - Google's data interchange format
# Copyright 2008 Google Inc.  All rights reserved.
#
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file or at
# https://developers.google.com/open-source/licenses/bsd
#
# Test schema for proto3 messages.  This test schema is used by:
#
# - benchmarks
# - fuzz tests
# - conformance tests

require "protobug"

require "google/protobuf/any_pb"
require "google/protobuf/duration_pb"
require "google/protobuf/field_mask_pb"
require "google/protobuf/struct_pb"
require "google/protobuf/timestamp_pb"
require "google/protobuf/wrappers_pb"

module ProtobufTestMessages
  module Proto3
    # This proto includes every type of field in both singular and repeated
    # forms.
    #
    # Also, crucially, all messages and enums in this file are eventually
    # submessages of this message.  So for example, a fuzz test of TestAllTypes
    # could trigger bugs that occur in any message type in this file.  We verify
    # this stays true in a unit test.
    class TestAllTypesProto3
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto3.TestAllTypesProto3"

      class NestedMessage
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto3.TestAllTypesProto3.NestedMessage"

        optional(1, "a", type: :int32, proto3_optional: false)
        optional(
          2,
          "corecursive",
          type: :message,
          message_class: "ProtobufTestMessages::Proto3::TestAllTypesProto3",
          proto3_optional: false
        )
      end

      class NestedEnum
        extend Protobug::Enum

        self.full_name = "protobuf_test_messages.proto3.TestAllTypesProto3.NestedEnum"

        FOO = new("FOO", 0).freeze
        BAR = new("BAR", 1).freeze
        BAZ = new("BAZ", 2).freeze
        NEG = new("NEG", -1).freeze # Intentionally negative.
      end

      class AliasedEnum
        extend Protobug::Enum

        self.full_name = "protobuf_test_messages.proto3.TestAllTypesProto3.AliasedEnum"

        ALIAS_FOO = new("ALIAS_FOO", 0).freeze
        ALIAS_BAR = new("ALIAS_BAR", 1).freeze
        ALIAS_BAZ = new("ALIAS_BAZ", 2).freeze
        MOO = new("MOO", 2).freeze
        K_moo = new("moo", 2).freeze
        K_bAz = new("bAz", 2).freeze
      end

      # Singular
      optional(
        1,
        "optional_int32",
        type: :int32,
        json_name: "optionalInt32",
        proto3_optional: false
      )
      optional(
        2,
        "optional_int64",
        type: :int64,
        json_name: "optionalInt64",
        proto3_optional: false
      )
      optional(
        3,
        "optional_uint32",
        type: :uint32,
        json_name: "optionalUint32",
        proto3_optional: false
      )
      optional(
        4,
        "optional_uint64",
        type: :uint64,
        json_name: "optionalUint64",
        proto3_optional: false
      )
      optional(
        5,
        "optional_sint32",
        type: :sint32,
        json_name: "optionalSint32",
        proto3_optional: false
      )
      optional(
        6,
        "optional_sint64",
        type: :sint64,
        json_name: "optionalSint64",
        proto3_optional: false
      )
      optional(
        7,
        "optional_fixed32",
        type: :fixed32,
        json_name: "optionalFixed32",
        proto3_optional: false
      )
      optional(
        8,
        "optional_fixed64",
        type: :fixed64,
        json_name: "optionalFixed64",
        proto3_optional: false
      )
      optional(
        9,
        "optional_sfixed32",
        type: :sfixed32,
        json_name: "optionalSfixed32",
        proto3_optional: false
      )
      optional(
        10,
        "optional_sfixed64",
        type: :sfixed64,
        json_name: "optionalSfixed64",
        proto3_optional: false
      )
      optional(
        11,
        "optional_float",
        type: :float,
        json_name: "optionalFloat",
        proto3_optional: false
      )
      optional(
        12,
        "optional_double",
        type: :double,
        json_name: "optionalDouble",
        proto3_optional: false
      )
      optional(
        13,
        "optional_bool",
        type: :bool,
        json_name: "optionalBool",
        proto3_optional: false
      )
      optional(
        14,
        "optional_string",
        type: :string,
        json_name: "optionalString",
        proto3_optional: false
      )
      optional(
        15,
        "optional_bytes",
        type: :bytes,
        json_name: "optionalBytes",
        proto3_optional: false
      )
      optional(
        18,
        "optional_nested_message",
        type: :message,
        message_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedMessage",
        json_name: "optionalNestedMessage",
        proto3_optional: false
      )
      optional(
        19,
        "optional_foreign_message",
        type: :message,
        message_class: "ProtobufTestMessages::Proto3::ForeignMessage",
        json_name: "optionalForeignMessage",
        proto3_optional: false
      )
      optional(
        21,
        "optional_nested_enum",
        type: :enum,
        enum_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedEnum",
        json_name: "optionalNestedEnum",
        proto3_optional: false
      )
      optional(
        22,
        "optional_foreign_enum",
        type: :enum,
        enum_class: "ProtobufTestMessages::Proto3::ForeignEnum",
        json_name: "optionalForeignEnum",
        proto3_optional: false
      )
      optional(
        23,
        "optional_aliased_enum",
        type: :enum,
        enum_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::AliasedEnum",
        json_name: "optionalAliasedEnum",
        proto3_optional: false
      )
      optional(
        24,
        "optional_string_piece",
        type: :string,
        json_name: "optionalStringPiece",
        proto3_optional: false
      )
      optional(
        25,
        "optional_cord",
        type: :string,
        json_name: "optionalCord",
        proto3_optional: false
      )
      optional(
        27,
        "recursive_message",
        type: :message,
        message_class: "ProtobufTestMessages::Proto3::TestAllTypesProto3",
        json_name: "recursiveMessage",
        proto3_optional: false
      )
      # Repeated
      repeated(
        31,
        "repeated_int32",
        type: :int32,
        packed: true,
        json_name: "repeatedInt32"
      )
      repeated(
        32,
        "repeated_int64",
        type: :int64,
        packed: true,
        json_name: "repeatedInt64"
      )
      repeated(
        33,
        "repeated_uint32",
        type: :uint32,
        packed: true,
        json_name: "repeatedUint32"
      )
      repeated(
        34,
        "repeated_uint64",
        type: :uint64,
        packed: true,
        json_name: "repeatedUint64"
      )
      repeated(
        35,
        "repeated_sint32",
        type: :sint32,
        packed: true,
        json_name: "repeatedSint32"
      )
      repeated(
        36,
        "repeated_sint64",
        type: :sint64,
        packed: true,
        json_name: "repeatedSint64"
      )
      repeated(
        37,
        "repeated_fixed32",
        type: :fixed32,
        packed: true,
        json_name: "repeatedFixed32"
      )
      repeated(
        38,
        "repeated_fixed64",
        type: :fixed64,
        packed: true,
        json_name: "repeatedFixed64"
      )
      repeated(
        39,
        "repeated_sfixed32",
        type: :sfixed32,
        packed: true,
        json_name: "repeatedSfixed32"
      )
      repeated(
        40,
        "repeated_sfixed64",
        type: :sfixed64,
        packed: true,
        json_name: "repeatedSfixed64"
      )
      repeated(
        41,
        "repeated_float",
        type: :float,
        packed: true,
        json_name: "repeatedFloat"
      )
      repeated(
        42,
        "repeated_double",
        type: :double,
        packed: true,
        json_name: "repeatedDouble"
      )
      repeated(
        43,
        "repeated_bool",
        type: :bool,
        packed: true,
        json_name: "repeatedBool"
      )
      repeated(
        44,
        "repeated_string",
        type: :string,
        json_name: "repeatedString"
      )
      repeated(45, "repeated_bytes", type: :bytes, json_name: "repeatedBytes")
      repeated(
        48,
        "repeated_nested_message",
        type: :message,
        message_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedMessage",
        json_name: "repeatedNestedMessage"
      )
      repeated(
        49,
        "repeated_foreign_message",
        type: :message,
        message_class: "ProtobufTestMessages::Proto3::ForeignMessage",
        json_name: "repeatedForeignMessage"
      )
      repeated(
        51,
        "repeated_nested_enum",
        type: :enum,
        enum_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedEnum",
        packed: true,
        json_name: "repeatedNestedEnum"
      )
      repeated(
        52,
        "repeated_foreign_enum",
        type: :enum,
        enum_class: "ProtobufTestMessages::Proto3::ForeignEnum",
        packed: true,
        json_name: "repeatedForeignEnum"
      )
      repeated(
        54,
        "repeated_string_piece",
        type: :string,
        json_name: "repeatedStringPiece"
      )
      repeated(55, "repeated_cord", type: :string, json_name: "repeatedCord")
      # Packed
      repeated(
        75,
        "packed_int32",
        type: :int32,
        packed: true,
        json_name: "packedInt32"
      )
      repeated(
        76,
        "packed_int64",
        type: :int64,
        packed: true,
        json_name: "packedInt64"
      )
      repeated(
        77,
        "packed_uint32",
        type: :uint32,
        packed: true,
        json_name: "packedUint32"
      )
      repeated(
        78,
        "packed_uint64",
        type: :uint64,
        packed: true,
        json_name: "packedUint64"
      )
      repeated(
        79,
        "packed_sint32",
        type: :sint32,
        packed: true,
        json_name: "packedSint32"
      )
      repeated(
        80,
        "packed_sint64",
        type: :sint64,
        packed: true,
        json_name: "packedSint64"
      )
      repeated(
        81,
        "packed_fixed32",
        type: :fixed32,
        packed: true,
        json_name: "packedFixed32"
      )
      repeated(
        82,
        "packed_fixed64",
        type: :fixed64,
        packed: true,
        json_name: "packedFixed64"
      )
      repeated(
        83,
        "packed_sfixed32",
        type: :sfixed32,
        packed: true,
        json_name: "packedSfixed32"
      )
      repeated(
        84,
        "packed_sfixed64",
        type: :sfixed64,
        packed: true,
        json_name: "packedSfixed64"
      )
      repeated(
        85,
        "packed_float",
        type: :float,
        packed: true,
        json_name: "packedFloat"
      )
      repeated(
        86,
        "packed_double",
        type: :double,
        packed: true,
        json_name: "packedDouble"
      )
      repeated(
        87,
        "packed_bool",
        type: :bool,
        packed: true,
        json_name: "packedBool"
      )
      repeated(
        88,
        "packed_nested_enum",
        type: :enum,
        enum_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedEnum",
        packed: true,
        json_name: "packedNestedEnum"
      )
      # Unpacked
      repeated(89, "unpacked_int32", type: :int32, json_name: "unpackedInt32")
      repeated(90, "unpacked_int64", type: :int64, json_name: "unpackedInt64")
      repeated(
        91,
        "unpacked_uint32",
        type: :uint32,
        json_name: "unpackedUint32"
      )
      repeated(
        92,
        "unpacked_uint64",
        type: :uint64,
        json_name: "unpackedUint64"
      )
      repeated(
        93,
        "unpacked_sint32",
        type: :sint32,
        json_name: "unpackedSint32"
      )
      repeated(
        94,
        "unpacked_sint64",
        type: :sint64,
        json_name: "unpackedSint64"
      )
      repeated(
        95,
        "unpacked_fixed32",
        type: :fixed32,
        json_name: "unpackedFixed32"
      )
      repeated(
        96,
        "unpacked_fixed64",
        type: :fixed64,
        json_name: "unpackedFixed64"
      )
      repeated(
        97,
        "unpacked_sfixed32",
        type: :sfixed32,
        json_name: "unpackedSfixed32"
      )
      repeated(
        98,
        "unpacked_sfixed64",
        type: :sfixed64,
        json_name: "unpackedSfixed64"
      )
      repeated(99, "unpacked_float", type: :float, json_name: "unpackedFloat")
      repeated(
        100,
        "unpacked_double",
        type: :double,
        json_name: "unpackedDouble"
      )
      repeated(101, "unpacked_bool", type: :bool, json_name: "unpackedBool")
      repeated(
        102,
        "unpacked_nested_enum",
        type: :enum,
        enum_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedEnum",
        json_name: "unpackedNestedEnum"
      )
      # Map
      map(
        56,
        "map_int32_int32",
        key_type: :int32,
        value_type: :int32,
        json_name: "mapInt32Int32"
      )
      map(
        57,
        "map_int64_int64",
        key_type: :int64,
        value_type: :int64,
        json_name: "mapInt64Int64"
      )
      map(
        58,
        "map_uint32_uint32",
        key_type: :uint32,
        value_type: :uint32,
        json_name: "mapUint32Uint32"
      )
      map(
        59,
        "map_uint64_uint64",
        key_type: :uint64,
        value_type: :uint64,
        json_name: "mapUint64Uint64"
      )
      map(
        60,
        "map_sint32_sint32",
        key_type: :sint32,
        value_type: :sint32,
        json_name: "mapSint32Sint32"
      )
      map(
        61,
        "map_sint64_sint64",
        key_type: :sint64,
        value_type: :sint64,
        json_name: "mapSint64Sint64"
      )
      map(
        62,
        "map_fixed32_fixed32",
        key_type: :fixed32,
        value_type: :fixed32,
        json_name: "mapFixed32Fixed32"
      )
      map(
        63,
        "map_fixed64_fixed64",
        key_type: :fixed64,
        value_type: :fixed64,
        json_name: "mapFixed64Fixed64"
      )
      map(
        64,
        "map_sfixed32_sfixed32",
        key_type: :sfixed32,
        value_type: :sfixed32,
        json_name: "mapSfixed32Sfixed32"
      )
      map(
        65,
        "map_sfixed64_sfixed64",
        key_type: :sfixed64,
        value_type: :sfixed64,
        json_name: "mapSfixed64Sfixed64"
      )
      map(
        66,
        "map_int32_float",
        key_type: :int32,
        value_type: :float,
        json_name: "mapInt32Float"
      )
      map(
        67,
        "map_int32_double",
        key_type: :int32,
        value_type: :double,
        json_name: "mapInt32Double"
      )
      map(
        68,
        "map_bool_bool",
        key_type: :bool,
        value_type: :bool,
        json_name: "mapBoolBool"
      )
      map(
        69,
        "map_string_string",
        key_type: :string,
        value_type: :string,
        json_name: "mapStringString"
      )
      map(
        70,
        "map_string_bytes",
        key_type: :string,
        value_type: :bytes,
        json_name: "mapStringBytes"
      )
      map(
        71,
        "map_string_nested_message",
        key_type: :string,
        value_type: :message,
        message_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedMessage",
        json_name: "mapStringNestedMessage"
      )
      map(
        72,
        "map_string_foreign_message",
        key_type: :string,
        value_type: :message,
        message_class: "ProtobufTestMessages::Proto3::ForeignMessage",
        json_name: "mapStringForeignMessage"
      )
      map(
        73,
        "map_string_nested_enum",
        key_type: :string,
        value_type: :enum,
        enum_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedEnum",
        json_name: "mapStringNestedEnum"
      )
      map(
        74,
        "map_string_foreign_enum",
        key_type: :string,
        value_type: :enum,
        enum_class: "ProtobufTestMessages::Proto3::ForeignEnum",
        json_name: "mapStringForeignEnum"
      )
      optional(
        111,
        "oneof_uint32",
        type: :uint32,
        json_name: "oneofUint32",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        112,
        "oneof_nested_message",
        type: :message,
        message_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedMessage",
        json_name: "oneofNestedMessage",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        113,
        "oneof_string",
        type: :string,
        json_name: "oneofString",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        114,
        "oneof_bytes",
        type: :bytes,
        json_name: "oneofBytes",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        115,
        "oneof_bool",
        type: :bool,
        json_name: "oneofBool",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        116,
        "oneof_uint64",
        type: :uint64,
        json_name: "oneofUint64",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        117,
        "oneof_float",
        type: :float,
        json_name: "oneofFloat",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        118,
        "oneof_double",
        type: :double,
        json_name: "oneofDouble",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        119,
        "oneof_enum",
        type: :enum,
        enum_class:
        "ProtobufTestMessages::Proto3::TestAllTypesProto3::NestedEnum",
        json_name: "oneofEnum",
        oneof: :oneof_field,
        proto3_optional: false
      )
      optional(
        120,
        "oneof_null_value",
        type: :enum,
        enum_class: "Google::Protobuf::NullValue",
        json_name: "oneofNullValue",
        oneof: :oneof_field,
        proto3_optional: false
      )
      # Well-known types
      optional(
        201,
        "optional_bool_wrapper",
        type: :message,
        message_class: "Google::Protobuf::BoolValue",
        json_name: "optionalBoolWrapper",
        proto3_optional: false
      )
      optional(
        202,
        "optional_int32_wrapper",
        type: :message,
        message_class: "Google::Protobuf::Int32Value",
        json_name: "optionalInt32Wrapper",
        proto3_optional: false
      )
      optional(
        203,
        "optional_int64_wrapper",
        type: :message,
        message_class: "Google::Protobuf::Int64Value",
        json_name: "optionalInt64Wrapper",
        proto3_optional: false
      )
      optional(
        204,
        "optional_uint32_wrapper",
        type: :message,
        message_class: "Google::Protobuf::UInt32Value",
        json_name: "optionalUint32Wrapper",
        proto3_optional: false
      )
      optional(
        205,
        "optional_uint64_wrapper",
        type: :message,
        message_class: "Google::Protobuf::UInt64Value",
        json_name: "optionalUint64Wrapper",
        proto3_optional: false
      )
      optional(
        206,
        "optional_float_wrapper",
        type: :message,
        message_class: "Google::Protobuf::FloatValue",
        json_name: "optionalFloatWrapper",
        proto3_optional: false
      )
      optional(
        207,
        "optional_double_wrapper",
        type: :message,
        message_class: "Google::Protobuf::DoubleValue",
        json_name: "optionalDoubleWrapper",
        proto3_optional: false
      )
      optional(
        208,
        "optional_string_wrapper",
        type: :message,
        message_class: "Google::Protobuf::StringValue",
        json_name: "optionalStringWrapper",
        proto3_optional: false
      )
      optional(
        209,
        "optional_bytes_wrapper",
        type: :message,
        message_class: "Google::Protobuf::BytesValue",
        json_name: "optionalBytesWrapper",
        proto3_optional: false
      )
      repeated(
        211,
        "repeated_bool_wrapper",
        type: :message,
        message_class: "Google::Protobuf::BoolValue",
        json_name: "repeatedBoolWrapper"
      )
      repeated(
        212,
        "repeated_int32_wrapper",
        type: :message,
        message_class: "Google::Protobuf::Int32Value",
        json_name: "repeatedInt32Wrapper"
      )
      repeated(
        213,
        "repeated_int64_wrapper",
        type: :message,
        message_class: "Google::Protobuf::Int64Value",
        json_name: "repeatedInt64Wrapper"
      )
      repeated(
        214,
        "repeated_uint32_wrapper",
        type: :message,
        message_class: "Google::Protobuf::UInt32Value",
        json_name: "repeatedUint32Wrapper"
      )
      repeated(
        215,
        "repeated_uint64_wrapper",
        type: :message,
        message_class: "Google::Protobuf::UInt64Value",
        json_name: "repeatedUint64Wrapper"
      )
      repeated(
        216,
        "repeated_float_wrapper",
        type: :message,
        message_class: "Google::Protobuf::FloatValue",
        json_name: "repeatedFloatWrapper"
      )
      repeated(
        217,
        "repeated_double_wrapper",
        type: :message,
        message_class: "Google::Protobuf::DoubleValue",
        json_name: "repeatedDoubleWrapper"
      )
      repeated(
        218,
        "repeated_string_wrapper",
        type: :message,
        message_class: "Google::Protobuf::StringValue",
        json_name: "repeatedStringWrapper"
      )
      repeated(
        219,
        "repeated_bytes_wrapper",
        type: :message,
        message_class: "Google::Protobuf::BytesValue",
        json_name: "repeatedBytesWrapper"
      )
      optional(
        301,
        "optional_duration",
        type: :message,
        message_class: "Google::Protobuf::Duration",
        json_name: "optionalDuration",
        proto3_optional: false
      )
      optional(
        302,
        "optional_timestamp",
        type: :message,
        message_class: "Google::Protobuf::Timestamp",
        json_name: "optionalTimestamp",
        proto3_optional: false
      )
      optional(
        303,
        "optional_field_mask",
        type: :message,
        message_class: "Google::Protobuf::FieldMask",
        json_name: "optionalFieldMask",
        proto3_optional: false
      )
      optional(
        304,
        "optional_struct",
        type: :message,
        message_class: "Google::Protobuf::Struct",
        json_name: "optionalStruct",
        proto3_optional: false
      )
      optional(
        305,
        "optional_any",
        type: :message,
        message_class: "Google::Protobuf::Any",
        json_name: "optionalAny",
        proto3_optional: false
      )
      optional(
        306,
        "optional_value",
        type: :message,
        message_class: "Google::Protobuf::Value",
        json_name: "optionalValue",
        proto3_optional: false
      )
      optional(
        307,
        "optional_null_value",
        type: :enum,
        enum_class: "Google::Protobuf::NullValue",
        json_name: "optionalNullValue",
        proto3_optional: false
      )
      repeated(
        311,
        "repeated_duration",
        type: :message,
        message_class: "Google::Protobuf::Duration",
        json_name: "repeatedDuration"
      )
      repeated(
        312,
        "repeated_timestamp",
        type: :message,
        message_class: "Google::Protobuf::Timestamp",
        json_name: "repeatedTimestamp"
      )
      repeated(
        313,
        "repeated_fieldmask",
        type: :message,
        message_class: "Google::Protobuf::FieldMask",
        json_name: "repeatedFieldmask"
      )
      repeated(
        324,
        "repeated_struct",
        type: :message,
        message_class: "Google::Protobuf::Struct",
        json_name: "repeatedStruct"
      )
      repeated(
        315,
        "repeated_any",
        type: :message,
        message_class: "Google::Protobuf::Any",
        json_name: "repeatedAny"
      )
      repeated(
        316,
        "repeated_value",
        type: :message,
        message_class: "Google::Protobuf::Value",
        json_name: "repeatedValue"
      )
      repeated(
        317,
        "repeated_list_value",
        type: :message,
        message_class: "Google::Protobuf::ListValue",
        json_name: "repeatedListValue"
      )
      # Test field-name-to-JSON-name convention.
      # (protobuf says names can be any valid C/C++ identifier.)
      optional(401, "fieldname1", type: :int32, proto3_optional: false)
      optional(
        402,
        "field_name2",
        type: :int32,
        json_name: "fieldName2",
        proto3_optional: false
      )
      optional(
        403,
        "_field_name3",
        type: :int32,
        json_name: "FieldName3",
        proto3_optional: false
      )
      optional(
        404,
        "field__name4_",
        type: :int32,
        json_name: "fieldName4",
        proto3_optional: false
      )
      optional(405, "field0name5", type: :int32, proto3_optional: false)
      optional(
        406,
        "field_0_name6",
        type: :int32,
        json_name: "field0Name6",
        proto3_optional: false
      )
      optional(407, "fieldName7", type: :int32, proto3_optional: false)
      optional(408, "FieldName8", type: :int32, proto3_optional: false)
      optional(
        409,
        "field_Name9",
        type: :int32,
        json_name: "fieldName9",
        proto3_optional: false
      )
      optional(
        410,
        "Field_Name10",
        type: :int32,
        json_name: "FieldName10",
        proto3_optional: false
      )
      optional(
        411,
        "FIELD_NAME11",
        type: :int32,
        json_name: "FIELDNAME11",
        proto3_optional: false
      )
      optional(
        412,
        "FIELD_name12",
        type: :int32,
        json_name: "FIELDName12",
        proto3_optional: false
      )
      optional(
        413,
        "__field_name13",
        type: :int32,
        json_name: "FieldName13",
        proto3_optional: false
      )
      optional(
        414,
        "__Field_name14",
        type: :int32,
        json_name: "FieldName14",
        proto3_optional: false
      )
      optional(
        415,
        "field__name15",
        type: :int32,
        json_name: "fieldName15",
        proto3_optional: false
      )
      optional(
        416,
        "field__Name16",
        type: :int32,
        json_name: "fieldName16",
        proto3_optional: false
      )
      optional(
        417,
        "field_name17__",
        type: :int32,
        json_name: "fieldName17",
        proto3_optional: false
      )
      optional(
        418,
        "Field_name18__",
        type: :int32,
        json_name: "FieldName18",
        proto3_optional: false
      )

      # Reserved for testing unknown fields
      reserved_range(501...511)
    end

    class ForeignMessage
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto3.ForeignMessage"

      optional(1, "c", type: :int32, proto3_optional: false)
    end

    class ForeignEnum
      extend Protobug::Enum

      self.full_name = "protobuf_test_messages.proto3.ForeignEnum"

      FOREIGN_FOO = new("FOREIGN_FOO", 0).freeze
      FOREIGN_BAR = new("FOREIGN_BAR", 1).freeze
      FOREIGN_BAZ = new("FOREIGN_BAZ", 2).freeze
    end

    class NullHypothesisProto3
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto3.NullHypothesisProto3"
    end

    class EnumOnlyProto3
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto3.EnumOnlyProto3"

      class Bool
        extend Protobug::Enum

        self.full_name = "protobuf_test_messages.proto3.EnumOnlyProto3.Bool"

        K_False = new("kFalse", 0).freeze
        K_True = new("kTrue", 1).freeze
      end
    end
  end
end
