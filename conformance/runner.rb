#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "simplecov"

SimpleCov.root(File.expand_path("..", __dir__))
SimpleCov.start do
  enable_coverage :branch
end

require "protobug_conformance_protos"
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
      rescue Protobug::DecodeError, Protobug::InvalidValueError, EOFError => e
        response.parse_error = e.message.encode("utf-8")
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
      rescue Protobug::DecodeError, Protobug::InvalidValueError => e
        response.parse_error = e.message.encode("utf-8")
        return response
      end

    when :text_payload
      begin
        response.skipped = "Ruby doesn't support text format"
        return response
      end

    else
      raise "Request didn't have payload: #{request.payload.inspect} #{request.inspect}"
    end

    case request.requested_output_format
    when Conformance::WireFormat::UNSPECIFIED
      raise "Unspecified output format"

    when Conformance::WireFormat::PROTOBUF
      begin
        response.protobuf_payload = test_message.to_proto
      rescue Protobug::EncodeError => e
        response.serialize_error = e.message.encode("utf-8")
      end

    when Conformance::WireFormat::JSON
      begin
        response.json_payload = test_message.to_json(print_unknown_fields: request.print_unknown_fields)
      rescue Protobug::UnsupportedFeatureError
        raise
      rescue Protobug::EncodeError => e
        response.serialize_error = e.message.encode("utf-8")
      end

    when Conformance::WireFormat::TEXT_FORMAT
      response.skipped = "Ruby doesn't support text format"

    else
      raise "Request didn't have requested output format: #{request.requested_output_format.inspect} #{request.inspect}"
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
  raise IOError if serialized_request.nil? || serialized_request.length != length

  request = Conformance::ConformanceRequest.decode(StringIO.new(serialized_request), registry: $registry)

  response = do_test(request)

  serialized_response = response.to_proto
  warn "conformance_ruby: response too large: #{serialized_response.length}" if serialized_response.length > 1 << 20
  warn "conformance_ruby: response too small: #{response.inspect}" if serialized_response.empty?
  $stdout.write([serialized_response.length].pack("V"))
  $stdout.write(serialized_response)
  $stdout.flush

  if $verbose
    warn("conformance_ruby: request=#{request.to_json}, " \
         "response=#{response.to_json}\n")
  end

  $test_count += 1

  true
end

loop do
  next if do_test_io

  warn("conformance_ruby: received EOF from test runner " \
       "after #{$test_count} tests, exiting")
  break
end

SimpleCov.command_name "conformance:#{$test_count}"
