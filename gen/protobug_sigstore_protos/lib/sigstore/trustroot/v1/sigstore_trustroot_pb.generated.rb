class Sigstore::TrustRoot::V1::TransparencyLogInstance # /lib/sigstore/trustroot/v1/sigstore_trustroot_pb.rb:44
  def initialize(
    base_url: nil,
    hash_algorithm: nil,
    public_key: nil,
    log_id: nil,
    checkpoint_key_id: nil
  )
    @unknown_fields = nil
    @base_url = base_url
    @hash_algorithm = hash_algorithm
    @public_key = public_key
    @log_id = log_id
    @checkpoint_key_id = checkpoint_key_id
  end
  def hash
    ["dev.sigstore.trustroot.v1.TransparencyLogInstance", @base_url, @hash_algorithm, @public_key, @log_id, @checkpoint_key_id].hash
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
    # optional(1, :base_url, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @base_url = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x10
    found = true
    # optional(2, :hash_algorithm, type: :enum)
    value = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @hash_algorithm = (if (value & 0x8000_0000) != 0
      -(((value & 0x7FFF_FFFF) ^ 0x7FFF_FFFF) + 1)
    else
      value & 0x7FFF_FFFF
    end)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    # optional(3, :public_key, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @public_key = (@public_key || Sigstore::Common::V1::PublicKey.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x22
    found = true
    # optional(4, :log_id, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @log_id = (@log_id || Sigstore::Common::V1::LogId.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x2a
    found = true
    # optional(5, :checkpoint_key_id, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @checkpoint_key_id = (@checkpoint_key_id || Sigstore::Common::V1::LogId.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @base_url = nil
    @hash_algorithm = nil
    @public_key = nil
    @log_id = nil
    @checkpoint_key_id = nil
    self
  end
  def as_json
    json = {}
    json["baseUrl"] = @base_url if has_base_url?
    json["hashAlgorithm"] = Sigstore::Common::V1::HashAlgorithm.as_json(@hash_algorithm) if has_hash_algorithm?
    json["publicKey"] = @public_key.as_json if has_public_key?
    json["logId"] = @log_id.as_json if has_log_id?
    json["checkpointKeyId"] = @checkpoint_key_id.as_json if has_checkpoint_key_id?
    json
  end

  # optional(1, :base_url, type: :string)
  def base_url=(value)
    raise Protobug::InvalidValueError.new(self, "base_url", value) unless value.is_a?(String)
    @base_url = value
  end
  def base_url
    value = @base_url
    return value unless value.nil?
    @base_url = +""
  end
  def has_base_url?
    value = @base_url
    return false if value.nil? || value.empty?
    true
  end
  def clear_base_url
    @base_url = nil
  end
  # optional(2, :hash_algorithm, type: :enum)
  def hash_algorithm=(value)
    raise Protobug::InvalidValueError.new(self, "hash_algorithm", value) unless value.is_a?(Integer)
    raise Protobug::InvalidValueError.new(self, "hash_algorithm", value, "does not fit into [-2147483648, 2147483647]") unless value <= 2147483647 && value >= -2147483648
    @hash_algorithm = value
  end
  def hash_algorithm
    value = @hash_algorithm
    return value unless value.nil?
    @hash_algorithm = 0
  end
  def has_hash_algorithm?
    value = @hash_algorithm
    return false if value.nil? || 0 == value
    true
  end
  def clear_hash_algorithm
    @hash_algorithm = nil
  end
  def hash_algorithm_case_name
    Sigstore::Common::V1::HashAlgorithm.names.fetch(@hash_algorithm)
  end
  # optional(3, :public_key, type: :message)
  def public_key=(value)
    raise Protobug::InvalidValueError.new(self, "public_key", value) unless value.is_a?(Sigstore::Common::V1::PublicKey)
    @public_key = value
  end
  def public_key
    value = @public_key
    return value unless value.nil?
    @public_key = Sigstore::Common::V1::PublicKey.allocate.__protobug_initialize_defaults
  end
  def has_public_key?
    value = @public_key
    return false if value.nil?
    true
  end
  def clear_public_key
    @public_key = nil
  end
  # optional(4, :log_id, type: :message)
  def log_id=(value)
    raise Protobug::InvalidValueError.new(self, "log_id", value) unless value.is_a?(Sigstore::Common::V1::LogId)
    @log_id = value
  end
  def log_id
    value = @log_id
    return value unless value.nil?
    @log_id = Sigstore::Common::V1::LogId.allocate.__protobug_initialize_defaults
  end
  def has_log_id?
    value = @log_id
    return false if value.nil?
    true
  end
  def clear_log_id
    @log_id = nil
  end
  # optional(5, :checkpoint_key_id, type: :message)
  def checkpoint_key_id=(value)
    raise Protobug::InvalidValueError.new(self, "checkpoint_key_id", value) unless value.is_a?(Sigstore::Common::V1::LogId)
    @checkpoint_key_id = value
  end
  def checkpoint_key_id
    value = @checkpoint_key_id
    return value unless value.nil?
    @checkpoint_key_id = Sigstore::Common::V1::LogId.allocate.__protobug_initialize_defaults
  end
  def has_checkpoint_key_id?
    value = @checkpoint_key_id
    return false if value.nil?
    true
  end
  def clear_checkpoint_key_id
    @checkpoint_key_id = nil
  end
end
class Sigstore::TrustRoot::V1::CertificateAuthority # /lib/sigstore/trustroot/v1/sigstore_trustroot_pb.rb:116
  def initialize(
    subject: nil,
    uri: nil,
    cert_chain: nil,
    valid_for: nil
  )
    @unknown_fields = nil
    @subject = subject
    @uri = uri
    @cert_chain = cert_chain
    @valid_for = valid_for
  end
  def hash
    ["dev.sigstore.trustroot.v1.CertificateAuthority", @subject, @uri, @cert_chain, @valid_for].hash
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
    # optional(1, :subject, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @subject = (@subject || Sigstore::Common::V1::DistinguishedName.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :uri, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @uri = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    # optional(3, :cert_chain, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @cert_chain = (@cert_chain || Sigstore::Common::V1::X509CertificateChain.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x22
    found = true
    # optional(4, :valid_for, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @valid_for = (@valid_for || Sigstore::Common::V1::TimeRange.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @subject = nil
    @uri = nil
    @cert_chain = nil
    @valid_for = nil
    self
  end
  def as_json
    json = {}
    json["subject"] = @subject.as_json if has_subject?
    json["uri"] = @uri if has_uri?
    json["certChain"] = @cert_chain.as_json if has_cert_chain?
    json["validFor"] = @valid_for.as_json if has_valid_for?
    json
  end

  # optional(1, :subject, type: :message)
  def subject=(value)
    raise Protobug::InvalidValueError.new(self, "subject", value) unless value.is_a?(Sigstore::Common::V1::DistinguishedName)
    @subject = value
  end
  def subject
    value = @subject
    return value unless value.nil?
    @subject = Sigstore::Common::V1::DistinguishedName.allocate.__protobug_initialize_defaults
  end
  def has_subject?
    value = @subject
    return false if value.nil?
    true
  end
  def clear_subject
    @subject = nil
  end
  # optional(2, :uri, type: :string)
  def uri=(value)
    raise Protobug::InvalidValueError.new(self, "uri", value) unless value.is_a?(String)
    @uri = value
  end
  def uri
    value = @uri
    return value unless value.nil?
    @uri = +""
  end
  def has_uri?
    value = @uri
    return false if value.nil? || value.empty?
    true
  end
  def clear_uri
    @uri = nil
  end
  # optional(3, :cert_chain, type: :message)
  def cert_chain=(value)
    raise Protobug::InvalidValueError.new(self, "cert_chain", value) unless value.is_a?(Sigstore::Common::V1::X509CertificateChain)
    @cert_chain = value
  end
  def cert_chain
    value = @cert_chain
    return value unless value.nil?
    @cert_chain = Sigstore::Common::V1::X509CertificateChain.allocate.__protobug_initialize_defaults
  end
  def has_cert_chain?
    value = @cert_chain
    return false if value.nil?
    true
  end
  def clear_cert_chain
    @cert_chain = nil
  end
  # optional(4, :valid_for, type: :message)
  def valid_for=(value)
    raise Protobug::InvalidValueError.new(self, "valid_for", value) unless value.is_a?(Sigstore::Common::V1::TimeRange)
    @valid_for = value
  end
  def valid_for
    value = @valid_for
    return value unless value.nil?
    @valid_for = Sigstore::Common::V1::TimeRange.allocate.__protobug_initialize_defaults
  end
  def has_valid_for?
    value = @valid_for
    return false if value.nil?
    true
  end
  def clear_valid_for
    @valid_for = nil
  end
end
class Sigstore::TrustRoot::V1::TrustedRoot # /lib/sigstore/trustroot/v1/sigstore_trustroot_pb.rb:195
  def initialize(
    media_type: nil,
    tlogs: [],
    certificate_authorities: [],
    ctlogs: [],
    timestamp_authorities: []
  )
    @unknown_fields = nil
    @media_type = media_type
    @tlogs = tlogs
    @certificate_authorities = certificate_authorities
    @ctlogs = ctlogs
    @timestamp_authorities = timestamp_authorities
  end
  def hash
    ["dev.sigstore.trustroot.v1.TrustedRoot", @media_type, @tlogs, @certificate_authorities, @ctlogs, @timestamp_authorities].hash
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
    # optional(1, :media_type, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @media_type = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    list = @tlogs
    while true
      # repeated(2, :tlogs, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Sigstore::TrustRoot::V1::TransparencyLogInstance.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x12
    end
  end
  if header == 0x1a
    found = true
    list = @certificate_authorities
    while true
      # repeated(3, :certificate_authorities, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Sigstore::TrustRoot::V1::CertificateAuthority.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x1a
    end
  end
  if header == 0x22
    found = true
    list = @ctlogs
    while true
      # repeated(4, :ctlogs, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Sigstore::TrustRoot::V1::TransparencyLogInstance.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x22
    end
  end
  if header == 0x2a
    found = true
    list = @timestamp_authorities
    while true
      # repeated(5, :timestamp_authorities, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (Sigstore::TrustRoot::V1::CertificateAuthority.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x2a
    end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @media_type = nil
    @tlogs = []
    @certificate_authorities = []
    @ctlogs = []
    @timestamp_authorities = []
    self
  end
  def as_json
    json = {}
    json["mediaType"] = @media_type if has_media_type?
    json["tlogs"] = @tlogs.map(&:as_json) unless @tlogs.empty?
    json["certificateAuthorities"] = @certificate_authorities.map(&:as_json) unless @certificate_authorities.empty?
    json["ctlogs"] = @ctlogs.map(&:as_json) unless @ctlogs.empty?
    json["timestampAuthorities"] = @timestamp_authorities.map(&:as_json) unless @timestamp_authorities.empty?
    json
  end

  # optional(1, :media_type, type: :string)
  def media_type=(value)
    raise Protobug::InvalidValueError.new(self, "media_type", value) unless value.is_a?(String)
    @media_type = value
  end
  def media_type
    value = @media_type
    return value unless value.nil?
    @media_type = +""
  end
  def has_media_type?
    value = @media_type
    return false if value.nil? || value.empty?
    true
  end
  def clear_media_type
    @media_type = nil
  end
  # repeated(2, :tlogs, type: :message)
  attr_reader :tlogs
  def has_tlogs?
    value = @tlogs
  
    !value.empty?
  end
  def clear_tlogs
    @tlogs.clear
  end
  def add_tlogs(value)
    existing = @tlogs
    raise Protobug::InvalidValueError.new(self, "tlogs", value) unless value.is_a?(Sigstore::TrustRoot::V1::TransparencyLogInstance)
    existing << value
  end
  # repeated(3, :certificate_authorities, type: :message)
  attr_reader :certificate_authorities
  def has_certificate_authorities?
    value = @certificate_authorities
  
    !value.empty?
  end
  def clear_certificate_authorities
    @certificate_authorities.clear
  end
  def add_certificate_authorities(value)
    existing = @certificate_authorities
    raise Protobug::InvalidValueError.new(self, "certificate_authorities", value) unless value.is_a?(Sigstore::TrustRoot::V1::CertificateAuthority)
    existing << value
  end
  # repeated(4, :ctlogs, type: :message)
  attr_reader :ctlogs
  def has_ctlogs?
    value = @ctlogs
  
    !value.empty?
  end
  def clear_ctlogs
    @ctlogs.clear
  end
  def add_ctlogs(value)
    existing = @ctlogs
    raise Protobug::InvalidValueError.new(self, "ctlogs", value) unless value.is_a?(Sigstore::TrustRoot::V1::TransparencyLogInstance)
    existing << value
  end
  # repeated(5, :timestamp_authorities, type: :message)
  attr_reader :timestamp_authorities
  def has_timestamp_authorities?
    value = @timestamp_authorities
  
    !value.empty?
  end
  def clear_timestamp_authorities
    @timestamp_authorities.clear
  end
  def add_timestamp_authorities(value)
    existing = @timestamp_authorities
    raise Protobug::InvalidValueError.new(self, "timestamp_authorities", value) unless value.is_a?(Sigstore::TrustRoot::V1::CertificateAuthority)
    existing << value
  end
end
class Sigstore::TrustRoot::V1::SigningConfig # /lib/sigstore/trustroot/v1/sigstore_trustroot_pb.rb:254
  def initialize(
    media_type: nil,
    ca_url: nil,
    oidc_url: nil,
    tlog_urls: [],
    tsa_urls: []
  )
    @unknown_fields = nil
    @media_type = media_type
    @ca_url = ca_url
    @oidc_url = oidc_url
    @tlog_urls = tlog_urls
    @tsa_urls = tsa_urls
  end
  def hash
    ["dev.sigstore.trustroot.v1.SigningConfig", @media_type, @ca_url, @oidc_url, @tlog_urls, @tsa_urls].hash
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
    # optional(1, :ca_url, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @ca_url = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :oidc_url, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @oidc_url = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    list = @tlog_urls
    while true
      # repeated(3, :tlog_urls, type: :string)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
      raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
      list << value
      index += length
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x1a
    end
  end
  if header == 0x22
    found = true
    list = @tsa_urls
    while true
      # repeated(4, :tsa_urls, type: :string)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
      raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
      list << value
      index += length
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x22
    end
  end
  if header == 0x2a
    found = true
    # optional(5, :media_type, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @media_type = value
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
    @media_type = nil
    @ca_url = nil
    @oidc_url = nil
    @tlog_urls = []
    @tsa_urls = []
    self
  end
  def as_json
    json = {}
    json["mediaType"] = @media_type if has_media_type?
    json["caUrl"] = @ca_url if has_ca_url?
    json["oidcUrl"] = @oidc_url if has_oidc_url?
    json["tlogUrls"] = @tlog_urls unless @tlog_urls.empty?
    json["tsaUrls"] = @tsa_urls unless @tsa_urls.empty?
    json
  end

  # optional(5, :media_type, type: :string)
  def media_type=(value)
    raise Protobug::InvalidValueError.new(self, "media_type", value) unless value.is_a?(String)
    @media_type = value
  end
  def media_type
    value = @media_type
    return value unless value.nil?
    @media_type = +""
  end
  def has_media_type?
    value = @media_type
    return false if value.nil? || value.empty?
    true
  end
  def clear_media_type
    @media_type = nil
  end
  # optional(1, :ca_url, type: :string)
  def ca_url=(value)
    raise Protobug::InvalidValueError.new(self, "ca_url", value) unless value.is_a?(String)
    @ca_url = value
  end
  def ca_url
    value = @ca_url
    return value unless value.nil?
    @ca_url = +""
  end
  def has_ca_url?
    value = @ca_url
    return false if value.nil? || value.empty?
    true
  end
  def clear_ca_url
    @ca_url = nil
  end
  # optional(2, :oidc_url, type: :string)
  def oidc_url=(value)
    raise Protobug::InvalidValueError.new(self, "oidc_url", value) unless value.is_a?(String)
    @oidc_url = value
  end
  def oidc_url
    value = @oidc_url
    return value unless value.nil?
    @oidc_url = +""
  end
  def has_oidc_url?
    value = @oidc_url
    return false if value.nil? || value.empty?
    true
  end
  def clear_oidc_url
    @oidc_url = nil
  end
  # repeated(3, :tlog_urls, type: :string)
  attr_reader :tlog_urls
  def has_tlog_urls?
    value = @tlog_urls
  
    !value.empty?
  end
  def clear_tlog_urls
    @tlog_urls.clear
  end
  def add_tlog_urls(value)
    existing = @tlog_urls
    raise Protobug::InvalidValueError.new(self, "tlog_urls", value) unless value.is_a?(String)
    existing << value
  end
  # repeated(4, :tsa_urls, type: :string)
  attr_reader :tsa_urls
  def has_tsa_urls?
    value = @tsa_urls
  
    !value.empty?
  end
  def clear_tsa_urls
    @tsa_urls.clear
  end
  def add_tsa_urls(value)
    existing = @tsa_urls
    raise Protobug::InvalidValueError.new(self, "tsa_urls", value) unless value.is_a?(String)
    existing << value
  end
end
class Sigstore::TrustRoot::V1::ClientTrustConfig # /lib/sigstore/trustroot/v1/sigstore_trustroot_pb.rb:310
  def initialize(
    media_type: nil,
    trusted_root: nil,
    signing_config: nil
  )
    @unknown_fields = nil
    @media_type = media_type
    @trusted_root = trusted_root
    @signing_config = signing_config
  end
  def hash
    ["dev.sigstore.trustroot.v1.ClientTrustConfig", @media_type, @trusted_root, @signing_config].hash
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
    # optional(1, :media_type, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @media_type = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :trusted_root, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @trusted_root = (@trusted_root || Sigstore::TrustRoot::V1::TrustedRoot.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    # optional(3, :signing_config, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @signing_config = (@signing_config || Sigstore::TrustRoot::V1::SigningConfig.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @media_type = nil
    @trusted_root = nil
    @signing_config = nil
    self
  end
  def as_json
    json = {}
    json["mediaType"] = @media_type if has_media_type?
    json["trustedRoot"] = @trusted_root.as_json if has_trusted_root?
    json["signingConfig"] = @signing_config.as_json if has_signing_config?
    json
  end

  # optional(1, :media_type, type: :string)
  def media_type=(value)
    raise Protobug::InvalidValueError.new(self, "media_type", value) unless value.is_a?(String)
    @media_type = value
  end
  def media_type
    value = @media_type
    return value unless value.nil?
    @media_type = +""
  end
  def has_media_type?
    value = @media_type
    return false if value.nil? || value.empty?
    true
  end
  def clear_media_type
    @media_type = nil
  end
  # optional(2, :trusted_root, type: :message)
  def trusted_root=(value)
    raise Protobug::InvalidValueError.new(self, "trusted_root", value) unless value.is_a?(Sigstore::TrustRoot::V1::TrustedRoot)
    @trusted_root = value
  end
  def trusted_root
    value = @trusted_root
    return value unless value.nil?
    @trusted_root = Sigstore::TrustRoot::V1::TrustedRoot.allocate.__protobug_initialize_defaults
  end
  def has_trusted_root?
    value = @trusted_root
    return false if value.nil?
    true
  end
  def clear_trusted_root
    @trusted_root = nil
  end
  # optional(3, :signing_config, type: :message)
  def signing_config=(value)
    raise Protobug::InvalidValueError.new(self, "signing_config", value) unless value.is_a?(Sigstore::TrustRoot::V1::SigningConfig)
    @signing_config = value
  end
  def signing_config
    value = @signing_config
    return value unless value.nil?
    @signing_config = Sigstore::TrustRoot::V1::SigningConfig.allocate.__protobug_initialize_defaults
  end
  def has_signing_config?
    value = @signing_config
    return false if value.nil?
    true
  end
  def clear_signing_config
    @signing_config = nil
  end
end
