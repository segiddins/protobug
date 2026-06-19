## [Unreleased]

## [0.2.0] - 2026-06-18

### Added

- New compiled proto gems: `protobug_fulcio_protos`, `protobug_googleapis_annotations_protos`,
  `protobug_in_toto_attestation_protos`, and `protobug_protoc_gen_openapiv2_protos`.
- Bump sigstore protobuf-specs to v0.5.1, adding `SigningConfig` v0.2 along with the
  `Service`, `ServiceSelector`, and `ServiceConfiguration` messages.
- Significantly expanded test coverage.

### Fixed

- Decode a truncated varint as an error (`EOFError`) instead of silently returning `nil`,
  and reject varints whose 10th byte overflows 64 bits.
- Encode fixed-width integers (`fixed64`/`sfixed64`/`sfixed32`) in little-endian order,
  correcting the binary wire format on big-endian hosts.
- Re-encode unknown fields of wire types 1 and 5 as raw bytes rather than varints.
- Raise a structured `InvalidValueError` on invalid boolean values.
- Accept decimal and exponent notation when parsing floats from JSON.

### Changed

- Generate message field accessors via `class_eval` rather than `define_method` closures.
- `Enum#==` returns `false` for unrecognized operand types instead of raising.

## [0.1.0] - 2024-02-21

- Initial release
