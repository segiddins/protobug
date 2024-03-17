# frozen_string_literal: true
# Code generated by protoc-gen-protobug. DO NOT EDIT.


# source: conformance/conformance.proto
# syntax: proto3
# package: conformance
# options:
#   java_package: "com.google.protobuf.conformance"
#   objc_class_prefix: "Conformance"

# Protocol Buffers - Google's data interchange format
# Copyright 2008 Google Inc.  All rights reserved.
#
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file or at
# https://developers.google.com/open-source/licenses/bsd

require "protobug"

module Conformance
  # This defines the conformance testing protocol.  This protocol exists between
  # the conformance test suite itself and the code being tested.  For each test,
  # the suite will send a ConformanceRequest message and expect a
  # ConformanceResponse message.
  #
  # You can either run the tests in two different ways:
  #
  #   1. in-process (using the interface in conformance_test.h).
  #
  #   2. as a sub-process communicating over a pipe.  Information about how to
  #      do this is in conformance_test_runner.cc.
  #
  # Pros/cons of the two approaches:
  #
  #   - running as a sub-process is much simpler for languages other than C/C++.
  #
  #   - running as a sub-process may be more tricky in unusual environments like
  #     iOS apps, where fork/stdin/stdout are not available.

  class WireFormat
    extend Protobug::Enum

    self.full_name = "conformance.WireFormat"

    UNSPECIFIED = new("UNSPECIFIED", 0).freeze
    PROTOBUF = new("PROTOBUF", 1).freeze
    JSON = new("JSON", 2).freeze
    JSPB = new(
      "JSPB",
      3
    ).freeze # Only used inside Google. Opensource testees just skip it.
    TEXT_FORMAT = new("TEXT_FORMAT", 4).freeze
  end

  class TestCategory
    extend Protobug::Enum

    self.full_name = "conformance.TestCategory"

    UNSPECIFIED_TEST = new("UNSPECIFIED_TEST", 0).freeze
    BINARY_TEST = new("BINARY_TEST", 1).freeze # Test binary wire format.
    JSON_TEST = new("JSON_TEST", 2).freeze # Test json wire format.
    # Similar to JSON_TEST. However, during parsing json, testee should ignore
    # unknown fields. This feature is optional. Each implementation can decide
    # whether to support it.  See
    # https://developers.google.com/protocol-buffers/docs/proto3#json_options
    # for more detail.
    JSON_IGNORE_UNKNOWN_PARSING_TEST = new(
      "JSON_IGNORE_UNKNOWN_PARSING_TEST",
      3
    ).freeze
    # Test jspb wire format. Only used inside Google. Opensource testees just
    # skip it.
    JSPB_TEST = new("JSPB_TEST", 4).freeze
    # Test text format. For cpp, java and python, testees can already deal with
    # this type. Testees of other languages can simply skip it.
    TEXT_FORMAT_TEST = new("TEXT_FORMAT_TEST", 5).freeze
  end

  # The conformance runner will request a list of failures as the first request.
  # This will be known by message_type == "conformance.FailureSet", a conformance
  # test should return a serialized FailureSet in protobuf_payload.
  class FailureSet
    extend Protobug::Message

    self.full_name = "conformance.FailureSet"

    repeated(1, "failure", type: :string)
  end

  # Represents a single test case's input.  The testee should:
  #
  #   1. parse this proto (which should always succeed)
  #   2. parse the protobuf or JSON payload in "payload" (which may fail)
  #   3. if the parse succeeded, serialize the message in the requested format.
  class ConformanceRequest
    extend Protobug::Message

    self.full_name = "conformance.ConformanceRequest"

    # The payload (whether protobuf of JSON) is always for a
    # protobuf_test_messages.proto3.TestAllTypes proto (as defined in
    # src/google/protobuf/proto3_test_messages.proto).

    optional(
      1,
      "protobuf_payload",
      type: :bytes,
      json_name: "protobufPayload",
      oneof: :payload,
      proto3_optional: false
    )
    optional(
      2,
      "json_payload",
      type: :string,
      json_name: "jsonPayload",
      oneof: :payload,
      proto3_optional: false
    )
    # Only used inside Google.  Opensource testees just skip it.
    optional(
      7,
      "jspb_payload",
      type: :string,
      json_name: "jspbPayload",
      oneof: :payload,
      proto3_optional: false
    )
    optional(
      8,
      "text_payload",
      type: :string,
      json_name: "textPayload",
      oneof: :payload,
      proto3_optional: false
    )
    # Which format should the testee serialize its message to?
    optional(
      3,
      "requested_output_format",
      type: :enum,
      enum_type: "conformance.WireFormat",
      json_name: "requestedOutputFormat",
      proto3_optional: false
    )
    # The full name for the test message to use; for the moment, either:
    # protobuf_test_messages.proto3.TestAllTypesProto3 or
    # protobuf_test_messages.google.protobuf.TestAllTypesProto2.
    optional(
      4,
      "message_type",
      type: :string,
      json_name: "messageType",
      proto3_optional: false
    )
    # Each test is given a specific test category. Some category may need
    # specific support in testee programs. Refer to the definition of
    # TestCategory for more information.
    optional(
      5,
      "test_category",
      type: :enum,
      enum_type: "conformance.TestCategory",
      json_name: "testCategory",
      proto3_optional: false
    )
    # Specify details for how to encode jspb.
    optional(
      6,
      "jspb_encoding_options",
      type: :message,
      message_type: "conformance.JspbEncodingConfig",
      json_name: "jspbEncodingOptions",
      proto3_optional: false
    )
    # This can be used in json and text format. If true, testee should print
    # unknown fields instead of ignore. This feature is optional.
    optional(
      9,
      "print_unknown_fields",
      type: :bool,
      json_name: "printUnknownFields",
      proto3_optional: false
    )
  end

  # Represents a single test case's output.
  class ConformanceResponse
    extend Protobug::Message

    self.full_name = "conformance.ConformanceResponse"

    # This string should be set to indicate parsing failed.  The string can
    # provide more information about the parse error if it is available.
    #
    # Setting this string does not necessarily mean the testee failed the
    # test.  Some of the test cases are intentionally invalid input.
    optional(
      1,
      "parse_error",
      type: :string,
      json_name: "parseError",
      oneof: :result,
      proto3_optional: false
    )
    # If the input was successfully parsed but errors occurred when
    # serializing it to the requested output format, set the error message in
    # this field.
    optional(
      6,
      "serialize_error",
      type: :string,
      json_name: "serializeError",
      oneof: :result,
      proto3_optional: false
    )
    # This should be set if the test program timed out.  The string should
    # provide more information about what the child process was doing when it
    # was killed.
    optional(
      9,
      "timeout_error",
      type: :string,
      json_name: "timeoutError",
      oneof: :result,
      proto3_optional: false
    )
    # This should be set if some other error occurred.  This will always
    # indicate that the test failed.  The string can provide more information
    # about the failure.
    optional(
      2,
      "runtime_error",
      type: :string,
      json_name: "runtimeError",
      oneof: :result,
      proto3_optional: false
    )
    # If the input was successfully parsed and the requested output was
    # protobuf, serialize it to protobuf and set it in this field.
    optional(
      3,
      "protobuf_payload",
      type: :bytes,
      json_name: "protobufPayload",
      oneof: :result,
      proto3_optional: false
    )
    # If the input was successfully parsed and the requested output was JSON,
    # serialize to JSON and set it in this field.
    optional(
      4,
      "json_payload",
      type: :string,
      json_name: "jsonPayload",
      oneof: :result,
      proto3_optional: false
    )
    # For when the testee skipped the test, likely because a certain feature
    # wasn't supported, like JSON input/output.
    optional(
      5,
      "skipped",
      type: :string,
      oneof: :result,
      proto3_optional: false
    )
    # If the input was successfully parsed and the requested output was JSPB,
    # serialize to JSPB and set it in this field. JSPB is only used inside
    # Google. Opensource testees can just skip it.
    optional(
      7,
      "jspb_payload",
      type: :string,
      json_name: "jspbPayload",
      oneof: :result,
      proto3_optional: false
    )
    # If the input was successfully parsed and the requested output was
    # TEXT_FORMAT, serialize to TEXT_FORMAT and set it in this field.
    optional(
      8,
      "text_payload",
      type: :string,
      json_name: "textPayload",
      oneof: :result,
      proto3_optional: false
    )
  end

  # Encoding options for jspb format.
  class JspbEncodingConfig
    extend Protobug::Message

    self.full_name = "conformance.JspbEncodingConfig"

    # Encode the value field of Any as jspb array if true, otherwise binary.
    optional(
      1,
      "use_jspb_array_any_format",
      type: :bool,
      json_name: "useJspbArrayAnyFormat",
      proto3_optional: false
    )
  end

  def self.register_conformance_protos(registry)
    registry.register(Conformance::WireFormat)
    registry.register(Conformance::TestCategory)
    registry.register(Conformance::FailureSet)
    registry.register(Conformance::ConformanceRequest)
    registry.register(Conformance::ConformanceResponse)
    registry.register(Conformance::JspbEncodingConfig)
  end
end
