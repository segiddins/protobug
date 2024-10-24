class Google::Protobuf::Compiler::Version # /lib/google/protobuf/compiler/plugin_pb.rb:42
  def initialize(
    major: nil,
    minor: nil,
    patch: nil,
    suffix: nil
  )
    @unknown_fields = nil
    @__proto3_optional = 0
    @major = major
    @minor = minor
    @patch = patch
    @suffix = suffix
  end
  def hash
    ["google.protobuf.compiler.Version", @major, @minor, @patch, @suffix].hash
  end
  def __protobug_binary_decode(binary, index, max)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    raise EOFError, "message contains only tag with no values" if index >= max
    found = true
    while true
  raise EOFError, "premature EOF after tag before value (index #{index})" if index >= max
  unless found
    wire_type = header & 0b111
    number = (header ^ wire_type) >> 3
    unless number > 0
      raise DecodeError,
        "unexpected field number #{number} in #{self.class.full_name || self.class.fields_by_name.inspect}"
    end
    value = case wire_type
    when 0
      if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    when 1
      index += 8
      binary.byteslice(index - 8, 8)
    when 2
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      index += length
      binary.byteslice(index - length , length)
    when 3, 4
      raise GroupsUnsupportedError.new(self)
    when 5
      index += 4
      binary.byteslice(index - 4, 4)
    else
      raise DecodeError, "unsupported wire type #{wire_type}"
    end
    (@unknown_fields ||= []) << [number, wire_type, value]
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  found = false
  if header == 0x8
    found = true
    # optional(1, :major, type: :int32)
    value = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @major = (if (value & 0x8000_0000) != 0
      -(((value & 0x7FFF_FFFF) ^ 0x7FFF_FFFF) + 1)
    else
      value & 0x7FFF_FFFF
    end)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x10
    found = true
    # optional(2, :minor, type: :int32)
    value = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @minor = (if (value & 0x8000_0000) != 0
      -(((value & 0x7FFF_FFFF) ^ 0x7FFF_FFFF) + 1)
    else
      value & 0x7FFF_FFFF
    end)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x18
    found = true
    # optional(3, :patch, type: :int32)
    value = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @patch = (if (value & 0x8000_0000) != 0
      -(((value & 0x7FFF_FFFF) ^ 0x7FFF_FFFF) + 1)
    else
      value & 0x7FFF_FFFF
    end)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x22
    found = true
    # optional(4, :suffix, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @suffix = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @__proto3_optional = 0
    @major = nil
    @minor = nil
    @patch = nil
    @suffix = nil
    self
  end
  def as_json
    json = {}
    json["major"] = @major if has_major?
    json["minor"] = @minor if has_minor?
    json["patch"] = @patch if has_patch?
    json["suffix"] = @suffix if has_suffix?
    json
  end

  # optional(1, :major, type: :int32)
  def major=(value)
    return @major = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "major", value) unless value.is_a?(Integer)
    raise Protobug::InvalidValueError.new(self, "major", value, "does not fit into [-2147483648, 2147483647]") unless value <= 2147483647 && value >= -2147483648
    @major = value
  end
  def major
    value = @major
    return value unless value.nil?
    @major = 0
  end
  def has_major?
    value = @major
    return false if value.nil?
    true
  end
  def clear_major
    @major = nil
  end
  # optional(2, :minor, type: :int32)
  def minor=(value)
    return @minor = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "minor", value) unless value.is_a?(Integer)
    raise Protobug::InvalidValueError.new(self, "minor", value, "does not fit into [-2147483648, 2147483647]") unless value <= 2147483647 && value >= -2147483648
    @minor = value
  end
  def minor
    value = @minor
    return value unless value.nil?
    @minor = 0
  end
  def has_minor?
    value = @minor
    return false if value.nil?
    true
  end
  def clear_minor
    @minor = nil
  end
  # optional(3, :patch, type: :int32)
  def patch=(value)
    return @patch = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "patch", value) unless value.is_a?(Integer)
    raise Protobug::InvalidValueError.new(self, "patch", value, "does not fit into [-2147483648, 2147483647]") unless value <= 2147483647 && value >= -2147483648
    @patch = value
  end
  def patch
    value = @patch
    return value unless value.nil?
    @patch = 0
  end
  def has_patch?
    value = @patch
    return false if value.nil?
    true
  end
  def clear_patch
    @patch = nil
  end
  # optional(4, :suffix, type: :string)
  def suffix=(value)
    return @suffix = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "suffix", value) unless value.is_a?(String)
    @suffix = value
  end
  def suffix
    value = @suffix
    return value unless value.nil?
    @suffix = +""
  end
  def has_suffix?
    value = @suffix
    return false if value.nil?
    true
  end
  def clear_suffix
    @suffix = nil
  end
end
class Google::Protobuf::Compiler::CodeGeneratorRequest # /lib/google/protobuf/compiler/plugin_pb.rb:56
  def initialize(
    file_to_generate: [],
    parameter: nil,
    proto_file: [],
    source_file_descriptors: [],
    compiler_version: nil
  )
    @unknown_fields = nil
    @__proto3_optional = 0
    @file_to_generate = file_to_generate
    @parameter = parameter
    @proto_file = proto_file
    @source_file_descriptors = source_file_descriptors
    @compiler_version = compiler_version
  end
  def hash
    ["google.protobuf.compiler.CodeGeneratorRequest", @file_to_generate, @parameter, @proto_file, @source_file_descriptors, @compiler_version].hash
  end
  def __protobug_binary_decode(binary, index, max)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    raise EOFError, "message contains only tag with no values" if index >= max
    found = true
    while true
  raise EOFError, "premature EOF after tag before value (index #{index})" if index >= max
  unless found
    wire_type = header & 0b111
    number = (header ^ wire_type) >> 3
    unless number > 0
      raise DecodeError,
        "unexpected field number #{number} in #{self.class.full_name || self.class.fields_by_name.inspect}"
    end
    value = case wire_type
    when 0
      if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    when 1
      index += 8
      binary.byteslice(index - 8, 8)
    when 2
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      index += length
      binary.byteslice(index - length , length)
    when 3, 4
      raise GroupsUnsupportedError.new(self)
    when 5
      index += 4
      binary.byteslice(index - 4, 4)
    else
      raise DecodeError, "unsupported wire type #{wire_type}"
    end
    (@unknown_fields ||= []) << [number, wire_type, value]
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  found = false
  if header == 0xa
    found = true
    list = @file_to_generate
    while true
      # repeated(1, :file_to_generate, type: :string)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
      raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
      list << value
      index += length
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0xa
    end
  end
  if header == 0x12
    found = true
    # optional(2, :parameter, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @parameter = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    # optional(3, :compiler_version, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @compiler_version = (@compiler_version || Google::Protobuf::Compiler::Version.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x7a
    found = true
    list = @proto_file
    while true
      # repeated(15, :proto_file, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Google::Protobuf::FileDescriptorProto.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x7a
    end
  end
  if header == 0x8a
    found = true
    list = @source_file_descriptors
    while true
      # repeated(17, :source_file_descriptors, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Google::Protobuf::FileDescriptorProto.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x8a
    end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @__proto3_optional = 0
    @file_to_generate = []
    @parameter = nil
    @proto_file = []
    @source_file_descriptors = []
    @compiler_version = nil
    self
  end
  def as_json
    json = {}
    json["fileToGenerate"] = @file_to_generate unless @file_to_generate.empty?
    json["parameter"] = @parameter if has_parameter?
    json["protoFile"] = @proto_file.map(&:as_json) unless @proto_file.empty?
    json["sourceFileDescriptors"] = @source_file_descriptors.map(&:as_json) unless @source_file_descriptors.empty?
    json["compilerVersion"] = @compiler_version.as_json if has_compiler_version?
    json
  end

  # repeated(1, :file_to_generate, type: :string)
  attr_reader :file_to_generate
  def has_file_to_generate?
    value = @file_to_generate
  
    !value.empty?
  end
  def clear_file_to_generate
    @file_to_generate.clear
  end
  def add_file_to_generate(value)
    existing = @file_to_generate
    raise Protobug::InvalidValueError.new(self, "file_to_generate", value) unless value.is_a?(String)
    existing << value
  end
  # optional(2, :parameter, type: :string)
  def parameter=(value)
    return @parameter = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "parameter", value) unless value.is_a?(String)
    @parameter = value
  end
  def parameter
    value = @parameter
    return value unless value.nil?
    @parameter = +""
  end
  def has_parameter?
    value = @parameter
    return false if value.nil?
    true
  end
  def clear_parameter
    @parameter = nil
  end
  # repeated(15, :proto_file, type: :message)
  attr_reader :proto_file
  def has_proto_file?
    value = @proto_file
  
    !value.empty?
  end
  def clear_proto_file
    @proto_file.clear
  end
  def add_proto_file(value)
    existing = @proto_file
    raise Protobug::InvalidValueError.new(self, "proto_file", value) unless value.is_a?(Google::Protobuf::FileDescriptorProto)
    existing << value
  end
  # repeated(17, :source_file_descriptors, type: :message)
  attr_reader :source_file_descriptors
  def has_source_file_descriptors?
    value = @source_file_descriptors
  
    !value.empty?
  end
  def clear_source_file_descriptors
    @source_file_descriptors.clear
  end
  def add_source_file_descriptors(value)
    existing = @source_file_descriptors
    raise Protobug::InvalidValueError.new(self, "source_file_descriptors", value) unless value.is_a?(Google::Protobuf::FileDescriptorProto)
    existing << value
  end
  # optional(3, :compiler_version, type: :message)
  def compiler_version=(value)
    return @compiler_version = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "compiler_version", value) unless value.is_a?(Google::Protobuf::Compiler::Version)
    @compiler_version = value
  end
  def compiler_version
    value = @compiler_version
    return value unless value.nil?
    @compiler_version = Google::Protobuf::Compiler::Version.allocate.__protobug_initialize_defaults
  end
  def has_compiler_version?
    value = @compiler_version
    return false if value.nil?
    true
  end
  def clear_compiler_version
    @compiler_version = nil
  end
end
class Google::Protobuf::Compiler::CodeGeneratorResponse # /lib/google/protobuf/compiler/plugin_pb.rb:119
  def initialize(
    error: nil,
    supported_features: nil,
    minimum_edition: nil,
    maximum_edition: nil,
    file: []
  )
    @unknown_fields = nil
    @__proto3_optional = 0
    @error = error
    @supported_features = supported_features
    @minimum_edition = minimum_edition
    @maximum_edition = maximum_edition
    @file = file
  end
  def hash
    ["google.protobuf.compiler.CodeGeneratorResponse", @error, @supported_features, @minimum_edition, @maximum_edition, @file].hash
  end
  def __protobug_binary_decode(binary, index, max)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    raise EOFError, "message contains only tag with no values" if index >= max
    found = true
    while true
  raise EOFError, "premature EOF after tag before value (index #{index})" if index >= max
  unless found
    wire_type = header & 0b111
    number = (header ^ wire_type) >> 3
    unless number > 0
      raise DecodeError,
        "unexpected field number #{number} in #{self.class.full_name || self.class.fields_by_name.inspect}"
    end
    value = case wire_type
    when 0
      if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    when 1
      index += 8
      binary.byteslice(index - 8, 8)
    when 2
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      index += length
      binary.byteslice(index - length , length)
    when 3, 4
      raise GroupsUnsupportedError.new(self)
    when 5
      index += 4
      binary.byteslice(index - 4, 4)
    else
      raise DecodeError, "unsupported wire type #{wire_type}"
    end
    (@unknown_fields ||= []) << [number, wire_type, value]
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  found = false
  if header == 0xa
    found = true
    # optional(1, :error, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @error = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x10
    found = true
    # optional(2, :supported_features, type: :uint64)
    @supported_features = (if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x18
    found = true
    # optional(3, :minimum_edition, type: :int32)
    value = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @minimum_edition = (if (value & 0x8000_0000) != 0
      -(((value & 0x7FFF_FFFF) ^ 0x7FFF_FFFF) + 1)
    else
      value & 0x7FFF_FFFF
    end)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x20
    found = true
    # optional(4, :maximum_edition, type: :int32)
    value = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @maximum_edition = (if (value & 0x8000_0000) != 0
      -(((value & 0x7FFF_FFFF) ^ 0x7FFF_FFFF) + 1)
    else
      value & 0x7FFF_FFFF
    end)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x7a
    found = true
    list = @file
    while true
      # repeated(15, :file, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Google::Protobuf::Compiler::CodeGeneratorResponse::File.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x7a
    end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @__proto3_optional = 0
    @error = nil
    @supported_features = nil
    @minimum_edition = nil
    @maximum_edition = nil
    @file = []
    self
  end
  def as_json
    json = {}
    json["error"] = @error if has_error?
    json["supportedFeatures"] = @supported_features.to_s if has_supported_features?
    json["minimumEdition"] = @minimum_edition if has_minimum_edition?
    json["maximumEdition"] = @maximum_edition if has_maximum_edition?
    json["file"] = @file.map(&:as_json) unless @file.empty?
    json
  end

  # optional(1, :error, type: :string)
  def error=(value)
    return @error = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "error", value) unless value.is_a?(String)
    @error = value
  end
  def error
    value = @error
    return value unless value.nil?
    @error = +""
  end
  def has_error?
    value = @error
    return false if value.nil?
    true
  end
  def clear_error
    @error = nil
  end
  # optional(2, :supported_features, type: :uint64)
  def supported_features=(value)
    return @supported_features = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "supported_features", value) unless value.is_a?(Integer)
    raise Protobug::InvalidValueError.new(self, "supported_features", value, "does not fit into [0, 18446744073709551615]") unless value <= 18446744073709551615 && value >= 0
    @supported_features = value
  end
  def supported_features
    value = @supported_features
    return value unless value.nil?
    @supported_features = 0
  end
  def has_supported_features?
    value = @supported_features
    return false if value.nil?
    true
  end
  def clear_supported_features
    @supported_features = nil
  end
  # optional(3, :minimum_edition, type: :int32)
  def minimum_edition=(value)
    return @minimum_edition = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "minimum_edition", value) unless value.is_a?(Integer)
    raise Protobug::InvalidValueError.new(self, "minimum_edition", value, "does not fit into [-2147483648, 2147483647]") unless value <= 2147483647 && value >= -2147483648
    @minimum_edition = value
  end
  def minimum_edition
    value = @minimum_edition
    return value unless value.nil?
    @minimum_edition = 0
  end
  def has_minimum_edition?
    value = @minimum_edition
    return false if value.nil?
    true
  end
  def clear_minimum_edition
    @minimum_edition = nil
  end
  # optional(4, :maximum_edition, type: :int32)
  def maximum_edition=(value)
    return @maximum_edition = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "maximum_edition", value) unless value.is_a?(Integer)
    raise Protobug::InvalidValueError.new(self, "maximum_edition", value, "does not fit into [-2147483648, 2147483647]") unless value <= 2147483647 && value >= -2147483648
    @maximum_edition = value
  end
  def maximum_edition
    value = @maximum_edition
    return value unless value.nil?
    @maximum_edition = 0
  end
  def has_maximum_edition?
    value = @maximum_edition
    return false if value.nil?
    true
  end
  def clear_maximum_edition
    @maximum_edition = nil
  end
  # repeated(15, :file, type: :message)
  attr_reader :file
  def has_file?
    value = @file
  
    !value.empty?
  end
  def clear_file
    @file.clear
  end
  def add_file(value)
    existing = @file
    raise Protobug::InvalidValueError.new(self, "file", value) unless value.is_a?(Google::Protobuf::Compiler::CodeGeneratorResponse::File)
    existing << value
  end
end
module Google::Protobuf::Compiler::CodeGeneratorResponse::Feature # /lib/google/protobuf/compiler/plugin_pb.rb:142
end
class Google::Protobuf::Compiler::CodeGeneratorResponse::File # /lib/google/protobuf/compiler/plugin_pb.rb:173
  def initialize(
    name: nil,
    insertion_point: nil,
    content: nil,
    generated_code_info: nil
  )
    @unknown_fields = nil
    @__proto3_optional = 0
    @name = name
    @insertion_point = insertion_point
    @content = content
    @generated_code_info = generated_code_info
  end
  def hash
    ["google.protobuf.compiler.CodeGeneratorResponse.File", @name, @insertion_point, @content, @generated_code_info].hash
  end
  def __protobug_binary_decode(binary, index, max)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    raise EOFError, "message contains only tag with no values" if index >= max
    found = true
    while true
  raise EOFError, "premature EOF after tag before value (index #{index})" if index >= max
  unless found
    wire_type = header & 0b111
    number = (header ^ wire_type) >> 3
    unless number > 0
      raise DecodeError,
        "unexpected field number #{number} in #{self.class.full_name || self.class.fields_by_name.inspect}"
    end
    value = case wire_type
    when 0
      if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    when 1
      index += 8
      binary.byteslice(index - 8, 8)
    when 2
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      index += length
      binary.byteslice(index - length , length)
    when 3, 4
      raise GroupsUnsupportedError.new(self)
    when 5
      index += 4
      binary.byteslice(index - 4, 4)
    else
      raise DecodeError, "unsupported wire type #{wire_type}"
    end
    (@unknown_fields ||= []) << [number, wire_type, value]
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  found = false
  if header == 0xa
    found = true
    # optional(1, :name, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @name = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :insertion_point, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @insertion_point = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x7a
    found = true
    # optional(15, :content, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @content = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x82
    found = true
    # optional(16, :generated_code_info, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @generated_code_info = (@generated_code_info || Google::Protobuf::GeneratedCodeInfo.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @__proto3_optional = 0
    @name = nil
    @insertion_point = nil
    @content = nil
    @generated_code_info = nil
    self
  end
  def as_json
    json = {}
    json["name"] = @name if has_name?
    json["insertionPoint"] = @insertion_point if has_insertion_point?
    json["content"] = @content if has_content?
    json["generatedCodeInfo"] = @generated_code_info.as_json if has_generated_code_info?
    json
  end

  # optional(1, :name, type: :string)
  def name=(value)
    return @name = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "name", value) unless value.is_a?(String)
    @name = value
  end
  def name
    value = @name
    return value unless value.nil?
    @name = +""
  end
  def has_name?
    value = @name
    return false if value.nil?
    true
  end
  def clear_name
    @name = nil
  end
  # optional(2, :insertion_point, type: :string)
  def insertion_point=(value)
    return @insertion_point = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "insertion_point", value) unless value.is_a?(String)
    @insertion_point = value
  end
  def insertion_point
    value = @insertion_point
    return value unless value.nil?
    @insertion_point = +""
  end
  def has_insertion_point?
    value = @insertion_point
    return false if value.nil?
    true
  end
  def clear_insertion_point
    @insertion_point = nil
  end
  # optional(15, :content, type: :string)
  def content=(value)
    return @content = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "content", value) unless value.is_a?(String)
    @content = value
  end
  def content
    value = @content
    return value unless value.nil?
    @content = +""
  end
  def has_content?
    value = @content
    return false if value.nil?
    true
  end
  def clear_content
    @content = nil
  end
  # optional(16, :generated_code_info, type: :message)
  def generated_code_info=(value)
    return @generated_code_info = nil if value.nil?
    raise Protobug::InvalidValueError.new(self, "generated_code_info", value) unless value.is_a?(Google::Protobuf::GeneratedCodeInfo)
    @generated_code_info = value
  end
  def generated_code_info
    value = @generated_code_info
    return value unless value.nil?
    @generated_code_info = Google::Protobuf::GeneratedCodeInfo.allocate.__protobug_initialize_defaults
  end
  def has_generated_code_info?
    value = @generated_code_info
    return false if value.nil?
    true
  end
  def clear_generated_code_info
    @generated_code_info = nil
  end
end
