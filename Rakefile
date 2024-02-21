# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

def git_repo(name, path, url, commit: "main")
  namespace name do
    file "#{path}/.git/config" do
      sh "git", "clone", url, path, "--depth=1"
    end
    file "#{path}/.git/HEAD" => "#{path}/.git/config" do
      sh "git", "checkout", commit, chdir: path
    end
    file "#{path}/.git/rake-version" => %W[#{path}/.git/HEAD] do
      sh "git", "describe", "--tags", "--always", chdir: path,
                                                  out: "#{path}/.git/rake-version"
    end
    yield if block_given?
  end
end

task default: %i[spec rubocop]

file "rubby/generated.go" => FileList["genrubby/*.go"] do
  sh "go", "run", "./genrubby"
end

file "protoc-gen-protobug" => FileList["go.mod", "go.sum", "rubby/*.go", "cmd/**/*.go"] do
  sh "go", "build", "--tags=protolegacy", "./cmd/protoc-gen-protobug"
end

git_repo :protobuf, "tmp/protobuf", "https://github.com/protocolbuffers/protobuf" do
  file "tmp/protobuf/bazel-bin/conformance/conformance_test_runner" => "tmp/protobuf/.git/rake-version" do
    sh "bazel", "build", "//conformance:conformance_test_runner", chdir: "tmp/protobuf"
  end
end

git_repo :googleapis, "tmp/googleapis", "https://github.com/googleapis/googleapis", commit: "master"
git_repo :sigstore, "tmp/sigstore", "https://github.com/sigstore/protobuf-specs", commit: "master"

task example: %w[protoc-gen-protobug tmp/googleapis/.git/rake-version tmp/sigstore/.git/rake-version] do
  rm_rf FileList["example/*"] - ["example/example.rb"]
  example = "tmp/sigstore"
  sh(
    "bundle", "exec",
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("protoc-gen-protobug")}",
    "-I#{example}/protos/",
    "-Itmp/googleapis/",
    "--protobug_out=example",
    *FileList["#{example}/protos/*.proto"]
  )
  sh "ruby", "-Ilib:example", "example/example.rb"
end

task compiler: %w[protoc-gen-protobug tmp/protobuf/.git/rake-version] do
  protobuf = "tmp/protobuf"
  sh(
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("protoc-gen-protobug")}",
    "-Isrc",
    "--protobug_out=#{File.expand_path("lib/protobug/compiler")}",
    "src/google/protobuf/compiler/plugin.proto",
    chdir: protobuf
  )
end

task conformance: %w[protoc-gen-protobug tmp/protobuf/bazel-bin/conformance/conformance_test_runner] do
  protobuf = "tmp/protobuf"
  sh(
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("protoc-gen-protobug")}",
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
