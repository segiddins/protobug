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
      encoded -= 1 if value.negative?
      encode_varint encoded, outbuf
    end

    def encode_length(contents, outbuf)
      encode_varint contents.bytesize, outbuf
      outbuf << contents
    end

    def decode_varint(binary)
      if (byte0 = binary.getbyte || return) < 0x80
        byte0
      elsif (byte1 = binary.getbyte || return) < 0x80
        (byte1 << 7) | (byte0 & 0x7F)
      elsif (byte2 = binary.getbyte || return) < 0x80
        (byte2 << 14) |
          ((byte1 & 0x7F) << 7) |
          (byte0 & 0x7F)
      elsif (byte3 = binary.getbyte || return) < 0x80
        (byte3 << 21) |
          ((byte2 & 0x7F) << 14) |
          ((byte1 & 0x7F) << 7) |
          (byte0 & 0x7F)
      elsif (byte4 = binary.getbyte || return) < 0x80
        (byte4 << 28) |
          ((byte3 & 0x7F) << 21) |
          ((byte2 & 0x7F) << 14) |
          ((byte1 & 0x7F) << 7) |
          (byte0 & 0x7F)
      elsif (byte5 = binary.getbyte || return) < 0x80
        (byte5 << 35) |
          ((byte4 & 0x7F) << 28) |
          ((byte3 & 0x7F) << 21) |
          ((byte2 & 0x7F) << 14) |
          ((byte1 & 0x7F) << 7) |
          (byte0 & 0x7F)
      elsif (byte6 = binary.getbyte || return) < 0x80
        (byte6 << 42) |
          ((byte5 & 0x7F) << 35) |
          ((byte4 & 0x7F) << 28) |
          ((byte3 & 0x7F) << 21) |
          ((byte2 & 0x7F) << 14) |
          ((byte1 & 0x7F) << 7) |
          (byte0 & 0x7F)
      elsif (byte7 = binary.getbyte || return) < 0x80
        (byte7 << 49) |
          ((byte6 & 0x7F) << 42) |
          ((byte5 & 0x7F) << 35) |
          ((byte4 & 0x7F) << 28) |
          ((byte3 & 0x7F) << 21) |
          ((byte2 & 0x7F) << 14) |
          ((byte1 & 0x7F) << 7) |
          (byte0 & 0x7F)
      elsif (byte8 = binary.getbyte || return) < 0x80
        (byte8 << 56) |
          ((byte7 & 0x7F) << 49) |
          ((byte6 & 0x7F) << 42) |
          ((byte5 & 0x7F) << 35) |
          ((byte4 & 0x7F) << 28) |
          ((byte3 & 0x7F) << 21) |
          ((byte2 & 0x7F) << 14) |
          ((byte1 & 0x7F) << 7) |
          (byte0 & 0x7F)
      elsif (byte9 = binary.getbyte || return) < 0x80
        (byte9 << 63) |
          ((byte8 & 0x7F) << 56) |
          ((byte7 & 0x7F) << 49) |
          ((byte6 & 0x7F) << 42) |
          ((byte5 & 0x7F) << 35) |
          ((byte4 & 0x7F) << 28) |
          ((byte3 & 0x7F) << 21) |
          ((byte2 & 0x7F) << 14) |
          ((byte1 & 0x7F) << 7) |
          (byte0 & 0x7F)
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
