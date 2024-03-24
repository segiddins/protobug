# frozen_string_literal: true

require_relative "errors"

module Protobug
  module BinaryEncoding
    module_function

    def encode_varint(value, outbuf)
      raise EncodeError, "expected integer, got #{value.inspect}" unless value.is_a? Integer
      raise RangeError, "expected 64-bit integer" if value > (2**64) - 1 || value < -2**63

      negative = value.negative?
      value = (2**64) + value if negative
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
      outbuf << out.pack("c*")
    end

    def encode_zigzag(size, value, outbuf)
      raise EncodeError, "expected integer, got #{value.inspect}" unless value.is_a? Integer

      unless value.bit_length <= size
        raise EncodeError,
              "bitlength too large for #{size}-bit integer: #{value.bit_length}"
      end

      encoded = 2 * value.abs
      encoded -= 1 if value.negative?
      encode_varint encoded, outbuf
    end

    def encode_length(contents, outbuf)
      encode_varint contents.bytesize, outbuf
      outbuf << contents
    end

    def decode_varint(binary)
      byte = binary.getbyte
      return unless byte

      value = 0
      bl = 0
      loop do
        raise DecodeError, "varint too large" if bl > 63
        return value if byte.nil?
        return value | (byte << bl) if (byte & 0b1000_0000).zero? # no continuation bit set

        value |= ((byte & 0b0111_1111) << bl)
        bl += 7
        byte = binary.getbyte || raise(EOFError, "unexpected EOF")
      end
    end

    def decode_length(binary)
      length = decode_varint(binary) || raise(EOFError, "unexpected EOF")
      string = binary.read(length) || raise(EOFError, "unexpected EOF")
      raise EOFError, "expected #{length} bytes, got #{string.bytesize}" unless string.bytesize == length

      string
    end

    def decode_zigzag(size, value)
      negative = value & 1 == 1
      value %= 2**size
      value >>= 1
      value = -value - 1 if negative

      unless value.bit_length <= size
        raise DecodeError,
              "bitlength too large for #{size}-bit integer: #{value.bit_length}"
      end

      value
    end

    def read_field_value(binary, wire_type)
      case wire_type
      when 0
        decode_varint(binary) || raise(EOFError, "unexpected EOF")
      when 1
        value = binary.read(8)
        raise EOFError, "unexpected EOF" if value&.bytesize != 8

        value
      when 2
        decode_length(binary)
      when 3, 4
        raise UnsupportedFeatureError.new(:group, "reading groups from binary protos (in #{self})")
      when 5
        value = binary.read(4)
        raise EOFError, "unexpected EOF" if value&.bytesize != 4

        value
      else
        raise DecodeError, "unknown wire_type: #{wire_type}"
      end
    end
  end
end
