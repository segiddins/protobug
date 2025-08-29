class InTotoAttestation::Predicates::Provenance::V1::Provenance # /lib/in_toto_attestation/predicates/provenance/v1/provenance_pb.rb:25
  def initialize(
    build_definition: nil,
    run_details: nil
  )
    @unknown_fields = nil
    @build_definition = build_definition
    @run_details = run_details
  end
  def hash
    ["in_toto_attestation.predicates.provenance.v1.Provenance", @unknown_fields, @build_definition, @run_details].hash
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
    # optional(1, :build_definition, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @build_definition = (@build_definition || InTotoAttestation::Predicates::Provenance::V1::BuildDefinition.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :run_details, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @run_details = (@run_details || InTotoAttestation::Predicates::Provenance::V1::RunDetails.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @build_definition = nil
    @run_details = nil
    self
  end
  def as_json
    json = {}
    json["buildDefinition"] = @build_definition.as_json if has_build_definition?
    json["runDetails"] = @run_details.as_json if has_run_details?
    json
  end

  # optional(1, :build_definition, type: :message)
  def build_definition=(value)
    raise Protobug::InvalidValueError.new(self, "build_definition", value) unless value.is_a?(InTotoAttestation::Predicates::Provenance::V1::BuildDefinition)
    @build_definition = value
  end
  def build_definition
    value = @build_definition
    return value unless value.nil?
    @build_definition = InTotoAttestation::Predicates::Provenance::V1::BuildDefinition.allocate.__protobug_initialize_defaults
  end
  def has_build_definition?
    value = @build_definition
    return false if value.nil?
    true
  end
  def clear_build_definition
    @build_definition = nil
  end
  # optional(2, :run_details, type: :message)
  def run_details=(value)
    raise Protobug::InvalidValueError.new(self, "run_details", value) unless value.is_a?(InTotoAttestation::Predicates::Provenance::V1::RunDetails)
    @run_details = value
  end
  def run_details
    value = @run_details
    return value unless value.nil?
    @run_details = InTotoAttestation::Predicates::Provenance::V1::RunDetails.allocate.__protobug_initialize_defaults
  end
  def has_run_details?
    value = @run_details
    return false if value.nil?
    true
  end
  def clear_run_details
    @run_details = nil
  end
end
class InTotoAttestation::Predicates::Provenance::V1::BuildDefinition # /lib/in_toto_attestation/predicates/provenance/v1/provenance_pb.rb:50
  def initialize(
    build_type: nil,
    external_parameters: nil,
    internal_parameters: nil,
    resolved_dependencies: []
  )
    @unknown_fields = nil
    @build_type = build_type
    @external_parameters = external_parameters
    @internal_parameters = internal_parameters
    @resolved_dependencies = resolved_dependencies
  end
  def hash
    ["in_toto_attestation.predicates.provenance.v1.BuildDefinition", @unknown_fields, @build_type, @external_parameters, @internal_parameters, @resolved_dependencies].hash
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
    # optional(1, :build_type, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @build_type = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :external_parameters, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @external_parameters = (@external_parameters || Google::Protobuf::Struct.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    # optional(3, :internal_parameters, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @internal_parameters = (@internal_parameters || Google::Protobuf::Struct.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x22
    found = true
    list = @resolved_dependencies
    while true
      # repeated(4, :resolved_dependencies, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (InTotoAttestation::V1::ResourceDescriptor.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x22
    end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @build_type = nil
    @external_parameters = nil
    @internal_parameters = nil
    @resolved_dependencies = []
    self
  end
  def as_json
    json = {}
    json["buildType"] = @build_type if has_build_type?
    json["externalParameters"] = @external_parameters.as_json if has_external_parameters?
    json["internalParameters"] = @internal_parameters.as_json if has_internal_parameters?
    json["resolvedDependencies"] = @resolved_dependencies.map(&:as_json) unless @resolved_dependencies.empty?
    json
  end

  # optional(1, :build_type, type: :string)
  def build_type=(value)
    raise Protobug::InvalidValueError.new(self, "build_type", value) unless value.is_a?(String)
    @build_type = value
  end
  def build_type
    value = @build_type
    return value unless value.nil?
    @build_type = +""
  end
  def has_build_type?
    value = @build_type
    return false if value.nil? || value.empty?
    true
  end
  def clear_build_type
    @build_type = nil
  end
  # optional(2, :external_parameters, type: :message)
  def external_parameters=(value)
    raise Protobug::InvalidValueError.new(self, "external_parameters", value) unless value.is_a?(Google::Protobuf::Struct)
    @external_parameters = value
  end
  def external_parameters
    value = @external_parameters
    return value unless value.nil?
    @external_parameters = Google::Protobuf::Struct.allocate.__protobug_initialize_defaults
  end
  def has_external_parameters?
    value = @external_parameters
    return false if value.nil?
    true
  end
  def clear_external_parameters
    @external_parameters = nil
  end
  # optional(3, :internal_parameters, type: :message)
  def internal_parameters=(value)
    raise Protobug::InvalidValueError.new(self, "internal_parameters", value) unless value.is_a?(Google::Protobuf::Struct)
    @internal_parameters = value
  end
  def internal_parameters
    value = @internal_parameters
    return value unless value.nil?
    @internal_parameters = Google::Protobuf::Struct.allocate.__protobug_initialize_defaults
  end
  def has_internal_parameters?
    value = @internal_parameters
    return false if value.nil?
    true
  end
  def clear_internal_parameters
    @internal_parameters = nil
  end
  # repeated(4, :resolved_dependencies, type: :message)
  attr_reader :resolved_dependencies
  def has_resolved_dependencies?
    value = @resolved_dependencies
  
    !value.empty?
  end
  def clear_resolved_dependencies
    @resolved_dependencies.clear
  end
  def add_resolved_dependencies(value)
    existing = @resolved_dependencies
    raise Protobug::InvalidValueError.new(self, "resolved_dependencies", value) unless value.is_a?(InTotoAttestation::V1::ResourceDescriptor)
    existing << value
  end
end
class InTotoAttestation::Predicates::Provenance::V1::RunDetails # /lib/in_toto_attestation/predicates/provenance/v1/provenance_pb.rb:87
  def initialize(
    builder: nil,
    metadata: nil,
    byproducts: []
  )
    @unknown_fields = nil
    @builder = builder
    @metadata = metadata
    @byproducts = byproducts
  end
  def hash
    ["in_toto_attestation.predicates.provenance.v1.RunDetails", @unknown_fields, @builder, @metadata, @byproducts].hash
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
    # optional(1, :builder, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @builder = (@builder || InTotoAttestation::Predicates::Provenance::V1::Builder.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :metadata, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @metadata = (@metadata || InTotoAttestation::Predicates::Provenance::V1::BuildMetadata.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    list = @byproducts
    while true
      # repeated(3, :byproducts, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (InTotoAttestation::V1::ResourceDescriptor.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x1a
    end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @builder = nil
    @metadata = nil
    @byproducts = []
    self
  end
  def as_json
    json = {}
    json["builder"] = @builder.as_json if has_builder?
    json["metadata"] = @metadata.as_json if has_metadata?
    json["byproducts"] = @byproducts.map(&:as_json) unless @byproducts.empty?
    json
  end

  # optional(1, :builder, type: :message)
  def builder=(value)
    raise Protobug::InvalidValueError.new(self, "builder", value) unless value.is_a?(InTotoAttestation::Predicates::Provenance::V1::Builder)
    @builder = value
  end
  def builder
    value = @builder
    return value unless value.nil?
    @builder = InTotoAttestation::Predicates::Provenance::V1::Builder.allocate.__protobug_initialize_defaults
  end
  def has_builder?
    value = @builder
    return false if value.nil?
    true
  end
  def clear_builder
    @builder = nil
  end
  # optional(2, :metadata, type: :message)
  def metadata=(value)
    raise Protobug::InvalidValueError.new(self, "metadata", value) unless value.is_a?(InTotoAttestation::Predicates::Provenance::V1::BuildMetadata)
    @metadata = value
  end
  def metadata
    value = @metadata
    return value unless value.nil?
    @metadata = InTotoAttestation::Predicates::Provenance::V1::BuildMetadata.allocate.__protobug_initialize_defaults
  end
  def has_metadata?
    value = @metadata
    return false if value.nil?
    true
  end
  def clear_metadata
    @metadata = nil
  end
  # repeated(3, :byproducts, type: :message)
  attr_reader :byproducts
  def has_byproducts?
    value = @byproducts
  
    !value.empty?
  end
  def clear_byproducts
    @byproducts.clear
  end
  def add_byproducts(value)
    existing = @byproducts
    raise Protobug::InvalidValueError.new(self, "byproducts", value) unless value.is_a?(InTotoAttestation::V1::ResourceDescriptor)
    existing << value
  end
end
class InTotoAttestation::Predicates::Provenance::V1::Builder # /lib/in_toto_attestation/predicates/provenance/v1/provenance_pb.rb:116
  def initialize(
    id: nil,
    version: {},
    builder_dependencies: []
  )
    @unknown_fields = nil
    @id = id
    @version = version
    @builder_dependencies = builder_dependencies
  end
  def hash
    ["in_toto_attestation.predicates.provenance.v1.Builder", @unknown_fields, @id, @version, @builder_dependencies].hash
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
    # optional(1, :id, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @id = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    list = @version
    while true
      # map(2, :version, type: :map)
      kv_length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      kv_max = index + kv_length
      kv_key = ""
      kv_value = ""
      while index < kv_max
        kv_header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
        case kv_header
        when 10
          length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
      raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
      kv_key = value
      index += length
        when 18
          length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
      raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
      kv_value = value
      index += length
        else
          raise "unknown map field #{kv_header} #{kv_length}"
        end
      end
      raise EOFError unless index == kv_max
      list[kv_key] = kv_value || +""
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x12
    end
  end
  if header == 0x1a
    found = true
    list = @builder_dependencies
    while true
      # repeated(3, :builder_dependencies, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (InTotoAttestation::V1::ResourceDescriptor.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x1a
    end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @id = nil
    @version = {}
    @builder_dependencies = []
    self
  end
  def as_json
    json = {}
    json["id"] = @id if has_id?
    json["version"] = @version.transform_values { _1} unless @version.empty?
    json["builderDependencies"] = @builder_dependencies.map(&:as_json) unless @builder_dependencies.empty?
    json
  end

  # optional(1, :id, type: :string)
  def id=(value)
    raise Protobug::InvalidValueError.new(self, "id", value) unless value.is_a?(String)
    @id = value
  end
  def id
    value = @id
    return value unless value.nil?
    @id = +""
  end
  def has_id?
    value = @id
    return false if value.nil? || value.empty?
    true
  end
  def clear_id
    @id = nil
  end
  # map(2, :version, type: :map)
  attr_reader :version
  def has_version?
    value = @version
  
    !value.empty?
  end
  def clear_version
    @version.clear
  end
  # repeated(3, :builder_dependencies, type: :message)
  attr_reader :builder_dependencies
  def has_builder_dependencies?
    value = @builder_dependencies
  
    !value.empty?
  end
  def clear_builder_dependencies
    @builder_dependencies.clear
  end
  def add_builder_dependencies(value)
    existing = @builder_dependencies
    raise Protobug::InvalidValueError.new(self, "builder_dependencies", value) unless value.is_a?(InTotoAttestation::V1::ResourceDescriptor)
    existing << value
  end
end
class InTotoAttestation::Predicates::Provenance::V1::BuildMetadata # /lib/in_toto_attestation/predicates/provenance/v1/provenance_pb.rb:132
  def initialize(
    invocation_id: nil,
    started_on: nil,
    finished_on: nil
  )
    @unknown_fields = nil
    @invocation_id = invocation_id
    @started_on = started_on
    @finished_on = finished_on
  end
  def hash
    ["in_toto_attestation.predicates.provenance.v1.BuildMetadata", @unknown_fields, @invocation_id, @started_on, @finished_on].hash
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
    # optional(1, :invocation_id, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @invocation_id = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :started_on, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @started_on = (@started_on || Google::Protobuf::Timestamp.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    # optional(3, :finished_on, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @finished_on = (@finished_on || Google::Protobuf::Timestamp.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @invocation_id = nil
    @started_on = nil
    @finished_on = nil
    self
  end
  def as_json
    json = {}
    json["invocationId"] = @invocation_id if has_invocation_id?
    json["startedOn"] = @started_on.as_json if has_started_on?
    json["finishedOn"] = @finished_on.as_json if has_finished_on?
    json
  end

  # optional(1, :invocation_id, type: :string)
  def invocation_id=(value)
    raise Protobug::InvalidValueError.new(self, "invocation_id", value) unless value.is_a?(String)
    @invocation_id = value
  end
  def invocation_id
    value = @invocation_id
    return value unless value.nil?
    @invocation_id = +""
  end
  def has_invocation_id?
    value = @invocation_id
    return false if value.nil? || value.empty?
    true
  end
  def clear_invocation_id
    @invocation_id = nil
  end
  # optional(2, :started_on, type: :message)
  def started_on=(value)
    raise Protobug::InvalidValueError.new(self, "started_on", value) unless value.is_a?(Google::Protobuf::Timestamp)
    @started_on = value
  end
  def started_on
    value = @started_on
    return value unless value.nil?
    @started_on = Google::Protobuf::Timestamp.allocate.__protobug_initialize_defaults
  end
  def has_started_on?
    value = @started_on
    return false if value.nil?
    true
  end
  def clear_started_on
    @started_on = nil
  end
  # optional(3, :finished_on, type: :message)
  def finished_on=(value)
    raise Protobug::InvalidValueError.new(self, "finished_on", value) unless value.is_a?(Google::Protobuf::Timestamp)
    @finished_on = value
  end
  def finished_on
    value = @finished_on
    return value unless value.nil?
    @finished_on = Google::Protobuf::Timestamp.allocate.__protobug_initialize_defaults
  end
  def has_finished_on?
    value = @finished_on
    return false if value.nil?
    true
  end
  def clear_finished_on
    @finished_on = nil
  end
end
