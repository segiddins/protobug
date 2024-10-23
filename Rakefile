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
    sh "git", "clone", "--recursive", url, path
  end

  def checkout(_, _)
    return if correct_commit?

    sh "git", "-C", path, "switch", "--detach", commit do |ok, _|
      unless ok
        sh "git", "-C", path, "fetch", "origin", commit
        sh "git", "-C", path, "switch", "--detach", commit
      end
    end
    sh "git", "-C", path, "submodule", "update", "--init", "--recursive"
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
  attr_reader :patterns, :gemspec

  def initialize(*)
    super

    @patterns = {}
    @actions << method(:protoc!)
    @gemspec = Gem::Specification.new do |spec|
      spec.name = "protobug_#{name}"
      spec.version = Protobug::VERSION
      spec.authors = ["Samuel Giddins"]
      spec.email = ["segiddins@segiddins.me"]
      spec.licenses = ["Unlicense"]
      spec.homepage = "https://github.com/segiddins/protobug/blob/v#{spec.version}/gen/protobug_#{name}"

      spec.required_ruby_version = ">= 3.0.0"
      spec.metadata["rubygems_mfa_required"] = "true"
      spec.files += ["lib/protobug_#{name}.rb"]
      spec.require_paths = ["lib"]
      spec.add_runtime_dependency "protobug", Protobug::VERSION
    end
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
    end.max || Rake::LATE
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
    rescue Errno::ENOENT
      nil
    end.compact
  end

  def lib
    "gen/protobug_#{name}/lib"
  end

  def sig
    "gen/protobug_#{name}/sig"
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

multitask clone: []
def git_repo(name, path, url, commit: "main")
  task = GitRepo.define_task(name)
  task.path = path
  task.url = url
  task.commit = commit
  multitask clone: name
  task
end

task default: %i[spec verify_proto_gems example conformance rubocop]

git_repo :protobuf, "tmp/protobuf", "https://github.com/protocolbuffers/protobuf",
         commit: "9fff46d7327c699ef970769d5c9fd0e44df08fc7"
file "tmp/protobuf/.build/bin/conformance_test_runner" => "protobuf" do
  mkdir_p "tmp/protobuf/.build"
  sh "cmake", "..", "-DCMAKE_CXX_STANDARD=14", "-Dprotobuf_BUILD_CONFORMANCE=ON", "-Dprotobuf_BUILD_TESTS=OFF",
     "-Dprotobuf_BUILD_EXAMPLES=OFF", chdir: "tmp/protobuf/.build"
  sh "cmake", "--build", ".", "--target", "conformance_test_runner", "-j#{Etc.nprocessors}",
     chdir: "tmp/protobuf/.build"
end

git_repo :googleapis, "tmp/googleapis", "https://github.com/googleapis/googleapis",
         commit: "1e6517ef4f949191c9e471857cf5811c8abcab84"
git_repo :sigstore, "tmp/sigstore", "https://github.com/sigstore/protobuf-specs",
         commit: "59d84bd5e11aa12d1f7f96edaffd25d2386da34c"
git_repo :"sigstore-conformance", "tmp/sigstore-conformance", "https://github.com/sigstore/sigstore-conformance",
         commit: "v0.0.11"
git_repo :fulcio, "tmp/fulcio", "https://github.com/sigstore/fulcio",
         commit: "v1.6.4"
git_repo :grpc_gateway, "tmp/grpc-gateway", "https://github.com/grpc-ecosystem/grpc-gateway",
         commit: "v2.22.0"
git_repo :in_toto_attestation, "tmp/in-toto-attestation", "https://github.com/in-toto/attestation",
         commit: "v1.1.0"

multitask example: %w[sigstore sigstore-conformance sigstore_protos] do
  ruby "-rbundler/setup", "example/example.rb"
end

PROTOBUG_FILES = Gem::Specification.load("protobug.gemspec").files
PROTOBUG_COMPILER_FILES = Gem::Specification.load("protobug-compiler/protobug-compiler.gemspec").files.map do |f|
  File.join("protobug-compiler", f)
end

def proto_gem(name, source_repo, deps: [])
  desc "Build protobug_#{name}"
  task = ProtoGem.define_task(name)
  directory task.lib
  task.source_repo = Rake.application.lookup(source_repo)
  yield task
  task.gemspec.summary = "Compiled protos for protobug from #{task.source_repo&.url} (#{name})"
  task.gemspec.files += task.outputs.map { _1.sub(%r{^#{task.lib}/}, "lib/") }
  rb = File.join(task.lib, "protobug_#{name}.rb")
  file rb do |t|
    File.write(t.name, <<~RB)
      # frozen_string_literal: true

      require "protobug"

      #{task.outputs.map { %(require_relative #{_1.delete_prefix("#{task.lib}/").delete_suffix(".rb").dump}) }.sort.join("\n")}
    RB
  end
  gemspec = File.join(File.dirname(task.lib), "protobug_#{name}.gemspec")
  file gemspec => [rb, "Rakefile", "lib/protobug/version.rb"] do |t|
    task.prerequisite_tasks.grep(ProtoGem).each do |dep|
      task.gemspec.add_runtime_dependency "protobug_#{dep.name}", Protobug::VERSION
    end
    contents = task.gemspec.to_ruby.sub!(/^  s\.date\ =.+/, "")
    contents.sub!(/^  s.rubygems_version =.+/, "")
    File.write(t.name, contents)
  end
  task.inputs.each do |i|
    file i => source_repo
  end
  multitask name => [*PROTOBUG_FILES, *PROTOBUG_COMPILER_FILES, source_repo, task.lib, rb, gemspec, *task.inputs, *deps]
  namespace name do
    desc "Verify that #{name} has dependencies properly specified & is requireable"
    task verify: name do
      Bundler.with_unbundled_env do
        ruby "-e", <<~RB, verbose: false
          require "bundler/inline"
          gemfile do
            path ".", glob: "{,*,*/*,gen/*/*}.gemspec" do
            end
            gemspec path: "gen/protobug_#{name}"
          end
          require "protobug_#{name}"
        RB
        ruby "-S", "gem", "build", "--strict", File.basename(gemspec), chdir: "gen/protobug_#{name}"
        rm FileList["gen/protobug_#{name}/protobug_#{name}*.gem"]
      end
    end
  end
  multitask verify_proto_gems: "#{name}:verify"
  task
end

desc "Verify that proto gems are usable in isolation"
multitask :verify_proto_gems

proto_gem :well_known_protos, :protobuf, deps: [] do |task|
  task
    .base("src")
    .include("google/protobuf/*.proto")
    .exclude("google/protobuf/*test*")
    .exclude("google/protobuf/cpp_features.proto")
    .exclude("google/protobuf/sample_messages_edition.proto")

  task.outputs.each do |pb|
    well_known = pb.pathmap("%{_pb.rb$,_well_known.rb}p")
    next unless File.file?(well_known)
    next if pb.end_with?(".rbs")

    task.gemspec.files += [well_known.delete_prefix("gen/protobug_#{task.name}/")]

    task.enhance([well_known]) do |_t|
      File.open(pb, "a") do |f|
        f.write "\nrequire_relative #{well_known.pathmap("%n").dump}\n"
      end
    end
  end
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
proto_gem :googleapis_annotations_protos, :googleapis, deps: %i[well_known_protos] do |task|
  task.base(".")
      .include("google/api/{annotations,http}.proto")
end

proto_gem :sigstore_protos, :sigstore, deps: %i[well_known_protos googleapis_field_behavior_protos] do |task|
  task.base("protos")
      .include("*.proto")
end

proto_gem :protoc_gen_openapiv2_protos, :grpc_gateway,
          deps: %i[well_known_protos googleapis_field_behavior_protos] do |task|
  task.base(".")
      .include("protoc-gen-openapiv2/**/*.proto")
end

proto_gem :fulcio_protos, :fulcio,
          deps: %i[well_known_protos googleapis_field_behavior_protos googleapis_annotations_protos
                   protoc_gen_openapiv2_protos] do |task|
  task.base(".")
      .include("fulcio.proto")
end

proto_gem :in_toto_attestation_protos, :in_toto_attestation,
          deps: %i[well_known_protos] do |task|
  task.base("protos")
      .include("in_toto_attestation/**/*.proto")
end

multitask conformance: %w[conformance_protos tmp/protobuf/.build/bin/conformance_test_runner] do
  sh(
    "tmp/protobuf/.build/bin/conformance_test_runner",
    "--enforce_recommended",
    "--failure_list", "conformance/failure_list.txt",
    "--output_dir", "conformance",
    "conformance/runner.rb"
  )
end

directory "pkg"
task(:build).clear_actions
namespace(:release) { task(:rubygem_push).clear_actions }
Bundler.definition.specs.select { _1.name.start_with?("protobug") }.each do |spec|
  path = "pkg/#{spec.full_name}.gem"
  file path => [spec.loaded_from, :pkg] do
    Bundler.with_unbundled_env do
      sh("gem", "-C", File.dirname(spec.loaded_from), "build", "-o", File.expand_path(path), spec.loaded_from)
    end
  end
  multitask build: path
  CLEAN.include(path)

  namespace :release do # rubocop:disable Rake/DuplicateNamespace
    namespace :rubygem_push do
      task spec.name => path do # rubocop:disable Rake/Desc
        Bundler.with_unbundled_env do
          sh("gem", "push", path)
        end
      end
    end
    task rubygem_push: "rubygem_push:#{spec.name}" # rubocop:disable Rake/Desc,Rake/DuplicateTask
  end
end
