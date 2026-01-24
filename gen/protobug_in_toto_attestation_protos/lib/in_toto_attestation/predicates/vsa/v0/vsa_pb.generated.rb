class InTotoAttestation::Predicates::Vsa::V0::VerificationSummary # /lib/in_toto_attestation/predicates/vsa/v0/vsa_pb.rb:22
  def initialize(
    verifier: nil,
    time_verified: nil,
    resource_uri: nil,
    policy: nil,
    input_attestations: [],
    verification_result: nil,
    policy_level: nil,
    dependency_levels: {}
  )
    @unknown_fields = nil
    @verifier = verifier
    @time_verified = time_verified
    @resource_uri = resource_uri
    @policy = policy
    @input_attestations = input_attestations
    @verification_result = verification_result
    @policy_level = policy_level
    @dependency_levels = dependency_levels
  end
  def hash
    ["in_toto_attestation.predicates.vsa.v0.VerificationSummary", @unknown_fields, @verifier, @time_verified, @resource_uri, @policy, @input_attestations, @verification_result, @policy_level, @dependency_levels].hash
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
    # optional(1, :verifier, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @verifier = (@verifier || InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Verifier.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    # optional(2, :time_verified, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @time_verified = (@time_verified || Google::Protobuf::Timestamp.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x1a
    found = true
    # optional(3, :resource_uri, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @resource_uri = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x22
    found = true
    # optional(4, :policy, type: :message)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    @policy = (@policy || InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Policy.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x2a
    found = true
    list = @input_attestations
    while true
      # repeated(5, :input_attestations, type: :message)
      length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      list << (InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::InputAttestation.allocate.__protobug_initialize_defaults).__protobug_binary_decode(binary, index, index += length)
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x2a
    end
  end
  if header == 0x32
    found = true
    # optional(6, :verification_result, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @verification_result = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x3a
    found = true
    # optional(7, :policy_level, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @policy_level = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x42
    found = true
    list = @dependency_levels
    while true
      # map(8, :dependency_levels, type: :map)
      kv_length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      kv_max = index + kv_length
      kv_key = ""
      kv_value = 0
      while index < kv_max
        kv_header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
        case kv_header
        when 10
          length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
      raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
      kv_key = value
      index += length
        when 16
          kv_value = (if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end)
      
        else
          raise "unknown map field #{kv_header} #{kv_length}"
        end
      end
      raise EOFError unless index == kv_max
      list[kv_key] = kv_value || 0
      return self if index == max
      header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
      break unless header == 0x42
    end
  end
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @verifier = nil
    @time_verified = nil
    @resource_uri = nil
    @policy = nil
    @input_attestations = []
    @verification_result = nil
    @policy_level = nil
    @dependency_levels = {}
    self
  end
  def as_json
    json = {}
    json["verifier"] = @verifier.as_json if has_verifier?
    json["time_verified"] = @time_verified.as_json if has_time_verified?
    json["resource_uri"] = @resource_uri if has_resource_uri?
    json["policy"] = @policy.as_json if has_policy?
    json["input_attestations"] = @input_attestations.map(&:as_json) unless @input_attestations.empty?
    json["verification_result"] = @verification_result if has_verification_result?
    json["policy_level"] = @policy_level if has_policy_level?
    json["dependency_levels"] = @dependency_levels.transform_values { _1.to_s} unless @dependency_levels.empty?
    json
  end

  # optional(1, :verifier, type: :message)
  def verifier=(value)
    raise Protobug::InvalidValueError.new(self, "verifier", value) unless value.is_a?(InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Verifier)
    @verifier = value
  end
  def verifier
    value = @verifier
    return value unless value.nil?
    @verifier = InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Verifier.allocate.__protobug_initialize_defaults
  end
  def has_verifier?
    value = @verifier
    return false if value.nil?
    true
  end
  def clear_verifier
    @verifier = nil
  end
  # optional(2, :time_verified, type: :message)
  def time_verified=(value)
    raise Protobug::InvalidValueError.new(self, "time_verified", value) unless value.is_a?(Google::Protobuf::Timestamp)
    @time_verified = value
  end
  def time_verified
    value = @time_verified
    return value unless value.nil?
    @time_verified = Google::Protobuf::Timestamp.allocate.__protobug_initialize_defaults
  end
  def has_time_verified?
    value = @time_verified
    return false if value.nil?
    true
  end
  def clear_time_verified
    @time_verified = nil
  end
  # optional(3, :resource_uri, type: :string)
  def resource_uri=(value)
    raise Protobug::InvalidValueError.new(self, "resource_uri", value) unless value.is_a?(String)
    @resource_uri = value
  end
  def resource_uri
    value = @resource_uri
    return value unless value.nil?
    @resource_uri = +""
  end
  def has_resource_uri?
    value = @resource_uri
    return false if value.nil? || value.empty?
    true
  end
  def clear_resource_uri
    @resource_uri = nil
  end
  # optional(4, :policy, type: :message)
  def policy=(value)
    raise Protobug::InvalidValueError.new(self, "policy", value) unless value.is_a?(InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Policy)
    @policy = value
  end
  def policy
    value = @policy
    return value unless value.nil?
    @policy = InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Policy.allocate.__protobug_initialize_defaults
  end
  def has_policy?
    value = @policy
    return false if value.nil?
    true
  end
  def clear_policy
    @policy = nil
  end
  # repeated(5, :input_attestations, type: :message)
  attr_reader :input_attestations
  def has_input_attestations?
    value = @input_attestations
  
    !value.empty?
  end
  def clear_input_attestations
    @input_attestations.clear
  end
  def add_input_attestations(value)
    existing = @input_attestations
    raise Protobug::InvalidValueError.new(self, "input_attestations", value) unless value.is_a?(InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::InputAttestation)
    existing << value
  end
  # optional(6, :verification_result, type: :string)
  def verification_result=(value)
    raise Protobug::InvalidValueError.new(self, "verification_result", value) unless value.is_a?(String)
    @verification_result = value
  end
  def verification_result
    value = @verification_result
    return value unless value.nil?
    @verification_result = +""
  end
  def has_verification_result?
    value = @verification_result
    return false if value.nil? || value.empty?
    true
  end
  def clear_verification_result
    @verification_result = nil
  end
  # optional(7, :policy_level, type: :string)
  def policy_level=(value)
    raise Protobug::InvalidValueError.new(self, "policy_level", value) unless value.is_a?(String)
    @policy_level = value
  end
  def policy_level
    value = @policy_level
    return value unless value.nil?
    @policy_level = +""
  end
  def has_policy_level?
    value = @policy_level
    return false if value.nil? || value.empty?
    true
  end
  def clear_policy_level
    @policy_level = nil
  end
  # map(8, :dependency_levels, type: :map)
  attr_reader :dependency_levels
  def has_dependency_levels?
    value = @dependency_levels
  
    !value.empty?
  end
  def clear_dependency_levels
    @dependency_levels.clear
  end
end
class InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Verifier # /lib/in_toto_attestation/predicates/vsa/v0/vsa_pb.rb:27
  def initialize(
    id: nil
  )
    @unknown_fields = nil
    @id = id
  end
  def hash
    ["in_toto_attestation.predicates.vsa.v0.VerificationSummary.Verifier", @unknown_fields, @id].hash
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
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @id = nil
    self
  end
  def as_json
    json = {}
    json["id"] = @id if has_id?
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
end
class InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::Policy # /lib/in_toto_attestation/predicates/vsa/v0/vsa_pb.rb:51
  def initialize(
    uri: nil,
    digest: {}
  )
    @unknown_fields = nil
    @uri = uri
    @digest = digest
  end
  def hash
    ["in_toto_attestation.predicates.vsa.v0.VerificationSummary.Policy", @unknown_fields, @uri, @digest].hash
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
    # optional(1, :uri, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @uri = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    list = @digest
    while true
      # map(2, :digest, type: :map)
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
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @uri = nil
    @digest = {}
    self
  end
  def as_json
    json = {}
    json["uri"] = @uri if has_uri?
    json["digest"] = @digest.transform_values { _1} unless @digest.empty?
    json
  end

  # optional(1, :uri, type: :string)
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
  # map(2, :digest, type: :map)
  attr_reader :digest
  def has_digest?
    value = @digest
  
    !value.empty?
  end
  def clear_digest
    @digest.clear
  end
end
class InTotoAttestation::Predicates::Vsa::V0::VerificationSummary::InputAttestation # /lib/in_toto_attestation/predicates/vsa/v0/vsa_pb.rb:68
  def initialize(
    uri: nil,
    digest: {}
  )
    @unknown_fields = nil
    @uri = uri
    @digest = digest
  end
  def hash
    ["in_toto_attestation.predicates.vsa.v0.VerificationSummary.InputAttestation", @unknown_fields, @uri, @digest].hash
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
    # optional(1, :uri, type: :string)
    length = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
    value = binary.byteslice(index, length).force_encoding(Encoding::UTF_8)
    raise Protobug::DecodeError, "invalid UTF-8 in string #{value.inspect}" unless value.valid_encoding?
    @uri = value
    index += length
    return self if index == max
    header = if (byte0 = binary.getbyte(index)) < 0x80 then index += 1; byte0 elsif (byte1 = binary.getbyte(index + 1)) < 0x80 then index += 2; (byte1 << 7) | (byte0 & 0x7F) elsif (byte2 = binary.getbyte(index + 2)) < 0x80 then index += 3; (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte3 = binary.getbyte(index + 3)) < 0x80 then index += 4; (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte4 = binary.getbyte(index + 4)) < 0x80 then index += 5; (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte5 = binary.getbyte(index + 5)) < 0x80 then index += 6; (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte6 = binary.getbyte(index + 6)) < 0x80 then index += 7; (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte7 = binary.getbyte(index + 7)) < 0x80 then index += 8; (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte8 = binary.getbyte(index + 8)) < 0x80 then index += 9; (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) elsif (byte9 = binary.getbyte(index + 9)) < 0x80 then index += 10; (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F) end
  end
  if header == 0x12
    found = true
    list = @digest
    while true
      # map(2, :digest, type: :map)
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
    end
    raise EOFError, "index #{index} != max #{max}" unless index == max
    self
  end
  def __protobug_initialize_defaults
    @unknown_fields = nil
    @uri = nil
    @digest = {}
    self
  end
  def as_json
    json = {}
    json["uri"] = @uri if has_uri?
    json["digest"] = @digest.transform_values { _1} unless @digest.empty?
    json
  end

  # optional(1, :uri, type: :string)
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
  # map(2, :digest, type: :map)
  attr_reader :digest
  def has_digest?
    value = @digest
  
    !value.empty?
  end
  def clear_digest
    @digest.clear
  end
end
