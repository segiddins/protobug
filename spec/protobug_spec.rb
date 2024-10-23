# frozen_string_literal: true

require "json"

RSpec.describe Protobug do
  it "has a version number" do
    expect(Protobug::VERSION).not_to be_nil
  end

  test2 = Class.new do
    extend Protobug::Message
    optional 2, :b, type: :string
  end

  test3 = Class.new do
    extend Protobug::Message
    optional 1, :n, type: :int32
    optional 2, :n64, type: :int64
  end

  test_sint = Class.new do
    extend Protobug::Message
    optional 1, :n32, type: :sint32
    optional 2, :n64, type: :sint64
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
    decoded = test3.decode(encoded)
    expect(decoded.n).to eq(150)

    msg.n = -2
    encoded = test3.encode(msg)
    aggregate_failures do
      expect(encoded).to eq("\x08\xfe\xff\xff\xff\xff\xff\xff\xff\xff\x01".b)
      decoded = test3.decode(encoded)
      expect(decoded.n).to eq(-2)
    end
    msg.n = -1
    encoded = test3.encode(msg)
    aggregate_failures do
      expect(encoded).to eq("\x08\xff\xff\xff\xff\xff\xff\xff\xff\xff\x01".b)
      decoded = test3.decode(encoded)
      expect(decoded.n).to eq(-1)
    end

    decoded = test3.decode("\x08\x80\x80\x80\x80\x10")
    expect(decoded.n64).to eq(0)

    {
      (1 << 33) => 0,
      (1 << 33) - 1 => -1,
      1 => 1,
      -1 => -1,
      0 => 0,
      9_223_372_036_854_775_807 => -1,
      -9_223_372_036_854_775_807 => 1,
      -2_147_483_648 => -2_147_483_648
    }.each do |varint, expected|
      io = "\x08".b
      encoded = Protobug::BinaryEncoding.encode_varint(varint, io)
      actual = test3.decode(io).n
      expect(actual).to eq(expected),
                        "int32: #{varint.to_s(16)} => #{actual.to_s(16)}, expected: #{expected.to_s(16)}"
    end

    test_uint32 = Class.new do
      extend Protobug::Message
      optional 1, :n, type: :uint32
    end
    test_uint64 = Class.new do
      extend Protobug::Message
      optional 1, :n, type: :uint64
    end

    aggregate_failures do
      [[32, test_uint32], [64, test_uint64]].each do |bits, cls|
        {
          0 => 0,
          1 => 1,
          2 => 2,
          2**bits.pred => 2**bits.pred,
          (2**bits.pred) - 1 => (2**bits.pred) - 1,
          2**bits => 0,
          (2**bits).succ => 1,
          9_223_372_036_854_775_807 => 9_223_372_036_854_775_807 & ((1 << bits) - 1)
        }.each do |int, expected|
          next if int >= 2**64

          io = "\x08".b
          encoded = Protobug::BinaryEncoding.encode_varint(int, io)
          actual = cls.decode(io).n
          expect(actual).to eq(expected),
                            "uint#{bits}: #{int.to_s(16)} => #{actual.to_s(16)}, expected: #{expected.to_s(16)}"
        end
      end
    end
  end

  it "allows oneofs" do # rubocop:disable RSpec/MultipleExpectations
    c = Class.new do
      extend Protobug::Message
      optional 1, :a, type: :string, oneof: :x
      optional 2, :b, type: :int32, oneof: :x
    end

    msg = c.new
    expect(msg.x).to be_nil
    expect(msg.a).to eq("")
    expect(msg.b).to eq(0)
    expect(msg.x).to eq(:b)
    expect(msg.a?).to be_falsy # rubocop:disable RSpec/PredicateMatcher
    expect(msg).to be_b

    msg.a = "test"

    expect(msg.x).to eq(:a)
    expect(msg.a).to eq("test")
    expect(msg.b).to eq(0)
    expect(msg.x).to eq(:b)

    msg.clear_a
    msg.b = 1

    expect(msg.x).to eq(:b)
    expect(msg.b).to eq(1)
    expect(msg.a).to eq("")
    expect(msg.b).to eq(0)
    expect(msg.x).to eq(:b)
  end

  it "parses packed field" do
    c = Class.new do
      extend Protobug::Message
      repeated 6, :f, type: :int32, packed: true
    end

    encoded = ["3206038e029ea705"].pack("H*")
    decoded = c.decode(encoded)
    expect(decoded.f).to eq([3, 270, 86_942])
  end

  it "parses sint32 and sint64" do
    msg = test_sint.new
    msg.n32 = 4
    msg.n64 = -1
    encoded = test_sint.encode(msg)
    decoded = test_sint.decode(encoded)
    aggregate_failures do
      expect(encoded).to eq("\x08\x08\x10\x01".b)
      expect(decoded.n32).to eq(4)
      expect(decoded.n64).to eq(-1)
    end

    msg.n32 = -33
    msg.n64 = -0x80000000
    encoded = test_sint.encode(msg)
    decoded = test_sint.decode(encoded)
    expect(decoded.n32).to eq(-33)
    expect(decoded.n64).to eq(-0x80000000)

    msg.clear_n32

    msg.n64 = -9_223_372_036_854_775_808
    encoded = test_sint.encode(msg)
    aggregate_failures do
      expect(encoded).to eq("\020\377\377\377\377\377\377\377\377\377\001".b)
      decoded = test_sint.decode(encoded)
      expect(decoded.n64).to eq(-9_223_372_036_854_775_808)
    end

    # int32 max
    msg.n32 = (2**31) - 1
    msg.clear_n64
    encoded = test_sint.encode(msg)
    aggregate_failures do
      decoded = test_sint.decode(encoded)
      expect(decoded.n32).to eq(2_147_483_647)
    end

    # int32 min
    msg.n32 = -2**31
    msg.n64 = 0
    encoded = test_sint.encode(msg)
    aggregate_failures do
      decoded = test_sint.decode(encoded)
      expect(decoded.n32).to eq(-2**31)
    end

    # int64 min
    decoded = test_sint.decode("\020\377\377\377\377\377\377\377\377\377\001")
    expect(decoded.n64).to eq(-9_223_372_036_854_775_808)

    decoded = test_sint.decode("\020\202\200\200\200\020\x08\202\200\200\200\020")
    expect(decoded.n64).to eq(2_147_483_649)
    expect(decoded.n32).to eq(1)
  end

  it "parses fixed32 and fixed64" do
    c = Class.new do
      extend Protobug::Message
      optional 1, :f, type: :fixed64
      optional 2, :f32, type: :fixed32
      optional 3, :sf64, type: :sfixed64
      optional 4, :sf32, type: :sfixed32
    end
    msg = c.new
    msg.f = 3
    msg.f32 = 72
    msg.sf64 = -1
    msg.sf32 = 76
    aggregate_failures do
      encoded = c.encode(msg)
      decoded = c.decode(encoded)

      expect(decoded.f).to eq(3)
      expect(decoded.f32).to eq(72)
    end
  end

  it "parses maps" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "protobuf_test_messages.proto3.ForeignMessage"

      map 1, :m1, key_type: :int32, value_type: :int32

      map(
        72,
        "map_string_foreign_message",
        key_type: :string,
        value_type: :message,
        message_class: "self.class",
        json_name: "mapStringForeignMessage"
      )
    end

    msg = c.new
    msg.m1[0] = 0
    msg.m1[1] = 1
    msg.m1[-4] = -2

    msg.map_string_foreign_message["foo"] = c.new
    encoded = c.encode(msg)
    decoded = c.decode(encoded)

    expect(decoded.m1).to eq(0 => 0, 1 => 1, -4 => -2)
  end

  it "allows modifying defaults" do
    c = Class.new do
      extend Protobug::Message
      optional 1, :optional, type: :int32
      repeated 2, :repeated, type: :int32
      optional 3, :message, type: :message, message_class: "self.class"
      map 4, :map, key_type: :string, value_type: :int32
    end

    msg = c.new
    expect(msg).not_to be_optional
    expect(msg).not_to be_repeated
    expect(msg).not_to be_message
    expect(msg).not_to be_map
    expect(msg.as_json).to eq({})

    msg.optional += 1
    msg.repeated << 1
    msg.message.optional = 1
    msg.map["foo"] = 1

    expect(msg.as_json).to eq("optional" => 1, "repeated" => [1], "message" => { "optional" => 1 },
                              "map" => { "foo" => 1 })
  end
end
