#!/usr/bin/env ruby

$:.unshift(File.expand_path("../lib", __dir__), __dir__)
require_relative "conformance/conformance.proto.pb.rb"
require_relative "protobuf_test_messages/proto2/test_messages_proto2.proto.pb.rb"
require_relative "protobuf_test_messages/proto3/test_messages_proto3.proto.pb.rb"
require "stringio"

$test_count = 0
$verbose = false

$registry = Protobug::Registry.new do |registry|
  Conformance.register_conformance_protos(registry)
  Protobuf_test_messages::Proto2.register_test_messages_proto2_protos(registry)
  Protobuf_test_messages::Proto3.register_test_messages_proto3_protos(registry)
end

def do_test(request)
  response = Conformance::ConformanceResponse.new
  descriptor = $registry.fetch(request.message_type, nil)
  test_message = nil

  unless descriptor
    response.skipped = "Unknown message type: " + request.message_type.inspect
  end

  begin
    case request.payload
    when :protobuf_payload
      begin
        test_message = descriptor.decode(StringIO.new(request.protobuf_payload), registry: $registry)
      rescue => err
        response.parse_error = err.full_message.encode('utf-8')
        return response
      end

    when :json_payload
      begin
        options = {}
        if request.test_category == Conformance::TestCategory::JSON_IGNORE_UNKNOWN_PARSING_TEST
          options[:ignore_unknown_fields] = true

        end
        test_message = descriptor.decode_json(request.json_payload, **options, registry: $registry)
      rescue => err
        if options.any?
        response.skipped = "options not supported: #{options.inspect}"
        else
        response.parse_error = err.full_message.encode('utf-8')
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
      fail 'Unspecified output format'

    when Conformance::WireFormat::PROTOBUF
      begin
        response.protobuf_payload = test_message.to_proto
      rescue => err
        response.serialize_error = err.full_message.encode('utf-8')
      end

    when Conformance::WireFormat::JSON
      begin
        response.json_payload = test_message.to_json
      rescue => err
        response.serialize_error = err.full_message.encode('utf-8')
      end

    else
      fail "Request didn't have requested output format: #{request.requested_output_format.inspect} #{request.inspect}"
    end
  rescue StandardError => err
    response.runtime_error = err.full_message.encode('utf-8')
  end

  response
end

# Returns true if the test ran successfully, false on legitimate EOF.
# If EOF is encountered in an unexpected place, raises IOError.
def do_test_io
  length_bytes = STDIN.read(4)
  return false if length_bytes.nil?

  length = length_bytes.unpack('V').first
  serialized_request = STDIN.read(length)
  if serialized_request.nil? || serialized_request.length != length
    fail IOError
  end

  request = Conformance::ConformanceRequest.decode(StringIO.new(serialized_request), registry: $registry)

  response = do_test(request)

  serialized_response = Conformance::ConformanceResponse.encode(response)
  warn "conformance_ruby: response too large: #{serialized_response.length}" if serialized_response.length > 1 << 20
  warn "conformance_ruby: response too small: #{response.inspect}" if serialized_response.length < 1
  STDOUT.write([serialized_response.length].pack('V'))
  STDOUT.write(serialized_response)
  STDOUT.flush

  if $verbose
    STDERR.puts("conformance_ruby: request=#{request.to_json}, " \
                                 "response=#{response.to_json}\n")
  end

  $test_count += 1

  true
end

loop do
  unless do_test_io
    STDERR.puts('conformance_ruby: received EOF from test runner ' \
                "after #{$test_count} tests, exiting")
    break
  end
end
