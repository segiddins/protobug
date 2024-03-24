# frozen_string_literal: true

Google::Protobuf::FieldMask.class_eval do
  def self.decode_json_hash(json, registry:)
    raise DecodeError, "expected string for #{full_name}, got #{json.inspect}" unless json.is_a? String

    paths = json.split(",").each do |field|
      field.gsub!(/(?<!\A)([A-Z])/) { |m| "_#{m.downcase}" }
    end
    json = { "paths" => paths }
    super
  end
end
