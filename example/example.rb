# frozen_string_literal: true

require "protobug_sigstore_protos"

ENV["MT_NO_PLUGINS"] = "1" # Work around autoloading of plugins

require "minitest/autorun"
require "json"

class TestExample < Minitest::Test
  make_my_diffs_pretty!

  def test_example
    registry = Protobug::Registry.new do |r|
      Sigstore::TrustRoot::V1.register_sigstore_trustroot_protos(r)
    end
    hash = JSON.parse File.read("tmp/sigstore-conformance/test/assets/trusted_root.public_good.json")
    trusted_root = Sigstore::TrustRoot::V1::TrustedRoot.decode_json_hash(hash, registry: registry)
    assert_equal(hash, JSON.parse(trusted_root.to_json.gsub(/(:\d\d)Z/, "\\1.000Z")))
  end
end
