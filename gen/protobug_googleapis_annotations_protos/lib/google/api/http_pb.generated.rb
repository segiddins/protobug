class Google::Api::Http # /lib/google/api/http_pb.rb:37
  def initialize(
    rules: [],
    fully_decode_reserved_expansion: nil
  )
    @unknown_fields = nil
    @rules = rules
    @fully_decode_reserved_expansion = fully_decode_reserved_expansion
  end
  def hash
    ["google.api.Http", @unknown_fields, @rules, @fully_decode_reserved_expansion].hash
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
    list = @rules
    while true
      # repeated(1, :rules, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Google::Api::HttpRule.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0xa
    end
  end
  if header == 0x10
    found = true
    # optional(2, :fully_decode_reserved_expansion, type: :bool)
    value = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @fully_decode_reserved_expansion = (value != 0)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @rules = []
    @fully_decode_reserved_expansion = nil
    self
  end
  def as_json
    json = {}
    json["rules"] = @rules.map(&:as_json) unless @rules.empty?
    json["fullyDecodeReservedExpansion"] = @fully_decode_reserved_expansion.to_s if has_fully_decode_reserved_expansion?
    json
  end

  # repeated(1, :rules, type: :message)
  attr_reader :rules
  def has_rules?
    value = @rules
  
    !value.empty?
  end
  def clear_rules
    @rules.clear
  end
  def add_rules(value)
    existing = @rules
    raise Protobug::InvalidValueError.new(self, "rules", value) unless value.is_a?(Google::Api::HttpRule)
    existing << value
  end
  # optional(2, :fully_decode_reserved_expansion, type: :bool)
  def fully_decode_reserved_expansion=(value)
  raise InvalidValueError.new(self, "fully_decode_reserved_expansion", value, "expected boolean") unless true == value || false == value
    @fully_decode_reserved_expansion = value
  end
  def fully_decode_reserved_expansion
    value = @fully_decode_reserved_expansion
    return value unless value.nil?
    @fully_decode_reserved_expansion = false
  end
  def has_fully_decode_reserved_expansion?
    value = @fully_decode_reserved_expansion
    return false if value.nil? || false == value
    true
  end
  def clear_fully_decode_reserved_expansion
    @fully_decode_reserved_expansion = nil
  end
end
class Google::Api::HttpRule # /lib/google/api/http_pb.rb:338
  def initialize(
    selector: nil,
    get: nil,
    put: nil,
    post: nil,
    delete: nil,
    patch: nil,
    custom: nil,
    body: nil,
    response_body: nil,
    additional_bindings: []
  )
    @unknown_fields = nil
    @pattern = nil
    @selector = selector
    @get = get
    @put = put
    unless put.nil?
      raise ArgumentError, " pattern is a oneof, but #{@pattern} and put were both given" if @pattern
      @pattern = :put
    end
    @post = post
    unless post.nil?
      raise ArgumentError, " pattern is a oneof, but #{@pattern} and post were both given" if @pattern
      @pattern = :post
    end
    @delete = delete
    unless delete.nil?
      raise ArgumentError, " pattern is a oneof, but #{@pattern} and delete were both given" if @pattern
      @pattern = :delete
    end
    @patch = patch
    unless patch.nil?
      raise ArgumentError, " pattern is a oneof, but #{@pattern} and patch were both given" if @pattern
      @pattern = :patch
    end
    @custom = custom
    unless custom.nil?
      raise ArgumentError, " pattern is a oneof, but #{@pattern} and custom were both given" if @pattern
      @pattern = :custom
    end
    @body = body
    @response_body = response_body
    @additional_bindings = additional_bindings
  end
  attr_reader :pattern
  def hash
    ["google.api.HttpRule", @unknown_fields, @selector, @get, @put, @post, @delete, @patch, @custom, @body, @response_body, @additional_bindings].hash
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
    # optional(1, :selector, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @selector = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :get, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @get = value
    index += length
      @pattern = :get
  
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    # optional(3, :put, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @put = value
    index += length
      @pattern = :put
  
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x22
    found = true
    # optional(4, :post, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @post = value
    index += length
      @pattern = :post
  
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x2a
    found = true
    # optional(5, :delete, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @delete = value
    index += length
      @pattern = :delete
  
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x32
    found = true
    # optional(6, :patch, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @patch = value
    index += length
      @pattern = :patch
  
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x3a
    found = true
    # optional(7, :body, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @body = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x42
    found = true
    # optional(8, :custom, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @custom = (@custom || Google::Api::CustomHttpPattern.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      @pattern = :custom
  
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x5a
    found = true
    list = @additional_bindings
    while true
      # repeated(11, :additional_bindings, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Google::Api::HttpRule.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x5a
    end
  end
  if header == 0x62
    found = true
    # optional(12, :response_body, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @response_body = value
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
    @pattern = nil
    @selector = nil
    @get = nil
    @put = nil
    @post = nil
    @delete = nil
    @patch = nil
    @custom = nil
    @body = nil
    @response_body = nil
    @additional_bindings = []
    self
  end
  def as_json
    json = {}
    json["selector"] = @selector if has_selector?
    json["get"] = @get if @pattern == :get
    json["put"] = @put if @pattern == :put
    json["post"] = @post if @pattern == :post
    json["delete"] = @delete if @pattern == :delete
    json["patch"] = @patch if @pattern == :patch
    json["custom"] = @custom.as_json if @pattern == :custom
    json["body"] = @body if has_body?
    json["responseBody"] = @response_body if has_response_body?
    json["additionalBindings"] = @additional_bindings.map(&:as_json) unless @additional_bindings.empty?
    json
  end

  # optional(1, :selector, type: :string)
  def selector=(value)
    raise Protobug::InvalidValueError.new(self, "selector", value) unless value.is_a?(String)
    @selector = value
  end
  def selector
    value = @selector
    return value unless value.nil?
    @selector = +""
  end
  def has_selector?
    value = @selector
    return false if value.nil? || value.empty?
    true
  end
  def clear_selector
    @selector = nil
  end
  # optional(2, :get, type: :string)
  def get=(value)
    raise Protobug::InvalidValueError.new(self, "get", value) unless value.is_a?(String)
    @pattern = :get
    @get = value
  end
  def get
    value = @get
    value = nil if @pattern != :get
    return value unless value.nil?
    @pattern = :get
    @get = +""
  end
  def has_get?
    return false unless @pattern == :get
    value = @get
    return false if value.nil?
    true
  end
  def clear_get
    @pattern = nil
    @get = nil
  end
  # optional(3, :put, type: :string)
  def put=(value)
    raise Protobug::InvalidValueError.new(self, "put", value) unless value.is_a?(String)
    @pattern = :put
    @put = value
  end
  def put
    value = @put
    value = nil if @pattern != :put
    return value unless value.nil?
    @pattern = :put
    @put = +""
  end
  def has_put?
    return false unless @pattern == :put
    value = @put
    return false if value.nil?
    true
  end
  def clear_put
    @pattern = nil
    @put = nil
  end
  # optional(4, :post, type: :string)
  def post=(value)
    raise Protobug::InvalidValueError.new(self, "post", value) unless value.is_a?(String)
    @pattern = :post
    @post = value
  end
  def post
    value = @post
    value = nil if @pattern != :post
    return value unless value.nil?
    @pattern = :post
    @post = +""
  end
  def has_post?
    return false unless @pattern == :post
    value = @post
    return false if value.nil?
    true
  end
  def clear_post
    @pattern = nil
    @post = nil
  end
  # optional(5, :delete, type: :string)
  def delete=(value)
    raise Protobug::InvalidValueError.new(self, "delete", value) unless value.is_a?(String)
    @pattern = :delete
    @delete = value
  end
  def delete
    value = @delete
    value = nil if @pattern != :delete
    return value unless value.nil?
    @pattern = :delete
    @delete = +""
  end
  def has_delete?
    return false unless @pattern == :delete
    value = @delete
    return false if value.nil?
    true
  end
  def clear_delete
    @pattern = nil
    @delete = nil
  end
  # optional(6, :patch, type: :string)
  def patch=(value)
    raise Protobug::InvalidValueError.new(self, "patch", value) unless value.is_a?(String)
    @pattern = :patch
    @patch = value
  end
  def patch
    value = @patch
    value = nil if @pattern != :patch
    return value unless value.nil?
    @pattern = :patch
    @patch = +""
  end
  def has_patch?
    return false unless @pattern == :patch
    value = @patch
    return false if value.nil?
    true
  end
  def clear_patch
    @pattern = nil
    @patch = nil
  end
  # optional(8, :custom, type: :message)
  def custom=(value)
    raise Protobug::InvalidValueError.new(self, "custom", value) unless value.is_a?(Google::Api::CustomHttpPattern)
    @pattern = :custom
    @custom = value
  end
  def custom
    value = @custom
    value = nil if @pattern != :custom
    return value unless value.nil?
    @pattern = :custom
    @custom = Google::Api::CustomHttpPattern.allocate.__protobug_initialize_defaults
  end
  def has_custom?
    return false unless @pattern == :custom
    value = @custom
    return false if value.nil?
    true
  end
  def clear_custom
    @pattern = nil
    @custom = nil
  end
  # optional(7, :body, type: :string)
  def body=(value)
    raise Protobug::InvalidValueError.new(self, "body", value) unless value.is_a?(String)
    @body = value
  end
  def body
    value = @body
    return value unless value.nil?
    @body = +""
  end
  def has_body?
    value = @body
    return false if value.nil? || value.empty?
    true
  end
  def clear_body
    @body = nil
  end
  # optional(12, :response_body, type: :string)
  def response_body=(value)
    raise Protobug::InvalidValueError.new(self, "response_body", value) unless value.is_a?(String)
    @response_body = value
  end
  def response_body
    value = @response_body
    return value unless value.nil?
    @response_body = +""
  end
  def has_response_body?
    value = @response_body
    return false if value.nil? || value.empty?
    true
  end
  def clear_response_body
    @response_body = nil
  end
  # repeated(11, :additional_bindings, type: :message)
  attr_reader :additional_bindings
  def has_additional_bindings?
    value = @additional_bindings
  
    !value.empty?
  end
  def clear_additional_bindings
    @additional_bindings.clear
  end
  def add_additional_bindings(value)
    existing = @additional_bindings
    raise Protobug::InvalidValueError.new(self, "additional_bindings", value) unless value.is_a?(Google::Api::HttpRule)
    existing << value
  end
end
class Google::Api::CustomHttpPattern # /lib/google/api/http_pb.rb:426
  def initialize(
    kind: nil,
    path: nil
  )
    @unknown_fields = nil
    @kind = kind
    @path = path
  end
  def hash
    ["google.api.CustomHttpPattern", @unknown_fields, @kind, @path].hash
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
    # optional(1, :kind, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @kind = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :path, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @path = value
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
    @kind = nil
    @path = nil
    self
  end
  def as_json
    json = {}
    json["kind"] = @kind if has_kind?
    json["path"] = @path if has_path?
    json
  end

  # optional(1, :kind, type: :string)
  def kind=(value)
    raise Protobug::InvalidValueError.new(self, "kind", value) unless value.is_a?(String)
    @kind = value
  end
  def kind
    value = @kind
    return value unless value.nil?
    @kind = +""
  end
  def has_kind?
    value = @kind
    return false if value.nil? || value.empty?
    true
  end
  def clear_kind
    @kind = nil
  end
  # optional(2, :path, type: :string)
  def path=(value)
    raise Protobug::InvalidValueError.new(self, "path", value) unless value.is_a?(String)
    @path = value
  end
  def path
    value = @path
    return value unless value.nil?
    @path = +""
  end
  def has_path?
    value = @path
    return false if value.nil? || value.empty?
    true
  end
  def clear_path
    @path = nil
  end
end
