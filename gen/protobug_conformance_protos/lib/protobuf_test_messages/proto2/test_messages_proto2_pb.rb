# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: google/protobuf/test_messages_proto2.proto
# syntax: proto2
# package: protobuf_test_messages.proto2
# options:
#   java_package: "com.google.protobuf_test_messages.proto2"
#   optimize_for: SPEED
#   cc_enable_arenas: true
#   objc_class_prefix: "Proto2"

# Protocol Buffers - Google's data interchange format
# Copyright 2008 Google Inc.  All rights reserved.
#
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file or at
# https://developers.google.com/open-source/licenses/bsd
#
# Test schema for proto2 messages.  This test schema is used by:
#
# - conformance tests

# LINT: ALLOW_GROUPS

require "protobug"

module ProtobufTestMessages
  module Proto2
    # This proto includes every type of field in both singular and repeated
    # forms.
    #
    # Also, crucially, all messages and enums in this file are eventually
    # submessages of this message.  So for example, a fuzz test of TestAllTypes
    # could trigger bugs that occur in any message type in this file.  We verify
    # this stays true in a unit test.
    class TestAllTypesProto2
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto2.TestAllTypesProto2"

      class NestedMessage
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllTypesProto2.NestedMessage"

        optional(1, "a", type: :int32)
        optional(
          2,
          "corecursive",
          type: :message,
          message_type: "protobuf_test_messages.proto2.TestAllTypesProto2"
        )
      end

      class NestedEnum
        extend Protobug::Enum

        self.full_name = "protobuf_test_messages.proto2.TestAllTypesProto2.NestedEnum"

        FOO = new("FOO", 0).freeze
        BAR = new("BAR", 1).freeze
        BAZ = new("BAZ", 2).freeze
        NEG = new("NEG", -1).freeze # Intentionally negative.
      end

      # Singular
      optional(1, "optional_int32", type: :int32, json_name: "optionalInt32")
      optional(2, "optional_int64", type: :int64, json_name: "optionalInt64")
      optional(3, "optional_uint32", type: :uint32, json_name: "optionalUint32")
      optional(4, "optional_uint64", type: :uint64, json_name: "optionalUint64")
      optional(5, "optional_sint32", type: :sint32, json_name: "optionalSint32")
      optional(6, "optional_sint64", type: :sint64, json_name: "optionalSint64")
      optional(
        7,
        "optional_fixed32",
        type: :fixed32,
        json_name: "optionalFixed32"
      )
      optional(
        8,
        "optional_fixed64",
        type: :fixed64,
        json_name: "optionalFixed64"
      )
      optional(
        9,
        "optional_sfixed32",
        type: :sfixed32,
        json_name: "optionalSfixed32"
      )
      optional(
        10,
        "optional_sfixed64",
        type: :sfixed64,
        json_name: "optionalSfixed64"
      )
      optional(11, "optional_float", type: :float, json_name: "optionalFloat")
      optional(
        12,
        "optional_double",
        type: :double,
        json_name: "optionalDouble"
      )
      optional(13, "optional_bool", type: :bool, json_name: "optionalBool")
      optional(
        14,
        "optional_string",
        type: :string,
        json_name: "optionalString"
      )
      optional(15, "optional_bytes", type: :bytes, json_name: "optionalBytes")
      optional(
        18,
        "optional_nested_message",
        type: :message,
        message_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedMessage",
        json_name: "optionalNestedMessage"
      )
      optional(
        19,
        "optional_foreign_message",
        type: :message,
        message_type: "protobuf_test_messages.proto2.ForeignMessageProto2",
        json_name: "optionalForeignMessage"
      )
      optional(
        21,
        "optional_nested_enum",
        type: :enum,
        enum_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedEnum",
        json_name: "optionalNestedEnum"
      )
      optional(
        22,
        "optional_foreign_enum",
        type: :enum,
        enum_type: "protobuf_test_messages.proto2.ForeignEnumProto2",
        json_name: "optionalForeignEnum"
      )
      optional(
        24,
        "optional_string_piece",
        type: :string,
        json_name: "optionalStringPiece"
      )
      optional(25, "optional_cord", type: :string, json_name: "optionalCord")
      optional(
        27,
        "recursive_message",
        type: :message,
        message_type: "protobuf_test_messages.proto2.TestAllTypesProto2",
        json_name: "recursiveMessage"
      )
      # Repeated
      repeated(31, "repeated_int32", type: :int32, json_name: "repeatedInt32")
      repeated(32, "repeated_int64", type: :int64, json_name: "repeatedInt64")
      repeated(
        33,
        "repeated_uint32",
        type: :uint32,
        json_name: "repeatedUint32"
      )
      repeated(
        34,
        "repeated_uint64",
        type: :uint64,
        json_name: "repeatedUint64"
      )
      repeated(
        35,
        "repeated_sint32",
        type: :sint32,
        json_name: "repeatedSint32"
      )
      repeated(
        36,
        "repeated_sint64",
        type: :sint64,
        json_name: "repeatedSint64"
      )
      repeated(
        37,
        "repeated_fixed32",
        type: :fixed32,
        json_name: "repeatedFixed32"
      )
      repeated(
        38,
        "repeated_fixed64",
        type: :fixed64,
        json_name: "repeatedFixed64"
      )
      repeated(
        39,
        "repeated_sfixed32",
        type: :sfixed32,
        json_name: "repeatedSfixed32"
      )
      repeated(
        40,
        "repeated_sfixed64",
        type: :sfixed64,
        json_name: "repeatedSfixed64"
      )
      repeated(41, "repeated_float", type: :float, json_name: "repeatedFloat")
      repeated(
        42,
        "repeated_double",
        type: :double,
        json_name: "repeatedDouble"
      )
      repeated(43, "repeated_bool", type: :bool, json_name: "repeatedBool")
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
        message_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedMessage",
        json_name: "repeatedNestedMessage"
      )
      repeated(
        49,
        "repeated_foreign_message",
        type: :message,
        message_type: "protobuf_test_messages.proto2.ForeignMessageProto2",
        json_name: "repeatedForeignMessage"
      )
      repeated(
        51,
        "repeated_nested_enum",
        type: :enum,
        enum_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedEnum",
        json_name: "repeatedNestedEnum"
      )
      repeated(
        52,
        "repeated_foreign_enum",
        type: :enum,
        enum_type: "protobuf_test_messages.proto2.ForeignEnumProto2",
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
        enum_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedEnum",
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
        enum_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedEnum",
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
        message_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedMessage",
        json_name: "mapStringNestedMessage"
      )
      map(
        72,
        "map_string_foreign_message",
        key_type: :string,
        value_type: :message,
        message_type: "protobuf_test_messages.proto2.ForeignMessageProto2",
        json_name: "mapStringForeignMessage"
      )
      map(
        73,
        "map_string_nested_enum",
        key_type: :string,
        value_type: :enum,
        enum_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedEnum",
        json_name: "mapStringNestedEnum"
      )
      map(
        74,
        "map_string_foreign_enum",
        key_type: :string,
        value_type: :enum,
        enum_type: "protobuf_test_messages.proto2.ForeignEnumProto2",
        json_name: "mapStringForeignEnum"
      )
      optional(
        111,
        "oneof_uint32",
        type: :uint32,
        json_name: "oneofUint32",
        oneof: :oneof_field
      )
      optional(
        112,
        "oneof_nested_message",
        type: :message,
        message_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedMessage",
        json_name: "oneofNestedMessage",
        oneof: :oneof_field
      )
      optional(
        113,
        "oneof_string",
        type: :string,
        json_name: "oneofString",
        oneof: :oneof_field
      )
      optional(
        114,
        "oneof_bytes",
        type: :bytes,
        json_name: "oneofBytes",
        oneof: :oneof_field
      )
      optional(
        115,
        "oneof_bool",
        type: :bool,
        json_name: "oneofBool",
        oneof: :oneof_field
      )
      optional(
        116,
        "oneof_uint64",
        type: :uint64,
        json_name: "oneofUint64",
        oneof: :oneof_field
      )
      optional(
        117,
        "oneof_float",
        type: :float,
        json_name: "oneofFloat",
        oneof: :oneof_field
      )
      optional(
        118,
        "oneof_double",
        type: :double,
        json_name: "oneofDouble",
        oneof: :oneof_field
      )
      optional(
        119,
        "oneof_enum",
        type: :enum,
        enum_type:
        "protobuf_test_messages.proto2.TestAllTypesProto2.NestedEnum",
        json_name: "oneofEnum",
        oneof: :oneof_field
      )
      optional(
        201,
        "data",
        type: :group,
        group_type: "protobuf_test_messages.proto2.TestAllTypesProto2.Data"
      )
      # groups
      class Data
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllTypesProto2.Data"

        optional(202, "group_int32", type: :int32, json_name: "groupInt32")
        optional(203, "group_uint32", type: :uint32, json_name: "groupUint32")
      end

      # default values
      optional(241, "default_int32", type: :int32, json_name: "defaultInt32")
      optional(242, "default_int64", type: :int64, json_name: "defaultInt64")
      optional(243, "default_uint32", type: :uint32, json_name: "defaultUint32")
      optional(244, "default_uint64", type: :uint64, json_name: "defaultUint64")
      optional(245, "default_sint32", type: :sint32, json_name: "defaultSint32")
      optional(246, "default_sint64", type: :sint64, json_name: "defaultSint64")
      optional(
        247,
        "default_fixed32",
        type: :fixed32,
        json_name: "defaultFixed32"
      )
      optional(
        248,
        "default_fixed64",
        type: :fixed64,
        json_name: "defaultFixed64"
      )
      optional(
        249,
        "default_sfixed32",
        type: :sfixed32,
        json_name: "defaultSfixed32"
      )
      optional(
        250,
        "default_sfixed64",
        type: :sfixed64,
        json_name: "defaultSfixed64"
      )
      optional(251, "default_float", type: :float, json_name: "defaultFloat")
      optional(252, "default_double", type: :double, json_name: "defaultDouble")
      optional(253, "default_bool", type: :bool, json_name: "defaultBool")
      optional(254, "default_string", type: :string, json_name: "defaultString")
      optional(255, "default_bytes", type: :bytes, json_name: "defaultBytes")
      # Test field-name-to-JSON-name convention.
      # (protobuf says names can be any valid C/C++ identifier.)
      optional(401, "fieldname1", type: :int32)
      optional(402, "field_name2", type: :int32, json_name: "fieldName2")
      optional(403, "_field_name3", type: :int32, json_name: "FieldName3")
      optional(404, "field__name4_", type: :int32, json_name: "fieldName4")
      optional(405, "field0name5", type: :int32)
      optional(406, "field_0_name6", type: :int32, json_name: "field0Name6")
      optional(407, "fieldName7", type: :int32)
      optional(408, "FieldName8", type: :int32)
      optional(409, "field_Name9", type: :int32, json_name: "fieldName9")
      optional(410, "Field_Name10", type: :int32, json_name: "FieldName10")
      optional(411, "FIELD_NAME11", type: :int32, json_name: "FIELDNAME11")
      optional(412, "FIELD_name12", type: :int32, json_name: "FIELDName12")
      optional(413, "__field_name13", type: :int32, json_name: "FieldName13")
      optional(414, "__Field_name14", type: :int32, json_name: "FieldName14")
      optional(415, "field__name15", type: :int32, json_name: "fieldName15")
      optional(416, "field__Name16", type: :int32, json_name: "fieldName16")
      optional(417, "field_name17__", type: :int32, json_name: "fieldName17")
      optional(418, "Field_name18__", type: :int32, json_name: "FieldName18")
      # message_set test case.
      class MessageSetCorrect
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllTypesProto2.MessageSetCorrect"
      end

      class MessageSetCorrectExtension1
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllTypesProto2.MessageSetCorrectExtension1"

        # extension: protobuf_test_messages.proto2.TestAllTypesProto2.MessageSetCorrect
        #   message_set_extension 1547769
        optional(25, "str", type: :string)
      end

      class MessageSetCorrectExtension2
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllTypesProto2.MessageSetCorrectExtension2"

        # extension: protobuf_test_messages.proto2.TestAllTypesProto2.MessageSetCorrect
        #   message_set_extension 4135312
        optional(9, "i", type: :int32)
      end

      # Reserved for unknown fields test.
      reserved_range(1_000...10_000)
    end

    class ForeignMessageProto2
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto2.ForeignMessageProto2"

      optional(1, "c", type: :int32)
    end

    class ForeignEnumProto2
      extend Protobug::Enum

      self.full_name = "protobuf_test_messages.proto2.ForeignEnumProto2"

      FOREIGN_FOO = new("FOREIGN_FOO", 0).freeze
      FOREIGN_BAR = new("FOREIGN_BAR", 1).freeze
      FOREIGN_BAZ = new("FOREIGN_BAZ", 2).freeze
    end

    # extension: protobuf_test_messages.proto2.TestAllTypesProto2
    #   extension_int32 120

    class UnknownToTestAllTypes
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto2.UnknownToTestAllTypes"

      optional(
        1_001,
        "optional_int32",
        type: :int32,
        json_name: "optionalInt32"
      )
      optional(
        1_002,
        "optional_string",
        type: :string,
        json_name: "optionalString"
      )
      optional(
        1_003,
        "nested_message",
        type: :message,
        message_type: "protobuf_test_messages.proto2.ForeignMessageProto2",
        json_name: "nestedMessage"
      )
      optional(
        1_004,
        "optionalgroup",
        type: :group,
        group_type:
        "protobuf_test_messages.proto2.UnknownToTestAllTypes.OptionalGroup"
      )
      class OptionalGroup
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.UnknownToTestAllTypes.OptionalGroup"

        optional(1, "a", type: :int32)
      end

      optional(1_006, "optional_bool", type: :bool, json_name: "optionalBool")
      repeated(
        1_011,
        "repeated_int32",
        type: :int32,
        json_name: "repeatedInt32"
      )
    end

    class NullHypothesisProto2
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto2.NullHypothesisProto2"
    end

    class EnumOnlyProto2
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto2.EnumOnlyProto2"

      class Bool
        extend Protobug::Enum

        self.full_name = "protobuf_test_messages.proto2.EnumOnlyProto2.Bool"

        K_False = new("kFalse", 0).freeze
        K_True = new("kTrue", 1).freeze
      end
    end

    class OneStringProto2
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto2.OneStringProto2"

      optional(1, "data", type: :string)
    end

    class ProtoWithKeywords
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto2.ProtoWithKeywords"

      optional(1, "inline", type: :int32)
      optional(2, "concept", type: :string)
      repeated(3, "requires", type: :string)
    end

    class TestAllRequiredTypesProto2
      extend Protobug::Message

      self.full_name = "protobuf_test_messages.proto2.TestAllRequiredTypesProto2"

      class NestedMessage
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.NestedMessage"

        required(1, "a", type: :int32)
        required(
          2,
          "corecursive",
          type: :message,
          message_type:
          "protobuf_test_messages.proto2.TestAllRequiredTypesProto2"
        )
        optional(
          3,
          "optional_corecursive",
          type: :message,
          message_type:
          "protobuf_test_messages.proto2.TestAllRequiredTypesProto2",
          json_name: "optionalCorecursive"
        )
      end

      class NestedEnum
        extend Protobug::Enum

        self.full_name = "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.NestedEnum"

        FOO = new("FOO", 0).freeze
        BAR = new("BAR", 1).freeze
        BAZ = new("BAZ", 2).freeze
        NEG = new("NEG", -1).freeze # Intentionally negative.
      end

      # Singular
      required(1, "required_int32", type: :int32, json_name: "requiredInt32")
      required(2, "required_int64", type: :int64, json_name: "requiredInt64")
      required(3, "required_uint32", type: :uint32, json_name: "requiredUint32")
      required(4, "required_uint64", type: :uint64, json_name: "requiredUint64")
      required(5, "required_sint32", type: :sint32, json_name: "requiredSint32")
      required(6, "required_sint64", type: :sint64, json_name: "requiredSint64")
      required(
        7,
        "required_fixed32",
        type: :fixed32,
        json_name: "requiredFixed32"
      )
      required(
        8,
        "required_fixed64",
        type: :fixed64,
        json_name: "requiredFixed64"
      )
      required(
        9,
        "required_sfixed32",
        type: :sfixed32,
        json_name: "requiredSfixed32"
      )
      required(
        10,
        "required_sfixed64",
        type: :sfixed64,
        json_name: "requiredSfixed64"
      )
      required(11, "required_float", type: :float, json_name: "requiredFloat")
      required(
        12,
        "required_double",
        type: :double,
        json_name: "requiredDouble"
      )
      required(13, "required_bool", type: :bool, json_name: "requiredBool")
      required(
        14,
        "required_string",
        type: :string,
        json_name: "requiredString"
      )
      required(15, "required_bytes", type: :bytes, json_name: "requiredBytes")
      required(
        18,
        "required_nested_message",
        type: :message,
        message_type:
        "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.NestedMessage",
        json_name: "requiredNestedMessage"
      )
      required(
        19,
        "required_foreign_message",
        type: :message,
        message_type: "protobuf_test_messages.proto2.ForeignMessageProto2",
        json_name: "requiredForeignMessage"
      )
      required(
        21,
        "required_nested_enum",
        type: :enum,
        enum_type:
        "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.NestedEnum",
        json_name: "requiredNestedEnum"
      )
      required(
        22,
        "required_foreign_enum",
        type: :enum,
        enum_type: "protobuf_test_messages.proto2.ForeignEnumProto2",
        json_name: "requiredForeignEnum"
      )
      required(
        24,
        "required_string_piece",
        type: :string,
        json_name: "requiredStringPiece"
      )
      required(25, "required_cord", type: :string, json_name: "requiredCord")
      required(
        27,
        "recursive_message",
        type: :message,
        message_type:
        "protobuf_test_messages.proto2.TestAllRequiredTypesProto2",
        json_name: "recursiveMessage"
      )
      optional(
        28,
        "optional_recursive_message",
        type: :message,
        message_type:
        "protobuf_test_messages.proto2.TestAllRequiredTypesProto2",
        json_name: "optionalRecursiveMessage"
      )
      required(
        201,
        "data",
        type: :group,
        group_type:
        "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.Data"
      )
      # groups
      class Data
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.Data"

        required(202, "group_int32", type: :int32, json_name: "groupInt32")
        required(203, "group_uint32", type: :uint32, json_name: "groupUint32")
      end

      # default values
      required(241, "default_int32", type: :int32, json_name: "defaultInt32")
      required(242, "default_int64", type: :int64, json_name: "defaultInt64")
      required(243, "default_uint32", type: :uint32, json_name: "defaultUint32")
      required(244, "default_uint64", type: :uint64, json_name: "defaultUint64")
      required(245, "default_sint32", type: :sint32, json_name: "defaultSint32")
      required(246, "default_sint64", type: :sint64, json_name: "defaultSint64")
      required(
        247,
        "default_fixed32",
        type: :fixed32,
        json_name: "defaultFixed32"
      )
      required(
        248,
        "default_fixed64",
        type: :fixed64,
        json_name: "defaultFixed64"
      )
      required(
        249,
        "default_sfixed32",
        type: :sfixed32,
        json_name: "defaultSfixed32"
      )
      required(
        250,
        "default_sfixed64",
        type: :sfixed64,
        json_name: "defaultSfixed64"
      )
      required(251, "default_float", type: :float, json_name: "defaultFloat")
      required(252, "default_double", type: :double, json_name: "defaultDouble")
      required(253, "default_bool", type: :bool, json_name: "defaultBool")
      required(254, "default_string", type: :string, json_name: "defaultString")
      required(255, "default_bytes", type: :bytes, json_name: "defaultBytes")
      # message_set test case.
      class MessageSetCorrect
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.MessageSetCorrect"
      end

      class MessageSetCorrectExtension1
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.MessageSetCorrectExtension1"

        # extension: protobuf_test_messages.proto2.TestAllRequiredTypesProto2.MessageSetCorrect
        #   message_set_extension 1547769
        required(25, "str", type: :string)
      end

      class MessageSetCorrectExtension2
        extend Protobug::Message

        self.full_name = "protobuf_test_messages.proto2.TestAllRequiredTypesProto2.MessageSetCorrectExtension2"

        # extension: protobuf_test_messages.proto2.TestAllRequiredTypesProto2.MessageSetCorrect
        #   message_set_extension 4135312
        required(9, "i", type: :int32)
      end

      # Reserved for unknown fields test.
      reserved_range(1_000...10_000)
    end

    def self.register_test_messages_proto2_protos(registry)
      registry.register(ProtobufTestMessages::Proto2::TestAllTypesProto2)
      registry.register(
        ProtobufTestMessages::Proto2::TestAllTypesProto2::NestedMessage
      )
      registry.register(
        ProtobufTestMessages::Proto2::TestAllTypesProto2::NestedEnum
      )
      registry.register(ProtobufTestMessages::Proto2::TestAllTypesProto2::Data)
      registry.register(
        ProtobufTestMessages::Proto2::TestAllTypesProto2::MessageSetCorrect
      )
      registry.register(
        ProtobufTestMessages::Proto2::TestAllTypesProto2::MessageSetCorrectExtension1
      )
      # extension: protobuf_test_messages.proto2.TestAllTypesProto2.MessageSetCorrect
      #   TYPE_MESSAGE 1547769
      registry.register(
        ProtobufTestMessages::Proto2::TestAllTypesProto2::MessageSetCorrectExtension2
      )
      # extension: protobuf_test_messages.proto2.TestAllTypesProto2.MessageSetCorrect
      #   TYPE_MESSAGE 4135312
      registry.register(ProtobufTestMessages::Proto2::ForeignMessageProto2)
      registry.register(ProtobufTestMessages::Proto2::ForeignEnumProto2)
      # extension: protobuf_test_messages.proto2.TestAllTypesProto2
      #   TYPE_INT32 120
      registry.register(ProtobufTestMessages::Proto2::UnknownToTestAllTypes)
      registry.register(
        ProtobufTestMessages::Proto2::UnknownToTestAllTypes::OptionalGroup
      )
      registry.register(ProtobufTestMessages::Proto2::NullHypothesisProto2)
      registry.register(ProtobufTestMessages::Proto2::EnumOnlyProto2)
      registry.register(ProtobufTestMessages::Proto2::EnumOnlyProto2::Bool)
      registry.register(ProtobufTestMessages::Proto2::OneStringProto2)
      registry.register(ProtobufTestMessages::Proto2::ProtoWithKeywords)
      registry.register(
        ProtobufTestMessages::Proto2::TestAllRequiredTypesProto2
      )
      registry.register(
        ProtobufTestMessages::Proto2::TestAllRequiredTypesProto2::NestedMessage
      )
      registry.register(
        ProtobufTestMessages::Proto2::TestAllRequiredTypesProto2::NestedEnum
      )
      registry.register(
        ProtobufTestMessages::Proto2::TestAllRequiredTypesProto2::Data
      )
      registry.register(
        ProtobufTestMessages::Proto2::TestAllRequiredTypesProto2::MessageSetCorrect
      )
      registry.register(
        ProtobufTestMessages::Proto2::TestAllRequiredTypesProto2::MessageSetCorrectExtension1
      )
      # extension: protobuf_test_messages.proto2.TestAllRequiredTypesProto2.MessageSetCorrect
      #   TYPE_MESSAGE 1547769
      registry.register(
        ProtobufTestMessages::Proto2::TestAllRequiredTypesProto2::MessageSetCorrectExtension2
      )
      # extension: protobuf_test_messages.proto2.TestAllRequiredTypesProto2.MessageSetCorrect
      #   TYPE_MESSAGE 4135312
    end
  end
end
