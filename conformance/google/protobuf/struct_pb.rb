# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: google/protobuf/struct.proto
# syntax: proto3
# package: google.protobuf
# options:
#   java_package: "com.google.protobuf"
#   java_outer_classname: "StructProto"
#   java_multiple_files: true
#   go_package: "google.golang.org/protobuf/types/known/structpb"
#   cc_enable_arenas: true
#   objc_class_prefix: "GPB"
#   csharp_namespace: "Google.Protobuf.WellKnownTypes"

# Protocol Buffers - Google's data interchange format
# Copyright 2008 Google Inc.  All rights reserved.
# https://developers.google.com/protocol-buffers/
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require "protobug"

module Google
  module Protobuf
    # `Struct` represents a structured data value, consisting of fields
    # which map to dynamically typed values. In some languages, `Struct`
    # might be supported by a native representation. For example, in
    # scripting languages like JS a struct is represented as an
    # object. The details of that representation are described together
    # with the proto support for the language.
    #
    # The JSON representation for `Struct` is JSON object.
    class Struct
      extend Protobug::Message

      self.full_name = "google.protobuf.Struct"

      # Unordered map of dynamically typed values.
      map(
        1,
        "fields",
        type: :map,
        key_type: :string,
        value_type: :message,
        message_type: "google.protobuf.Value"
      )
    end

    # `Value` represents a dynamically typed value which can be either
    # null, a number, a string, a boolean, a recursive struct value, or a
    # list of values. A producer of value is expected to set one of these
    # variants. Absence of any variant indicates an error.
    #
    # The JSON representation for `Value` is JSON value.
    class Value
      extend Protobug::Message

      self.full_name = "google.protobuf.Value"

      # The kind of value.

      # Represents a null value.
      optional(
        1,
        "null_value",
        type: :enum,
        enum_type: "google.protobuf.NullValue",
        json_name: "nullValue",
        oneof: :kind,
        proto3_optional: false
      )
      # Represents a double value.
      optional(
        2,
        "number_value",
        type: :double,
        json_name: "numberValue",
        oneof: :kind,
        proto3_optional: false
      )
      # Represents a string value.
      optional(
        3,
        "string_value",
        type: :string,
        json_name: "stringValue",
        oneof: :kind,
        proto3_optional: false
      )
      # Represents a boolean value.
      optional(
        4,
        "bool_value",
        type: :bool,
        json_name: "boolValue",
        oneof: :kind,
        proto3_optional: false
      )
      # Represents a structured value.
      optional(
        5,
        "struct_value",
        type: :message,
        message_type: "google.protobuf.Struct",
        json_name: "structValue",
        oneof: :kind,
        proto3_optional: false
      )
      # Represents a repeated `Value`.
      optional(
        6,
        "list_value",
        type: :message,
        message_type: "google.protobuf.ListValue",
        json_name: "listValue",
        oneof: :kind,
        proto3_optional: false
      )
    end

    # `NullValue` is a singleton enumeration to represent the null value for the
    # `Value` type union.
    #
    # The JSON representation for `NullValue` is JSON `null`.
    class NullValue
      extend Protobug::Enum

      self.full_name = "google.protobuf.NullValue"

      # Null value.
      NULL_VALUE = new("NULL_VALUE", 0).freeze
    end

    # `ListValue` is a wrapper around a repeated field of values.
    #
    # The JSON representation for `ListValue` is JSON array.
    class ListValue
      extend Protobug::Message

      self.full_name = "google.protobuf.ListValue"

      # Repeated field of dynamically typed values.
      repeated(
        1,
        "values",
        type: :message,
        message_type: "google.protobuf.Value"
      )
    end

    def self.register_struct_protos(registry)
      registry.register(Google::Protobuf::Struct)
      registry.register(Google::Protobuf::Value)
      registry.register(Google::Protobuf::NullValue)
      registry.register(Google::Protobuf::ListValue)
    end
  end
end
