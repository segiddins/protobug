# frozen_string_literal: true

Google::Protobuf::Any.class_eval do
  def self.pack(msg)
    new.pack(msg)
  end

  def pack(msg)
    self.type_url = "type.googleapis.com/#{msg.class.full_name}"
    self.value = msg.to_proto
    self
  end

  def unpack
    type = Protobug.resolve_known_type(type_url.delete_prefix("type.googleapis.com/"))
    type.decode(value)
  end

  def self.decode_json_hash(json, ignore_unknown_fields: false)
    raise Protobug::DecodeError, "expected hash, got #{json.inspect}" unless json.is_a? Hash

    json = json.dup
    type_url = json.delete("@type") || raise(Protobug::DecodeError, "missing @type")
    raise Protobug::DecodeError, "expected string for @type, got #{type_url.inspect}" unless type_url.is_a? String

    unless type_url.start_with?("type.googleapis.com/")
      raise Protobug::DecodeError, "only type.googleapis.com/ types are supported for Any"
    end

    # TODO: specifically check for well-known type with custom JSON representation
    json = json["value"] if json.key?("value") && json.size == 1

    type = Protobug.resolve_known_type(type_url.delete_prefix("type.googleapis.com/"))
    v = type.decode_json_hash(json, ignore_unknown_fields: ignore_unknown_fields)
    json = {
      "type_url" => type_url,
      "value" => [type.encode(v)].pack("m0")
    }
    super
  end

  def as_json(print_unknown_fields: false)
    json = unpack.as_json(print_unknown_fields: print_unknown_fields)
    if json.is_a?(Hash) &&
       !%w[type.googleapis.com/google.protobuf.Any
           type.googleapis.com/google.protobuf.Value
           type.googleapis.com/google.protobuf.Struct].include?(type_url)

      json["@type"] = type_url
      json
    else
      { "value" => json, "@type" => type_url }
    end
  end
end
