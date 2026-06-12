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
    decoded = test3.decode(StringIO.new(encoded), registry: nil)
    expect(decoded.n).to eq(150)

    msg.n = -2
    encoded = test3.encode(msg)
    aggregate_failures do
      expect(encoded).to eq("\x08\xfe\xff\xff\xff\xff\xff\xff\xff\xff\x01".b)
      decoded = test3.decode(StringIO.new(encoded), registry: nil)
      expect(decoded.n).to eq(-2)
    end
    msg.n = -1
    encoded = test3.encode(msg)
    aggregate_failures do
      expect(encoded).to eq("\x08\xff\xff\xff\xff\xff\xff\xff\xff\xff\x01".b)
      decoded = test3.decode(StringIO.new(encoded), registry: nil)
      expect(decoded.n).to eq(-1)
    end

    decoded = test3.decode(StringIO.new("\x08\x80\x80\x80\x80\x10"), registry: nil)
    expect(decoded.n64).to eq(0)

    {
      (1 << 33) => 0,
      (1 << 33) - 1 => -1,
      9_223_372_036_854_775_807 => -1,
      -9_223_372_036_854_775_807 => 1
    }.each do |varint, expected|
      io = "\x08".b
      encoded = Protobug::BinaryEncoding.encode_varint(varint, io)
      expect(test3.decode(StringIO.new(io), registry: nil).n).to eq(expected)
    end
  end

  it "rejects overlong varints whose 10th byte exceeds 64 bits" do
    # field 1, varint wire type, then 9 continuation bytes plus a 10th byte
    # that sets bits above bit 63, which cannot fit in a 64-bit integer.
    encoded = ("\x08".b + ("\xFF".b * 9) + "\x7F".b)
    expect do
      test3.decode(StringIO.new(encoded), registry: nil)
    end.to raise_error(Protobug::DecodeError)
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
    expect(msg.x).to be_nil

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

  it "parses packed field" do
    c = Class.new do
      extend Protobug::Message
      repeated 6, :f, type: :int32, packed: true
    end

    encoded = ["3206038e029ea705"].pack("H*")
    io = StringIO.new(encoded)
    decoded = c.decode(io, registry: nil)
    expect(decoded.f).to eq([3, 270, 86_942])
    expect(io).to be_eof
  end

  it "parses sint32 and sint64" do
    msg = test_sint.new
    msg.n32 = 4
    msg.n64 = -1
    encoded = test_sint.encode(msg)
    decoded = test_sint.decode(StringIO.new(encoded), registry: nil)
    aggregate_failures do
      expect(encoded).to eq("\x08\x08\x10\x01".b)
      expect(decoded.n32).to eq(4)
      expect(decoded.n64).to eq(-1)
    end

    msg.n32 = -33
    msg.n64 = -0x80000000
    encoded = test_sint.encode(msg)
    decoded = test_sint.decode(StringIO.new(encoded), registry: nil)
    expect(decoded.n32).to eq(-33)
    expect(decoded.n64).to eq(-0x80000000)

    msg.clear_n32

    msg.n64 = -9_223_372_036_854_775_808
    encoded = test_sint.encode(msg)
    aggregate_failures do
      expect(encoded).to eq("\020\377\377\377\377\377\377\377\377\377\001".b)
      decoded = test_sint.decode(StringIO.new(encoded), registry: nil)
      expect(decoded.n64).to eq(-9_223_372_036_854_775_808)
    end

    # int32 max
    msg.n32 = (2**31) - 1
    msg.clear_n64
    encoded = test_sint.encode(msg)
    aggregate_failures do
      decoded = test_sint.decode(StringIO.new(encoded), registry: nil)
      expect(decoded.n32).to eq(2_147_483_647)
    end

    # int32 min
    msg.n32 = -2**31
    msg.n64 = 0
    encoded = test_sint.encode(msg)
    aggregate_failures do
      decoded = test_sint.decode(StringIO.new(encoded), registry: nil)
      expect(decoded.n32).to eq(-2**31)
    end

    # int64 min
    decoded = test_sint.decode(StringIO.new("\020\377\377\377\377\377\377\377\377\377\001"), registry: nil)
    expect(decoded.n64).to eq(-9_223_372_036_854_775_808)
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
      decoded = c.decode(StringIO.new(encoded), registry: nil)

      expect(decoded.f).to eq(3)
      expect(decoded.f32).to eq(72)
    end
  end

  it "preserves unknown fields across binary decode/re-encode" do
    full = Class.new do
      extend Protobug::Message
      optional 1, :a, type: :string
      optional 2, :b, type: :fixed32
      optional 3, :c, type: :fixed64
      optional 4, :d, type: :int32
    end
    partial = Class.new do
      extend Protobug::Message
      optional 1, :a, type: :string
    end

    msg = full.new
    msg.a = "hello"
    msg.b = 0x01020304
    msg.c = 0x0102030405060708
    msg.d = 150
    encoded = full.encode(msg)

    decoded = partial.decode(StringIO.new(encoded), registry: nil)
    aggregate_failures do
      expect(decoded.a).to eq("hello")
      # fixed32 (wire 5), fixed64 (wire 1), varint (wire 0) all retained as unknown
      expect(decoded.unknown_fields.map { |n, w, _| [n, w] }).to eq([[2, 5], [3, 1], [4, 0]])
    end

    reencoded = partial.encode(decoded)
    roundtrip = full.decode(StringIO.new(reencoded), registry: nil)
    aggregate_failures do
      expect(roundtrip.a).to eq("hello")
      expect(roundtrip.b).to eq(0x01020304)
      expect(roundtrip.c).to eq(0x0102030405060708)
      expect(roundtrip.d).to eq(150)
    end
  end

  it "round-trips scalars through JSON" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.JsonScalars"
      optional 1, :s, type: :string
      optional 2, :bytes, type: :bytes
      optional 3, :big, type: :int64
      optional 4, :d, type: :double
      repeated 5, :nums, type: :int32
    end

    msg = c.new
    msg.s = "héllo"
    msg.bytes = "\x00\x01\x02\xff".b
    msg.big = 9_223_372_036_854_775_807
    msg.d = Float::INFINITY
    msg.add_nums(1)
    msg.add_nums(2)
    msg.add_nums(3)

    json = msg.to_json
    parsed = JSON.parse(json)
    aggregate_failures do
      expect(parsed["s"]).to eq("héllo")
      expect(parsed["bytes"]).to eq(["\x00\x01\x02\xff".b].pack("m0"))
      expect(parsed["big"]).to eq("9223372036854775807") # int64 encodes as decimal string
      expect(parsed["d"]).to eq("Infinity")
      expect(parsed["nums"]).to eq([1, 2, 3])
    end

    decoded = c.decode_json(json, registry: nil)
    aggregate_failures do
      expect(decoded.s).to eq("héllo")
      expect(decoded.bytes).to eq("\x00\x01\x02\xff".b)
      expect(decoded.bytes.encoding).to eq(Encoding::BINARY)
      expect(decoded.big).to eq(9_223_372_036_854_775_807)
      expect(decoded.big).to be_a(Integer)
      expect(decoded.d).to eq(Float::INFINITY)
      expect(decoded.d).to be_a(Float)
      expect(decoded.nums).to eq([1, 2, 3])
    end
  end

  it "round-trips maps and enums through binary and JSON" do
    enum = Class.new do
      extend Protobug::Enum
      self.full_name = "test.Color"
      const_set(:RED, new("RED", 0).freeze)
      const_set(:GREEN, new("GREEN", 1).freeze)
      const_set(:BLUE, new("BLUE", 2).freeze)
    end
    msg_class = Class.new do
      extend Protobug::Message
      self.full_name = "test.MapEnum"
      map 1, :counts, key_type: :string, value_type: :int32
      optional 2, :color, type: :enum, enum_type: "test.Color", proto3_optional: false
    end
    registry = Protobug::Registry.new do |r|
      r.register(enum)
      r.register(msg_class)
    end

    msg = msg_class.new
    msg.add_counts(msg_class.fields_by_name.fetch("counts").type_lookup(registry).new.tap do |e|
      e.key = "a"
      e.value = 5
    end)
    msg.color = enum::GREEN

    # binary round-trip
    encoded = msg_class.encode(msg)
    decoded = msg_class.decode(StringIO.new(encoded), registry: registry)
    aggregate_failures do
      expect(decoded.counts).to eq({ "a" => 5 })
      expect(decoded.color).to eq(enum::GREEN)
      expect(decoded.color.to_s).to eq("GREEN")
    end

    # JSON round-trip: known enum serializes as its name
    json = msg.to_json
    parsed = JSON.parse(json)
    aggregate_failures do
      expect(parsed["counts"]).to eq({ "a" => 5 })
      expect(parsed["color"]).to eq("GREEN")
    end
    from_json = msg_class.decode_json(json, registry: registry)
    aggregate_failures do
      expect(from_json.counts).to eq({ "a" => 5 })
      expect(from_json.color).to eq(enum::GREEN)
    end

    # unknown enum wire number is retained and re-emitted as its integer
    unknown_color_class = Class.new do
      extend Protobug::Message
      self.full_name = "test.UnknownColor"
      optional 2, :color, type: :enum, enum_type: "test.Color", proto3_optional: false
    end
    # field 2 (enum, wire 0) carrying value 7, which is not a known Color
    wire = [(2 << 3) | 0, 7].pack("C*")
    decoded_unknown = unknown_color_class.decode(StringIO.new(wire), registry: registry)
    aggregate_failures do
      expect(decoded_unknown.color).to eq(7)
      expect(decoded_unknown.to_json).to eq(%({"color":7}))
      reencoded = unknown_color_class.encode(decoded_unknown)
      expect(reencoded).to eq(wire)
    end
  end

  it "handles decode_json parse-failure, non-hash, and unknown-field paths" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.JsonErrors"
      optional 1, :a, type: :string
    end

    aggregate_failures do
      expect { c.decode_json("{not valid json", registry: nil) }
        .to raise_error(Protobug::DecodeError, /JSON failed to parse/)

      expect { c.decode_json("[1, 2, 3]", registry: nil) }
        .to raise_error(Protobug::DecodeError, /expected hash/)

      expect { c.decode_json(%({"a":"x","nope":1}), registry: nil) }
        .to raise_error(Protobug::UnknownFieldError, /unknown field "nope"/)

      decoded = c.decode_json(%({"a":"x","nope":1}), registry: nil, ignore_unknown_fields: true)
      expect(decoded.a).to eq("x")
    end
  end

  it "compares messages by structural equality" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.Equality"
      optional 1, :a, type: :string
      optional 2, :b, type: :int32
    end

    a = c.new
    a.a = "x"
    a.b = 5

    b = c.new
    b.a = "x"
    b.b = 5

    aggregate_failures do
      expect(a).to eq(b)
      expect(a).to eql(b)
      expect(a.hash).to eq(b.hash)
    end

    b.b = 6
    aggregate_failures do
      expect(a).not_to eq(b)
      expect(a).not_to eql(b)
    end
  end

  it "enforces registry register/fetch invariants" do
    msg_class = Class.new do
      extend Protobug::Message
      self.full_name = "test.RegistryItem"
      optional 1, :a, type: :string
    end
    other_class = Class.new do
      extend Protobug::Message
      self.full_name = "test.RegistryItem"
      optional 1, :a, type: :string
    end

    registry = Protobug::Registry.new

    aggregate_failures do
      expect { registry.register("not a descriptor") }
        .to raise_error(ArgumentError, /expected Protobug::BaseDescriptor/)

      registry.register(msg_class)
      # idempotent re-registration of the same class does not raise
      expect { registry.register(msg_class) }.not_to raise_error
      expect(registry.fetch("test.RegistryItem")).to eq(msg_class)

      # two distinct classes under one full_name conflict
      expect { registry.register(other_class) }
        .to raise_error(ArgumentError, /duplicate class/)

      expect { registry.fetch("test.Missing") }.to raise_error(KeyError)
    end
  end

  it "rejects invalid field definitions" do
    aggregate_failures do
      expect do
        Class.new do
          extend Protobug::Message
          optional 1, :a, type: :string
          optional 1, :b, type: :string
        end
      end.to raise_error(Protobug::DefinitionError, /duplicate field number/)

      expect do
        Class.new do
          extend Protobug::Message
          optional 1, :a, type: :string
          optional 2, :a, type: :string
        end
      end.to raise_error(Protobug::DefinitionError, /duplicate field name/)

      expect do
        Class.new do
          extend Protobug::Message
          optional 1, :a, type: :bogus
        end
      end.to raise_error(ArgumentError, /Unknown field type/)
    end
  end
end
