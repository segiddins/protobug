# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

Dir["tasks/**/*.rake"].each { |file| load file }

RuboCop::RakeTask.new

def git_repo(name, path, url, commit: "main")
  namespace name do
    file "#{path}/.git/config" do
      sh "git", "clone", url, path, "--depth=1"
    end
    task checkout: %W[#{path}/.git/config] do
      sh "git", "fetch", "--tags", "origin", commit, chdir: path
      sh "git", "checkout", commit, chdir: path
    end
    file "#{path}/.git/rake-version" => %w[checkout] do
      sh "git", "describe", "--tags", "--always", chdir: path,
                                                  out: "#{path}/.git/rake-version"
    end
    yield if block_given?
  end
end

task default: %i[spec compiler example conformance rubocop]

git_repo :protobuf, "tmp/protobuf", "https://github.com/protocolbuffers/protobuf", commit: "v26.0" do
  file "tmp/protobuf/bazel-bin/conformance/conformance_test_runner" => "tmp/protobuf/.git/rake-version" do
    sh "bazel", "build", "//conformance:conformance_test_runner", chdir: "tmp/protobuf"
  end
end

git_repo :googleapis, "tmp/googleapis", "https://github.com/googleapis/googleapis",
         commit: "1e6517ef4f949191c9e471857cf5811c8abcab84"
git_repo :sigstore, "tmp/sigstore", "https://github.com/sigstore/protobuf-specs",
         commit: "a57a7caac5f4daf428055a34c872c810a6c0a968"
git_repo :"sigstore-conformance", "tmp/sigstore-conformance", "https://github.com/sigstore/sigstore-conformance",
         commit: "v0.0.11"

multitask example: %w[tmp/googleapis/.git/rake-version tmp/sigstore/.git/rake-version
                      tmp/sigstore-conformance/.git/rake-version compiler] do
  rm_rf FileList["example/*"] - ["example/example.rb"]
  example = "tmp/sigstore"
  sh(
    "bundle", "exec",
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("protobug-compiler/exe/protoc-gen-protobug")}",
    "-I#{example}/protos/",
    "-Itmp/googleapis/",
    "--protobug_out=example",
    *FileList["#{example}/protos/*.proto"]
  )
  sh "ruby", "-Ilib:example", "example/example.rb"
end

multitask compiler: %w[protobug-compiler/lib/protobug/compiler/builder_gen.rb tmp/protobuf/.git/rake-version] do
  protobuf = "tmp/protobuf"
  sh(
    "bundle", "exec",
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("protobug-compiler/exe/protoc-gen-protobug")}",
    "-Isrc",
    "--protobug_out=#{File.expand_path("protobug-compiler/lib/protobug/compiler")}",
    "src/google/protobuf/compiler/plugin.proto",
    chdir: protobuf
  )
end

multitask conformance: %w[compiler tmp/protobuf/bazel-bin/conformance/conformance_test_runner] do
  rm_rf FileList["conformance/{conformance,google,protobuf_test_messages}"]
  protobuf = "tmp/protobuf"
  sh(
    "bundle", "exec",
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("protobug-compiler/exe/protoc-gen-protobug")}",
    "-I.",
    "--protobug_opt=Mconformance/conformance.proto=example.com/example/project/protos/conformance",
    "--protobug_opt=Msrc/google/protobuf/test_messages_proto2.proto=example.com/example/project/protos/conformance",
    "--protobug_opt=Msrc/google/protobuf/test_messages_proto3.proto=example.com/example/project/protos/conformance",
    "--protobug_out=#{File.expand_path("conformance")}",
    "conformance/conformance.proto",
    *Dir["src/google/protobuf/test_messages*.proto", base: protobuf],
    chdir: protobuf
  )

  sh(
    File.join(protobuf, "bazel-bin/conformance/conformance_test_runner"),
    "--failure_list", "conformance/failure_list.txt",
    "--output_dir", "conformance",
    "conformance/runner.rb"
  )
end
