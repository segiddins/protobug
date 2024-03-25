# frozen_string_literal: true

Google::Protobuf::Duration.class_eval do
  def self.decode_json_hash(json, registry:)
    return Protobug::UNSET if json.nil?
    raise Protobug::DecodeError, "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String

    unless /\A(-)?(\d+)(?:\.(\d+))?s\z/ =~ json
      raise Protobug::DecodeError, "expected string for #{full_name}, got #{json.inspect}"
    end

    sign = Regexp.last_match(1) ? -1 : 1
    seconds = Regexp.last_match(2).to_i
    nanos = Regexp.last_match(3)&.ljust(9, "0").to_i
    validate_json_range(seconds, nanos)
    super({
      "seconds" => sign * seconds,
      "nanos" => sign * nanos
    }, registry: registry)
  end

  def as_json(print_unknown_fields: false) # rubocop:disable Lint/UnusedMethodArgument
    seconds = self.seconds
    nanos = self.nanos

    self.class.validate_json_range(seconds, nanos)

    sign = seconds.negative? ? "-" : ""
    sign = "-" if seconds.zero? && nanos.negative?
    seconds = seconds.abs
    nanos = nanos.abs
    if nanos.nonzero?
      nanos_s = ".#{nanos.to_s.rjust(9, "0")}"
      nil while nanos_s.delete_suffix!("000")
    end
    "#{sign}#{seconds}#{nanos_s}s"
  end

  def self.validate_json_range(seconds, nanos)
    if seconds != 0 && nanos != 0 && (seconds.negative? ^ nanos.negative?)
      raise Protobug::EncodeError, "seconds and nanos must have the same sign"
    end

    raise RangeError if seconds < -315_576_000_000 || seconds > +315_576_000_000
  end
end
