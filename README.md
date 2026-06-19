# Protobug

A protobuf runtime and compiler for Ruby, written in plain Ruby.

Most Ruby protobuf support leans on `google-protobuf`, which ships a C extension.
That's fine until you need to vendor protobuf code into a library and don't want
to drag a native dependency along with it. Protobug takes the other approach: the
runtime is pure Ruby with no dependencies, and the compiler emits ordinary `.rb`
files you can read, diff, and commit to your repo like any other source.

It was written to give [sigstore-ruby](https://github.com/sigstore/sigstore-ruby)
a protobuf implementation it could embed without forcing a native build on its
users, but there's nothing sigstore-specific about it.

## How it works

A `protoc` plugin (`protoc-gen-protobug`) reads your `.proto` files and writes
Ruby. The generated code is a thin DSL on top of `Protobug::Message` — each
message is a class that declares its fields, and a registry ties related messages
together for decoding. Field documentation from the `.proto` carries through as
comments. Here's what comes out the other end for `google.protobuf.Duration`:

```ruby
module Google
  module Protobuf
    class Duration
      extend Protobug::Message

      self.full_name = "google.protobuf.Duration"

      # Signed seconds of the span of time. Must be from -315,576,000,000
      # to +315,576,000,000 inclusive. Note: these bounds are computed from:
      # 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
      optional(1, "seconds", type: :int64, proto3_optional: false)
      # Signed fractions of a second at nanosecond resolution of the span
      # of time. Durations less than one second are represented with a 0
      # `seconds` field and a positive or negative `nanos` field. For durations
      # of one second or more, a non-zero value for the `nanos` field must be
      # of the same sign as the `seconds` field. Must be from -999,999,999
      # to +999,999,999 inclusive.
      optional(2, "nanos", type: :int32, proto3_optional: false)
    end

    def self.register_duration_protos(registry)
      registry.register(Google::Protobuf::Duration)
    end
  end
end
```

You can write that by hand too — the generator isn't doing anything you couldn't.

## Usage

Decoding needs a registry holding the message types that might show up (including
any referenced by `Any` fields). Register what you need, then encode and decode:

```ruby
registry = Protobug::Registry.new do |r|
  Sigstore::TrustRoot::V1.register_sigstore_trustroot_protos(r)
end

# from the wire format
trusted_root = Sigstore::TrustRoot::V1::TrustedRoot.decode(io_or_string, registry: registry)

# from a parsed JSON hash
trusted_root = Sigstore::TrustRoot::V1::TrustedRoot.decode_json_hash(hash, registry: registry)

# and back out
bytes = Sigstore::TrustRoot::V1::TrustedRoot.encode(trusted_root)
json  = trusted_root.to_json
```

Both proto2 and proto3 are supported, along with binary and JSON encodings.
Protobug runs the upstream protobuf conformance suite; the handful of cases it
doesn't pass yet are tracked in `conformance/failure_list.txt`.

## Installation

```sh
bundle add protobug
```

The runtime gem is all you need at runtime. To generate code, you also want the
compiler, which is a separate gem so it stays out of your production dependencies:

```sh
gem install protobug-compiler
```

Installing the gem puts a `protoc-gen-protobug` executable on your `PATH`, which
`protoc` discovers on its own, so generating code is just:

```sh
protoc --protobug_out=lib path/to/your.proto
```

## Development

Run `bin/setup` to install dependencies, then `rake spec` for the unit tests.
`rake` on its own runs the full suite: specs, the example, the protobuf
conformance runner, and rubocop. The generated protos under `gen/` are built from
the definitions wired up in the `Rakefile`; regenerating them needs `protoc`
installed.

`bin/console` drops you into an IRB session with the library loaded.

## Contributing

Bug reports and pull requests are welcome at
https://github.com/segiddins/protobug. Everyone interacting with the project is
expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## License

Available under the terms of the [MIT License](LICENSE.txt).
