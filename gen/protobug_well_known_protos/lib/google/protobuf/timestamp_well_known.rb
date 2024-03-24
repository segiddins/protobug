# frozen_string_literal: true

Google::Protobuf::Timestamp.class_eval do
  def self.decode_json_hash(json, registry:)
    raise Protobug::DecodeError, "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String

    time = DateTime.rfc3339(json, Date::GREGORIAN).to_time
    super({
      "seconds" => time.to_i,
      "nanos" => time.nsec
    }, registry: registry)
  end

  def as_json(print_unknown_fields: false) # rubocop:disable Lint/UnusedMethodArgument
    time = Time.at(seconds, nanos, :nanosecond, in: 0)
    raise Protobug::EncodeError, "time value too large #{time.inspect}" if time.year > 9999
    raise Protobug::EncodeError, "time value too small #{time.inspect}" if time.year <= 0

    nanosecs = time.nsec

    if nanosecs.positive?
      nanosecs = nanosecs.to_s.rjust(9, "0")
      nil while nanosecs.delete_suffix!("000")
      digits = nanosecs.size
      format = "%FT%H:%M:%S.%#{digits}NZ"
    else
      format = "%FT%H:%M:%SZ"
    end

    time.strftime(format)
  end
end
