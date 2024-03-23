# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

Dir["tasks/**/*.rake"].each { |file| load file }

RuboCop::RakeTask.new

require "open3"

class GitRepo < Rake::Task
  attr_accessor :path, :url, :commit

  include FileUtils

  def initialize(*)
    super

    @actions << method(:clone_repo)
    @actions << method(:checkout)
  end

  def needed?
    !correct_remote? || !correct_commit?
  end

  def correct_remote?
    return false unless File.directory?(@path)

    out, status = Open3.capture2(*%w[git remote get-url origin], chdir: path)
    status.success? && out.strip == url
  end

  def correct_commit?
    head, status = Open3.capture2(*%w[git rev-parse HEAD], chdir: path)
    head.strip!
    return true if status.success? && head == commit

    desired, status = Open3.capture2(*%w[git rev-parse], "#{commit}^{commit}", chdir: path)
    desired.strip!
    status.success? && desired == head
  end

  def clone_repo(_, _)
    return if correct_remote?

    rm_rf path
    sh "git", "clone", url, path
  end

  def checkout(_, _)
    return if correct_commit?

    sh "git", "-C", path, "switch", "--detach", commit do |ok, _|
      unless ok
        sh "git", "-C", path, "fetch", "origin", commit
        sh "git", "-C", path, "switch", "--detach", commit
      end
    end
  end
end

def git_repo(name, path, url, commit: "main")
  task = GitRepo.define_task(name)
  task.path = path
  task.url = url
  task.commit = commit
  task
end

task default: %i[spec example conformance rubocop]

git_repo :protobuf, "tmp/protobuf", "https://github.com/protocolbuffers/protobuf", commit: "refs/tags/v26.0"
file "tmp/protobuf/bazel-bin/conformance/conformance_test_runner" => "protobuf" do
  sh "bazel", "build", "//conformance:conformance_test_runner", chdir: "tmp/protobuf"
end

git_repo :googleapis, "tmp/googleapis", "https://github.com/googleapis/googleapis",
         commit: "1e6517ef4f949191c9e471857cf5811c8abcab84"
git_repo :sigstore, "tmp/sigstore", "https://github.com/sigstore/protobuf-specs",
         commit: "a57a7caac5f4daf428055a34c872c810a6c0a968"
git_repo :"sigstore-conformance", "tmp/sigstore-conformance", "https://github.com/sigstore/sigstore-conformance",
         commit: "v0.0.11"

multitask example: %w[sigstore sigstore-conformance sigstore_protos compiler_protos googleapis_field_behavior_protos] do
  sh "ruby", "example/example.rb"
end

directory "gen/protobug_well_known_protos/lib"
multitask well_known_protos: %w[protobuf] do
  protobuf = "tmp/protobuf"
  proto_files = FileList["#{protobuf}/src/google/protobuf/*.proto"] -
                FileList["#{protobuf}/src/google/protobuf/*test*"] -
                FileList["#{protobuf}/src/google/protobuf/cpp_features.proto"]
  sh(
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("bin/protoc-gen-protobug")}",
    "-I#{protobuf}/src",
    "--protobug_out=gen/protobug_well_known_protos/lib",
    *proto_files
  )
end

directory "gen/protobug_compiler_protos/lib"
multitask compiler_protos: %w[well_known_protos protobuf gen/protobug_compiler_protos/lib] do
  protobuf = "tmp/protobuf"
  sh(
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("bin/protoc-gen-protobug")}",
    "-I#{protobuf}/src",
    "--protobug_out=gen/protobug_compiler_protos/lib",
    "#{protobuf}/src/google/protobuf/compiler/plugin.proto"
  )
end

directory "gen/protobug_conformance_protos/lib"
multitask conformance_protos: %w[compiler_protos protobuf gen/protobug_conformance_protos/lib] do
  protobuf = "tmp/protobuf"
  sh(
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("bin/protoc-gen-protobug")}",
    "-I#{protobuf}/src",
    "-I#{protobuf}/conformance",
    "--protobug_out=gen/protobug_conformance_protos/lib",
    "#{protobuf}/conformance/conformance.proto",
    *FileList["#{protobuf}/src/google/protobuf/test_messages*.proto"]
  )
end

directory "gen/protobug_googleapis_field_behavior_protos/lib"
multitask googleapis_field_behavior_protos: %w[compiler_protos protobuf googleapis
                                               gen/protobug_googleapis_field_behavior_protos/lib] do
  protobuf = "tmp/protobuf"
  sh(
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("bin/protoc-gen-protobug")}",
    "-I#{protobuf}/src",
    "-Itmp/googleapis",
    "--protobug_out=gen/protobug_googleapis_field_behavior_protos/lib",
    *FileList["tmp/googleapis/google/api/field_behavior.proto"]
  )
end

directory "gen/protobug_sigstore_protos/lib"
multitask sigstore_protos: %w[compiler_protos protobuf sigstore
                              gen/protobug_sigstore_protos/lib] do
  protobuf = "tmp/protobuf"
  sh(
    "protoc",
    "--plugin=protoc-gen-protobug=#{File.expand_path("bin/protoc-gen-protobug")}",
    "-I#{protobuf}/src",
    "-Itmp/googleapis",
    "-Itmp/sigstore/protos",
    "--protobug_out=gen/protobug_sigstore_protos/lib",
    *FileList["tmp/sigstore/protos/*.proto"]
  )
end

multitask conformance: %w[conformance_protos tmp/protobuf/bazel-bin/conformance/conformance_test_runner] do
  sh(
    "tmp/protobuf/bazel-bin/conformance/conformance_test_runner",
    "--enforce_recommended",
    "--failure_list", "conformance/failure_list.txt",
    "--output_dir", "conformance",
    "conformance/runner.rb"
  )
end
