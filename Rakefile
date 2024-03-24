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

  def timestamp
    File.mtime(path)
  rescue Errno::ENOENT
    Time.now
  end
end

require "delegate"

class BaseFileList < DelegateClass(Rake::FileList)
  attr_reader :base

  def initialize(base)
    @base = base
    nil while base.delete_suffix!("/.")
    super(FileList[])
  end

  def include(*filenames)
    super(*_apply_base!(filenames))
    self
  end

  def exclude(*filenames)
    super(*_apply_base!(filenames))
    self
  end

  private

  def _apply_base!(ary)
    ary.map! { File.join(@base, _1) }
  end
end

class ProtoGem < Rake::FileTask
  include FileUtils

  attr_accessor :source_repo
  attr_reader :patterns

  def initialize(*)
    super

    @patterns = {}
    @actions << method(:protoc!)
  end

  def needed?
    outputs.any? { out_of_date?(File.mtime(_1)) } || @application.options.build_all
  rescue Errno::ENOENT
    warn $!
    true
  end

  def timestamp
    outputs.map do |name|
      File.mtime(name)
    rescue Errno::ENOENT
      Rake::LATE
    end.max
  end

  def base(path)
    @patterns[path] ||= BaseFileList.new(File.join(source_repo.path, path))
  end

  def inputs
    @patterns.flat_map do |_, list|
      list
    end
  end

  def outputs
    inputs.map do |proto|
      contents = File.read(proto)
      ruby_package = contents[/^\s*option\s+ruby_package\s*=\s*"(.+)"\s*;$/, 1]
      package = if ruby_package
                  ruby_package.split("::").map!(&:downcase).join(".")
                else
                  contents[/^\s*package (.+);\s*$/, 1]
                end
      raise "No package in #{proto}" unless package

      package.tr!(".", "/")
      proto.pathmap("#{File.join(lib, package)}/%n_pb.rb")
    end
  end

  def lib
    "gen/protobug_#{name}/lib"
  end

  def includes
    @patterns.map { |_, v| "-I#{v.base}" }
  end

  def all_includes
    includes + all_prerequisite_tasks.grep(self.class).flat_map(&:includes).uniq
  end

  def protoc!(_, _)
    sh(
      "protoc",
      "--plugin=protoc-gen-protobug=bin/protoc-gen-protobug",
      *all_includes,
      "--protobug_out=#{lib}",
      *inputs
    )
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

def proto_gem(name, source_repo, deps: [])
  task = ProtoGem.define_task(name)
  directory task.lib
  task.source_repo = Rake.application.lookup(source_repo)
  yield task
  rb = File.join(task.lib, "protobug_#{name}.rb")
  file rb do |t|
    File.write(t.name, <<~RB)
      # frozen_string_literal: true

      require "protobug"

      #{task.outputs.map { %(require_relative #{_1.delete_prefix("#{task.lib}/").delete_suffix(".rb").dump}) }.sort.join("\n")}
    RB
  end
  gemspec = File.join(File.dirname(task.lib), "protobug_#{name}.gemspec")
  file gemspec => rb do |t|
    File.write(t.name, Gem::Specification.new do |spec|
      spec.name = "protobug_#{name}"
      spec.version = Protobug::VERSION
      spec.authors = ["Samuel Giddins"]
      spec.email = ["segiddins@segiddins.me"]

      spec.summary = "Compiled protos for protobug from #{task.source_repo.url} (#{name})"
      spec.required_ruby_version = ">= 3.0.0"
      spec.metadata["rubygems_mfa_required"] = "true"
      spec.files = task.outputs.map { _1.sub(%r{^#{task.lib}/}, "") } << "lib/protobug_#{name}.rb"
      spec.require_paths = ["lib"]
      spec.add_runtime_dependency "protobug"
      task.prerequisite_tasks.grep(task.class).each { spec.add_runtime_dependency "protobug_#{_1.name}" }
    end.to_ruby)
  end
  multitask name => [source_repo, task.lib, rb, gemspec, *task.inputs, *deps]
  task
end

proto_gem :well_known_protos, :protobuf, deps: [] do |task|
  task
    .base("src")
    .include("google/protobuf/*.proto")
    .exclude("google/protobuf/*test*")
    .exclude("google/protobuf/cpp_features.proto")
end

proto_gem :compiler_protos, :protobuf, deps: %i[well_known_protos] do |task|
  task
    .base("src")
    .include("google/protobuf/compiler/plugin.proto")
end

proto_gem :conformance_protos, :protobuf, deps: %i[well_known_protos] do |task|
  task.base("conformance")
      .include("conformance.proto")
  task.base("src")
      .include("google/protobuf/test_messages*.proto")
end

proto_gem :googleapis_field_behavior_protos, :googleapis, deps: %i[well_known_protos] do |task|
  task.base(".")
      .include("google/api/field_behavior.proto")
end

proto_gem :sigstore_protos, :sigstore, deps: %i[well_known_protos googleapis_field_behavior_protos] do |task|
  task.base("protos")
      .include("*.proto")
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
