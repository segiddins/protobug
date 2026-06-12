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

  it "guards encode_varint bounds and surfaces EOF on truncated decodes" do
    fixed = Class.new do
      extend Protobug::Message
      self.full_name = "test.Fixed64Eof"
      optional 1, :f, type: :fixed64
    end

    aggregate_failures do
      # encode_varint range guards: one past the unsigned and signed bounds
      expect { Protobug::BinaryEncoding.encode_varint(2**64, "".b) }
        .to raise_error(RangeError, /64-bit integer/)
      expect { Protobug::BinaryEncoding.encode_varint((-2**63) - 1, "".b) }
        .to raise_error(RangeError, /64-bit integer/)

      # encode_varint type guard
      expect { Protobug::BinaryEncoding.encode_varint("5", "".b) }
        .to raise_error(Protobug::EncodeError, /expected integer/)

      # a varint header (field 1, wire 0) with no value byte hits EOF
      expect { test3.decode(StringIO.new("\x08".b), registry: nil) }
        .to raise_error(EOFError)

      # a fixed64 header (field 1, wire 1) with fewer than 8 value bytes hits EOF
      expect { fixed.decode(StringIO.new("\x09\x01\x02\x03".b), registry: nil) }
        .to raise_error(EOFError)
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
    msg.f = 0x0102030405060708
    msg.f32 = 72
    msg.sf64 = 0x1122334455667788
    msg.sf32 = 76
    aggregate_failures do
      encoded = c.encode(msg)
      # fixed64 (field 1, wire 1) must be little-endian on the wire regardless of host byte order
      expect(encoded[0, 9]).to eq("\x09\x08\x07\x06\x05\x04\x03\x02\x01".b)
      # sfixed64 (field 3, wire 1) must also be little-endian; an asymmetric value distinguishes byte order
      sf64_idx = encoded.index("\x19".b)
      expect(encoded[sf64_idx, 9]).to eq("\x19\x88\x77\x66\x55\x44\x33\x22\x11".b)

      decoded = c.decode(StringIO.new(encoded), registry: nil)
      expect(decoded.f).to eq(0x0102030405060708)
      expect(decoded.f32).to eq(72)
      expect(decoded.sf64).to eq(0x1122334455667788)
      expect(decoded.sf32).to eq(76)
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

  it "JSON-decodes double values given as fractional and exponent strings" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.JsonDoubleStrings"
      optional 1, :d, type: :double
    end

    aggregate_failures do
      expect(c.decode_json('{"d":"1.5"}', registry: nil).d).to eq(1.5)
      expect(c.decode_json('{"d":"1e3"}', registry: nil).d).to eq(1000.0)
      expect(c.decode_json('{"d":"-2.5e-1"}', registry: nil).d).to eq(-0.25)
      expect(c.decode_json('{"d":"42"}', registry: nil).d).to eq(42.0)
    end
  end

  it "round-trips double NaN and float -Infinity through JSON and coerces integers to Float" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.JsonFloatSpecials"
      optional 1, :d, type: :double
      optional 2, :f, type: :float
    end

    msg = c.new
    msg.d = Float::NAN
    msg.f = -Float::INFINITY

    parsed = JSON.parse(msg.to_json)
    aggregate_failures do
      expect(parsed["d"]).to eq("NaN")
      expect(parsed["f"]).to eq("-Infinity")
    end

    decoded = c.decode_json(msg.to_json, registry: nil)
    aggregate_failures do
      expect(decoded.d).to be_nan
      expect(decoded.f).to eq(-Float::INFINITY)
    end

    coerced = c.decode_json(%({"d":7,"f":-3}), registry: nil)
    aggregate_failures do
      expect(coerced.d).to eq(7.0)
      expect(coerced.d).to be_a(Float)
      expect(coerced.f).to eq(-3.0)
      expect(coerced.f).to be_a(Float)
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

  it "compares enum values across representations and serializes known and unknown numbers" do
    enum = Class.new do
      extend Protobug::Enum
      self.full_name = "test.EnumRepr"
      const_set(:RED, new("RED", 0).freeze)
      const_set(:GREEN, new("GREEN", 1).freeze)
    end
    # Freeze registers the members in @values on Ruby < 3.2 (where the const_added
    # hook is unavailable), matching how generated enums are finalized.
    enum.freeze

    green = enum::GREEN

    aggregate_failures do
      # == across Integer, String, and Symbol forms
      expect(green).to eq(1)
      expect(green).to eq("GREEN")
      expect(green).to eq(:GREEN)

      # == against an arbitrary object raises
      expect { green == Object.new }.to raise_error(/expected #{enum}/)

      # decode_json_hash of an unknown name raises DecodeError
      expect { enum.decode_json_hash("MAUVE") }
        .to raise_error(Protobug::DecodeError, /unknown value/)

      # a known value's as_json returns its name
      expect(green.as_json).to eq("GREEN")

      # an unknown number round-trips as the integer and renders its placeholder name
      unknown = enum.decode(99)
      expect(unknown.as_json).to eq(99)
      expect(unknown.to_s).to eq("<unknown:99>")
    end
  end

  it "merges repeated occurrences of an embedded message field into one submessage" do
    inner_class = Class.new do
      extend Protobug::Message
      self.full_name = "test.MergeInner"
      optional 1, :a, type: :string
      optional 2, :b, type: :string
    end
    outer_class = Class.new do
      extend Protobug::Message
      self.full_name = "test.MergeOuter"
      optional 1, :inner, type: :message, message_type: "test.MergeInner"
    end
    registry = Protobug::Registry.new do |r|
      r.register(inner_class)
      r.register(outer_class)
    end

    first = outer_class.new
    first.inner = inner_class.new.tap { |i| i.a = "alpha" }
    second = outer_class.new
    second.inner = inner_class.new.tap { |i| i.b = "beta" }

    # concatenated wire bytes: two outer messages each carrying the inner field
    concatenated = outer_class.encode(first) + outer_class.encode(second)
    decoded = outer_class.decode(StringIO.new(concatenated), registry: registry)

    aggregate_failures do
      expect(decoded.inner.a).to eq("alpha")
      expect(decoded.inner.b).to eq("beta")
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

  it "treats distinct message classes with identical fields as unequal" do
    klass = lambda do
      Class.new do
        extend Protobug::Message
        optional 1, :a, type: :string
      end
    end

    c1 = klass.call
    c2 = klass.call

    m1 = c1.new
    m1.a = "x"
    m2 = c2.new
    m2.a = "x"

    aggregate_failures do
      expect(c1.full_name).to be_nil
      expect(c2.full_name).to be_nil
      expect(m1).not_to eq(m2)
      expect(m1).not_to eql(m2)
      expect(m1.hash).not_to eq(m2.hash)
      expect({ m1 => 1 }[m2]).to be_nil
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

  it "validates integer range/type and boolean type on assignment" do
    msg_class = Class.new do
      extend Protobug::Message
      self.full_name = "test.Validation"
      optional 1, :i32, type: :int32
      optional 2, :u32, type: :uint32
      optional 3, :flag, type: :bool
    end
    msg = msg_class.new

    aggregate_failures do
      # int32 boundaries are accepted
      expect { msg.i32 = (2**31) - 1 }.not_to raise_error
      expect(msg.i32).to eq((2**31) - 1)
      expect { msg.i32 = -2**31 }.not_to raise_error
      expect(msg.i32).to eq(-2**31)

      # one past either boundary is rejected
      expect { msg.i32 = 2**31 }
        .to raise_error(Protobug::InvalidValueError, /does not fit/)
      expect { msg.i32 = (-2**31) - 1 }
        .to raise_error(Protobug::InvalidValueError, /does not fit/)

      # non-integer is rejected
      expect { msg.i32 = "5" }
        .to raise_error(Protobug::InvalidValueError, /expected integer/)

      # uint32 rejects negative values
      expect { msg.u32 = -1 }
        .to raise_error(Protobug::InvalidValueError, /does not fit/)

      # bool rejects non-boolean
      expect { msg.flag = "true" }
        .to raise_error(Protobug::InvalidValueError, /expected boolean/)
    end
  end

  it "rejects field number 0 and group wire types when binary decoding" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.WireGuards"
      optional 1, :a, type: :string
    end

    aggregate_failures do
      # a leading 0x00 byte decodes as field number 0, wire type 0
      expect { c.decode(StringIO.new("\x00".b), registry: nil) }
        .to raise_error(Protobug::DecodeError, /unexpected field number 0/)

      # field 5 (unknown), wire type 3 (group start) is an unsupported feature
      group_start = [(5 << 3) | 3].pack("C*")
      expect { c.decode(StringIO.new(group_start), registry: nil) }
        .to raise_error(Protobug::UnsupportedFeatureError, /group/)
    end
  end

  it "JSON-decodes URL-safe base64 bytes back to the raw binary value" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.JsonBytes"
      optional 1, :bytes, type: :bytes
    end

    # 0xfb,0xef,0xff -> standard base64 "++//" -> URL-safe alphabet "--__"
    decoded = c.decode_json(%({"bytes":"--__"}), registry: nil)
    aggregate_failures do
      expect(decoded.bytes).to eq("\xfb\xef\xff".b)
      expect(decoded.bytes.encoding).to eq(Encoding::BINARY)
    end
  end

  it "reports the input float when JSON-decoding a non-integral number into an integer field" do
    c = Class.new do
      extend Protobug::Message
      self.full_name = "test.JsonIntFloat"
      optional 1, :n, type: :int32
    end

    expect { c.decode_json(%({"n":1.5}), registry: nil) }
      .to raise_error(Protobug::DecodeError, /got 1\.5/)
  end
end
