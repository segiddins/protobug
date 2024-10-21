# frozen_string_literal: true

require_relative "errors"

module Protobug
  module BinaryEncoding
    module_function

    def encode_varint(value, outbuf)
      raise EncodeError, "expected integer, got #{value.inspect}" unless value.is_a? Integer
      raise RangeError, "expected 64-bit integer" if value > (2**64) - 1 || value < -2**63

      value += 2**64 if value < 0
      out = []
      loop do
        if value.bit_length > 7
          out << (0b1000_0000 | (value & 0b0111_1111))
          value >>= 7
        else
          out << (value & 0b0111_1111)
          break
        end
      end
      pack(out, "c*", buffer: outbuf)
    end

    if RUBY_ENGINE == "truffleruby"
      # see https://github.com/oracle/truffleruby/issues/3559
      def pack(ary, format, buffer:)
        buffer.concat ary.pack(format)
      end
    else
      def pack(ary, format, buffer:)
        ary.pack(format, buffer: buffer)
      end
    end

    def encode_zigzag(size, value, outbuf)
      raise EncodeError, "expected integer, got #{value.inspect}" unless value.is_a? Integer

      unless value.bit_length <= size
        raise EncodeError,
              "bitlength too large for #{size}-bit integer: #{value.bit_length}"
      end

      encoded = 2 * value.abs
      encoded -= 1 if value < 0
      encode_varint encoded, outbuf
    end

    def encode_length(contents, outbuf)
      encode_varint contents.bytesize, outbuf
      outbuf << contents
    end
  end
end
