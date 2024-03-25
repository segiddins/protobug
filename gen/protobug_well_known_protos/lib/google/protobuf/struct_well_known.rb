# frozen_string_literal: true

Google::Protobuf::Value.class_eval do
  def self.decode_json_hash(json, registry:, ignore_unknown_fields: false)
    case json
    when NilClass
      json = { "nullValue" => "NULL_VALUE" }
    when Float, Integer
      json = { "numberValue" => json.to_f }
    when String
      json = { "stringValue" => json }
    when TrueClass, FalseClass
      json = { "boolValue" => json }
    when Hash
      json = { "structValue" => json }
    when Array
      json = { "listValue" => json }
    end

    super
  end

  def as_json(print_unknown_fields: false)
    case kind
    when :null_value
      nil
    when :number_value
      number_value
    when :string_value
      string_value
    when :bool_value
      bool_value
    when :struct_value
      struct_value.as_json(print_unknown_fields: print_unknown_fields)
    when :list_value
      list_value.values.map! { _1.as_json(print_unknown_fields: print_unknown_fields) }
    else
      raise Protobug::EncodeError, "unknown kind: #{kind.inspect}"
    end
  end
end

Google::Protobuf::Struct.class_eval do
  def self.decode_json_hash(json, registry:, ignore_unknown_fields: false)
    json = { "fields" => json }
    super
  end

  def as_json(print_unknown_fields: false)
    fields.transform_values { _1&.as_json(print_unknown_fields: print_unknown_fields) }
  end
end

Google::Protobuf::ListValue.class_eval do
  def self.decode_json_hash(json, registry:, ignore_unknown_fields: false)
    json = { "values" => json }
    super
  end

  def as_json(print_unknown_fields: false)
    values.map { _1.as_json(print_unknown_fields: print_unknown_fields) }
  end
end

Google::Protobuf::NullValue.class_eval do
  def self.decode_json_hash(json, registry:, ignore_unknown_fields: false)
    return values.fetch(0) if json.nil?

    super
  end

  def as_json(print_unknown_fields: false)
    return if value.zero?

    super
  end
end
