#!/usr/bin/env ruby
# frozen_string_literal: true

$:.unshift(File.expand_path("../lib", __dir__), __dir__)
require_relative "conformance/conformance_pb"
require_relative "protobuf_test_messages/proto2/test_messages_proto2_pb"
require_relative "protobuf_test_messages/proto3/test_messages_proto3_pb"
require "stringio"

$test_count = 0
$verbose = false

$registry = Protobug::Registry.new do |registry|
  Conformance.register_conformance_protos(registry)
  ProtobufTestMessages::Proto2.register_test_messages_proto2_protos(registry)
  ProtobufTestMessages::Proto3.register_test_messages_proto3_protos(registry)
end

def do_test(request)
  response = Conformance::ConformanceResponse.new
  descriptor = $registry.fetch(request.message_type, nil)
  test_message = nil

  response.skipped = "Unknown message type: #{request.message_type.inspect}" unless descriptor

  begin
    case request.payload
    when :protobuf_payload
      begin
        test_message = descriptor.decode(StringIO.new(request.protobuf_payload), registry: $registry)
      rescue Protobug::UnsupportedFeatureError
        raise
      rescue => e
        response.parse_error = e.full_message.encode("utf-8")
        return response
      end

    when :json_payload
      begin
        options = {}
        if request.test_category == Conformance::TestCategory::JSON_IGNORE_UNKNOWN_PARSING_TEST
          options[:ignore_unknown_fields] = true

        end
        test_message = descriptor.decode_json(request.json_payload, **options, registry: $registry)
      rescue Protobug::UnsupportedFeatureError
        raise
      rescue => e
        if options.any?
          response.skipped = "options not supported: #{options.inspect}"
        else
          response.parse_error = e.full_message.encode("utf-8")
        end
        return response
      end

    when :text_payload
      begin
        response.skipped = "Ruby doesn't support text format"
        return response
      end

    else
      fail "Request didn't have payload: #{request.payload.inspect} #{request.inspect}"
    end

    case request.requested_output_format
    when Conformance::WireFormat::UNSPECIFIED
      fail "Unspecified output format"

    when Conformance::WireFormat::PROTOBUF
      begin
        response.protobuf_payload = test_message.to_proto
      rescue => e
        response.serialize_error = e.full_message.encode("utf-8")
      end

    when Conformance::WireFormat::JSON
      begin
        response.json_payload = test_message.to_json
      rescue Protobug::UnsupportedFeatureError
        raise
      rescue => e
        response.serialize_error = e.full_message.encode("utf-8")
      end

    when Conformance::WireFormat::TEXT_FORMAT
      response.skipped = "Ruby doesn't support text format"

    else
      fail "Request didn't have requested output format: #{request.requested_output_format.inspect} #{request.inspect}"
    end
  rescue Protobug::UnsupportedFeatureError => e
    response.skipped = e.message
  rescue StandardError => e
    response.runtime_error = e.full_message.encode("utf-8")
  end

  response
end

# Returns true if the test ran successfully, false on legitimate EOF.
# If EOF is encountered in an unexpected place, raises IOError.
def do_test_io
  length_bytes = $stdin.read(4)
  return false if length_bytes.nil?

  length = length_bytes.unpack1("V")
  serialized_request = $stdin.read(length)
  fail IOError if serialized_request.nil? || serialized_request.length != length

  request = Conformance::ConformanceRequest.decode(StringIO.new(serialized_request), registry: $registry)

  response = do_test(request)

  serialized_response = Conformance::ConformanceResponse.encode(response)
  warn "conformance_ruby: response too large: #{serialized_response.length}" if serialized_response.length > 1 << 20
  warn "conformance_ruby: response too small: #{response.inspect}" if serialized_response.empty?
  $stdout.write([serialized_response.length].pack("V"))
  $stdout.write(serialized_response)
  $stdout.flush

  if $verbose
    $stderr.puts("conformance_ruby: request=#{request.to_json}, " \
                                 "response=#{response.to_json}\n")
  end

  $test_count += 1

  true
end

loop do
  next if do_test_io

  $stderr.puts("conformance_ruby: received EOF from test runner " \
              "after #{$test_count} tests, exiting")
  break
end
