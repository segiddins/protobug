# frozen_string_literal: true

# Code generated by protoc-gen-protobug. DO NOT EDIT.

# source: google/protobuf/wrappers.proto
# syntax: proto3
# package: google.protobuf
# options:
#   java_package: "com.google.protobuf"
#   java_outer_classname: "WrappersProto"
#   java_multiple_files: true
#   go_package: "google.golang.org/protobuf/types/known/wrapperspb"
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
#
# Wrappers for primitive (non-message) types. These types are useful
# for embedding primitives in the `google.protobuf.Any` type and for places
# where we need to distinguish between the absence of a primitive
# typed field and its default value.
#
# These wrappers have no meaningful use within repeated fields as they lack
# the ability to detect presence on individual elements.
# These wrappers have no meaningful use within a map or a oneof since
# individual entries of a map or fields of a oneof can already detect presence.

require "protobug"

module Google
  module Protobuf
    # Wrapper message for `double`.
    #
    # The JSON representation for `DoubleValue` is JSON number.
    class DoubleValue
      extend Protobug::Message

      self.full_name = "google.protobuf.DoubleValue"

      # The double value.
      optional(1, "value", type: :double, proto3_optional: false)
    end

    # Wrapper message for `float`.
    #
    # The JSON representation for `FloatValue` is JSON number.
    class FloatValue
      extend Protobug::Message

      self.full_name = "google.protobuf.FloatValue"

      # The float value.
      optional(1, "value", type: :float, proto3_optional: false)
    end

    # Wrapper message for `int64`.
    #
    # The JSON representation for `Int64Value` is JSON string.
    class Int64Value
      extend Protobug::Message

      self.full_name = "google.protobuf.Int64Value"

      # The int64 value.
      optional(1, "value", type: :int64, proto3_optional: false)
    end

    # Wrapper message for `uint64`.
    #
    # The JSON representation for `UInt64Value` is JSON string.
    class UInt64Value
      extend Protobug::Message

      self.full_name = "google.protobuf.UInt64Value"

      # The uint64 value.
      optional(1, "value", type: :uint64, proto3_optional: false)
    end

    # Wrapper message for `int32`.
    #
    # The JSON representation for `Int32Value` is JSON number.
    class Int32Value
      extend Protobug::Message

      self.full_name = "google.protobuf.Int32Value"

      # The int32 value.
      optional(1, "value", type: :int32, proto3_optional: false)
    end

    # Wrapper message for `uint32`.
    #
    # The JSON representation for `UInt32Value` is JSON number.
    class UInt32Value
      extend Protobug::Message

      self.full_name = "google.protobuf.UInt32Value"

      # The uint32 value.
      optional(1, "value", type: :uint32, proto3_optional: false)
    end

    # Wrapper message for `bool`.
    #
    # The JSON representation for `BoolValue` is JSON `true` and `false`.
    class BoolValue
      extend Protobug::Message

      self.full_name = "google.protobuf.BoolValue"

      # The bool value.
      optional(1, "value", type: :bool, proto3_optional: false)
    end

    # Wrapper message for `string`.
    #
    # The JSON representation for `StringValue` is JSON string.
    class StringValue
      extend Protobug::Message

      self.full_name = "google.protobuf.StringValue"

      # The string value.
      optional(1, "value", type: :string, proto3_optional: false)
    end

    # Wrapper message for `bytes`.
    #
    # The JSON representation for `BytesValue` is JSON string.
    class BytesValue
      extend Protobug::Message

      self.full_name = "google.protobuf.BytesValue"

      # The bytes value.
      optional(1, "value", type: :bytes, proto3_optional: false)
    end

    def self.register_wrappers_protos(registry)
      registry.register(Google::Protobuf::DoubleValue)
      registry.register(Google::Protobuf::FloatValue)
      registry.register(Google::Protobuf::Int64Value)
      registry.register(Google::Protobuf::UInt64Value)
      registry.register(Google::Protobuf::Int32Value)
      registry.register(Google::Protobuf::UInt32Value)
      registry.register(Google::Protobuf::BoolValue)
      registry.register(Google::Protobuf::StringValue)
      registry.register(Google::Protobuf::BytesValue)
    end
  end
end

require_relative "wrappers_well_known"
