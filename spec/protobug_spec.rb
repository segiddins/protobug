# frozen_string_literal: true
require 'json'

RSpec.describe Protobug do
  it "has a version number" do
    expect(Protobug::VERSION).not_to be nil
  end

  test2 = Class.new do
    extend Protobug::Message
    optional 2, :b, type: :string
  end

  test3 = Class.new do
    extend Protobug::Message
    optional 1, :n, type: :int32
  end


  it "binary encodes" do
    msg = test2.new
    msg.b = "testing"
    encoded = test2.encode(msg)
    expect(encoded).to eq("\x12\x07\x74\x65\x73\x74\x69\x6e\x67".b)
  end

  it "binary encodes ints" do
    msg = test3.new
    encoded = test3.encode(msg)
    expect(encoded).to eq("".b)

    msg.n = 1
    encoded = test3.encode(msg)
    expect(encoded).to eq("\x08\x01".b)

    msg.n = 150
    encoded = test3.encode(msg)
    expect(encoded).to eq("\x08\x96\x01".b)
    decoded = test3.decode(StringIO.new(encoded), registry: nil)
    expect(decoded.n).to eq(150)

    msg.n = -2
    encoded = test3.encode(msg)
    aggregate_failures do
      expect(encoded).to eq("\x08\xfe\xff\xff\xff\xff\xff\xff\xff\xff\x01".b)
      decoded = test3.decode(StringIO.new(encoded), registry: nil)
      expect(decoded.n).to eq(-2)
    end
  end

  it "allows oneofs" do
    c = Class.new do
      extend Protobug::Message
      optional 1, :a, type: :string, oneof: :x
      optional 2, :b, type: :int32, oneof: :x
    end

    msg = c.new
    expect(msg.a).to eq("")
    expect(msg.b).to eq(0)
    expect(msg.x).to eq(nil)

    msg.a = "test"

    expect(msg.a).to eq("test")
    expect(msg.b).to eq(0)
    expect(msg.x).to eq(:a)

    msg.clear_a
    msg.b = 1

    expect(msg.a).to eq("")
    expect(msg.b).to eq(1)
    expect(msg.x).to eq(:b)
  end

  it "parses JSON timestamps" do
    t = Class.new do
      extend Protobug::Message
      self.full_name = "google.protobuf.Timestamp"
      optional 1, :seconds, type: :int64
      optional 2, :nanos, type: :int32
    end
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.Timestamp"
      optional 1, :a, type: :message, message_type: "google.protobuf.Timestamp"
    end

    registry = Protobug::Registry.new do |registry|
      registry.register t
      registry.register c
    end

    ["1970-01-01T00:00:00.000Z", "2023-04-14T00:00:00.000Z"].each do |json|
      msg = c.decode_json(JSON.generate(a: json), registry: registry)
      expect(JSON.parse(msg.to_json)).to eq("a" =>json)
    end
  end

  it "parses packed field" do
    c = Class.new do
      extend Protobug::Message
      repeated 6, :f, type: :int32, packed: true
    end

    encoded = ["3206038e029ea705"].pack("H*")
    io = StringIO.new(encoded)
    decoded = c.decode(io, registry: nil)
    expect(decoded.f).to eq([3, 270, 86942])
    expect(io).to be_eof
  end
end
