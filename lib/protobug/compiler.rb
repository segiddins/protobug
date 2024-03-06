require_relative "compiler/google/protobuf/descriptor.proto.pb"
require_relative "compiler/builder"

module Protobug
  class Compiler
    def self.compile!(request)
      response = Google::Protobuf::Compiler::CodeGeneratorResponse.new
      begin
        new(request, response).compile!
      rescue StandardError => e
        response.error = e.full_message
      end
      response
    end

    def initialize(request, response)
      @request = request
      @response = response
    end

    attr_reader :request, :response, :files

    def file_name(file)
      ruby_package = file.options.ruby_package if file.options.ruby_package?
      prefix = if ruby_package
                 ruby_package.split("::").map(&:downcase).join("/")
               else
                 file.package.split(".").map(&:downcase).join("/")
               end
      file.name.gsub(%r{^.*?([^/]+)\.proto$}, "#{prefix}/\\1.proto.pb.rb")
    end

    def module_name(file)
      return file.options.ruby_package if file.options.ruby_package?

      to_constant(file)
    end

    def to_constant(descriptor)
      case descriptor
      when FileDescriptorProto
        pkg = descriptor
      else
        raise "Unknown descriptor type: #{descriptor.class}"
      end
      ruby_package = pkg.options.ruby_package if pkg.options.ruby_package?
      parts =
        if ruby_package
          ruby_package.split("::")
        else
          prefix = pkg.package.split(".").map(&:capitalize)
        end

      insert = parts.size

      while false && descriptor.parent
        parts.insert(insert, descriptor.name)
        descriptor = descriptor.parent
      end

      parts.join("::")
    end

    class Files
      def initialize
        @descs_by_name = {}
        @files_by_path = {}
        @num_files = 0
      end

      def register_file(f)
        @files_by_path[f.name] = register_decl(f, nil, f)
      end

      def fetch(name)
        @files_by_path.fetch(name)
      end

      def fetch_type(name)
        @descs_by_name.fetch(name)
      end

      def register_decl(file, parent, decl)
        decl = Compiler.const_get(decl.class.name.split("::").last).new(decl, parent)
        @descs_by_name[decl.full_name] = decl

        Compiler.each_declaration(file, decl) do |d|
          register_decl(file, decl, d)
        end
        decl
      end
    end

    module Descriptor
      attr_reader :descriptor, :parent

      def initialize(descriptor, parent)
        @descriptor = descriptor
        @parent = parent
        super(descriptor)
      end

      def full_name
        if parent
          "#{parent.full_name}.#{descriptor.name}"
        else
          descriptor.package
        end
      end

      def file
        case descriptor
        when Google::Protobuf::FileDescriptorProto
          descriptor
        else
          parent.file
        end
      end
    end

    class FileDescriptorProto < DelegateClass(Google::Protobuf::FileDescriptorProto)
      include Descriptor

      def self.fields_by_number = Google::Protobuf::FileDescriptorProto.fields_by_number
    end

    class DescriptorProto < DelegateClass(Google::Protobuf::DescriptorProto)
      include Descriptor
    end

    class FieldDescriptorProto < DelegateClass(Google::Protobuf::FieldDescriptorProto)
      include Descriptor
    end

    class EnumDescriptorProto < DelegateClass(Google::Protobuf::EnumDescriptorProto)
      include Descriptor
    end

    class EnumValueDescriptorProto < DelegateClass(Google::Protobuf::EnumValueDescriptorProto)
      include Descriptor
    end

    def compile!
      response.supported_features |=
        Google::Protobuf::Compiler::CodeGeneratorResponse::Feature::FEATURE_PROTO3_OPTIONAL.value
      @files = Files.new

      request.proto_file.each do |file|
        files.register_file(file)
      end

      request.proto_file.each do |file|
        file = files.fetch(file.name)
        file_out = Google::Protobuf::Compiler::CodeGeneratorResponse::File.new
        file_out.name = file_name(file)
        file_out.content = file_contents(files, file)
        response.add_file(file_out)
      end
    end

    def emit_decls(file, descriptor, group)
      source_loc = source_loc(file, descriptor)
      return unless source_loc

      if file.equal? descriptor # TODO: enable this
        source_loc.leading_detached_comments.each do |c|
          group.comment(c)
          group.empty
        end
      end
      group.comment(source_loc.leading_comments) if source_loc.leading_comments?

      case descriptor
      when Google::Protobuf::DescriptorProto
        group._class.identifier(descriptor.name).block do |g|
          g.identifier("extend").identifier("Protobug::Message")
          g.empty
          g.identifier("self").dot("full_name").op("=")
           .literal([file.package, *each_parent(file, descriptor).map(&:name), descriptor.name].join("."))
          g.empty

          requires_empty = false
          each_declaration(file, descriptor) do |decl|
            g.empty if requires_empty
            requires_empty = !decl.is_a?(Google::Protobuf::FieldDescriptorProto)
            emit_decls(file, decl, g)
          end

          if descriptor.reserved_range.any? || descriptor.reserved_name.any?
            # g.empty # TODO: enable this
            descriptor.reserved_range.each do |range|
              g.identifier("reserved_range").call do |c|
                c.literal(range.start).op("...").literal(range.end)
              end
            end
            descriptor.reserved_name.each do |name|
              g.identifier("reserved_name").call do |c|
                c.literal(name)
              end
            end
          end
        end
      when Google::Protobuf::EnumDescriptorProto
        group._class.identifier(descriptor.name).block do |g|
          g.identifier("extend").identifier("Protobug::Enum")
          g.empty
          g.identifier("self").dot("full_name").op("=")
           .literal([file.package, *each_parent(file, descriptor).map(&:name), descriptor.name].join("."))
          g.empty

          each_declaration(file, descriptor) do |decl|
            emit_decls(file, decl, g)
          end

          if descriptor.reserved_range.any? || descriptor.reserved_name.any?
            # g.empty # TODO: enable this
            descriptor.reserved_range.each do |range|
              g.identifier("reserved_range").call do |c|
                c.literal(range.start).op("...").literal(range.end)
              end
            end
            descriptor.reserved_name.each do |name|
              g.identifier("reserved_name").call do |c|
                c.literal(name)
              end
            end
          end
        end
      when Google::Protobuf::EnumValueDescriptorProto
        group.identifier(descriptor.name).op("=").identifier("new").call do |c|
          c.literal(descriptor.name)
          c.literal(descriptor.number)
        end.dot("freeze") # rubocop:disable Style/MultilineBlockChain
      when Google::Protobuf::FieldDescriptorProto
        if descriptor.extendee?
          containing_type = files.fetch_type(descriptor.extendee.start_with?(".") ? descriptor.extendee[1..] : "#{descriptor.parent.full_name}.#{descriptor.extendee}")
          group.comment("extension: #{containing_type} #{descriptor.extendee} #{descriptor.name} #{descriptor.number}")
          return
        end

        type = descriptor.type.name.downcase.delete_prefix("type_").to_sym

        if descriptor.type_name?
          referenced_type = files.fetch_type(descriptor.type_name.delete_prefix("."))
          type = :map unless source_loc(referenced_type.file, referenced_type.descriptor)
        end

        group.identifier(
          case descriptor.label
          when Google::Protobuf::FieldDescriptorProto::Label::LABEL_OPTIONAL
            "optional"
          when Google::Protobuf::FieldDescriptorProto::Label::LABEL_REPEATED
            if type == :map
              "map"
            else
              "repeated"
            end
          when Google::Protobuf::FieldDescriptorProto::Label::LABEL_REQUIRED
            "required"
          end
        ).call do |c|
          c.literal(descriptor.number)
          c.literal(descriptor.name)
          c.identifier("type:").literal(type)

          if type == :map
            c.identifier("key_type:").literal(referenced_type.field[0].type.name.downcase.delete_prefix("type_").to_sym)
            c.identifier("value_type:").literal(referenced_type.field[1].type.name.downcase.delete_prefix("type_").to_sym)
          elsif descriptor.type_name?
            c.identifier("#{type}_type:").literal(descriptor.type_name.delete_prefix("."))
          end

          packed = descriptor.options&.packed
          if !descriptor.options&.packed? && !%i[enum message bytes string].include?(type) # TODO: exclude other types that cannot be packed
            packed = descriptor.label == Google::Protobuf::FieldDescriptorProto::Label::LABEL_REPEATED && file.syntax == "proto3"
          end
          c.identifier("packed:").literal(packed) if packed
          if descriptor.json_name? && descriptor.json_name != descriptor.name
            c.identifier("json_name:").literal(descriptor.json_name)
          end
          if descriptor.oneof_index?
            oneof = parent(file, descriptor).oneof_decl[descriptor.oneof_index]
            synthetic = descriptor.proto3_optional && parent(file, descriptor).field.count do
              _1.oneof_index? && _1.oneof_index == descriptor.oneof_index
            end == 1
            c.identifier("oneof:").literal(oneof.name.to_sym) unless synthetic
          end
        end
      else
        raise "Unknown descriptor type: #{descriptor.class}"
      end.tap do |s|
        # TODO: enable this
        # s.comment(source_loc.trailing_comments) if source_loc.trailing_comments?
      end
    end

    def file_contents(files, file) = Builder.build_file do |f|
      f.header_comment "# frozen_string_literal: true"
      f.header_comment "Code generated by protoc-gen-protobug. DO NOT EDIT."

      f.empty
      f.comment "source: #{file.name}"
      f.comment "syntax: #{file.syntax? ? file.syntax : "proto2"}"
      f.comment "package: #{file.package}"
      f.comment "options:"
      file.options.class.fields_by_name.each_key do |name|
        next unless file.options.send(:"#{name}?")

        value = case value = file.options.send(name)
                when Enum::InstanceMethods
                  value.name
                else
                  value.inspect
                end

        f.comment "   #{name}: #{value}"
      end

      source_loc(file, file).leading_detached_comments.each do |c|
        f.empty
        f.comment c
      end

      f.empty
      f.identifier("require").literal("protobug")

      if file.dependency.any?
        f.empty
        file.dependency.each do |dep|
          f.identifier("require").literal(file_name(files.fetch(dep)))
        end
      end

      f.empty

      g = f
      to_constant(file).split("::").each do |part|
        g._module.identifier(part).block { |g_| g = g_ }
      end

      first = true
      each_declaration(file, file) do |decl|
        g.empty unless first
        emit_decls(file, decl, g)
        first = false
      end

      g.empty unless first
      g._def.identifier("self")
       .dot("register_#{File.basename file.name.delete_suffix(".proto")}_protos")
       .call do |c|
        c.identifier("registry")
      end.block do |defn|
        file.dependency.each do |dep|
          defn.identifier(to_constant(files.fetch(dep))).dot("register_#{File.basename dep.delete_suffix(".proto")}_protos").call do |c|
            c.identifier("registry")
          end
        end
        emit_register(defn, file, file)
      end
    end

    def emit_register(defn, file, descriptor)
      case descriptor
      when Google::Protobuf::DescriptorProto, Google::Protobuf::EnumDescriptorProto
        return unless source_loc(file, descriptor)

        defn.identifier("registry").dot("register").call do |c|
          c.identifier([to_constant(file), *each_parent(file, descriptor).map(&:name), descriptor.name].join("::"))
        end
      when Google::Protobuf::FieldDescriptorProto
        return unless descriptor.extendee?

        containing_type = files.fetch_type(descriptor.extendee.start_with?(".") ? descriptor.extendee[1..] : "#{descriptor.parent.full_name}.#{descriptor.extendee}")
        defn.comment("extension: #{containing_type.full_name} #{descriptor.type} #{descriptor.number}")
      end
      each_declaration(file, descriptor) do |decl|
        emit_register(defn, file, decl)
      end
    end

    def self.each_declaration(file, parent, &blk)
      return enum_for(__method__, file, parent) unless block_given?

      decls = []

      case (parent.is_a?(Descriptor) ? parent.descriptor : parent)
      when Google::Protobuf::FileDescriptorProto
        decls.concat parent.message_type
        decls.concat parent.enum_type
        decls.concat parent.extension
        decls.concat parent.service
      when Google::Protobuf::DescriptorProto
        decls.concat parent.nested_type
        decls.concat parent.enum_type
        decls.concat parent.field
      when Google::Protobuf::EnumDescriptorProto
        decls.concat parent.value
      when Google::Protobuf::FieldDescriptorProto, Google::Protobuf::EnumValueDescriptorProto
        # nothing to do
      else
        raise "Unknown descriptor type: #{parent.is_a?(Descriptor) ? parent.descriptor.class : parent.class}"
      end

      # decls.sort_by do |d|
      #   source_loc(file,   d)&.span || []
      # end.each(&blk)
      decls.each(&blk)
    end

    def each_declaration(file, parent, &blk) = self.class.each_declaration(file, parent, &blk)

    def source_loc(file, descriptor)
      case descriptor
      when FileDescriptorProto
        return file.source_code_info.location[1]
      else
        # exhaustive search

        path = path_descend([], file, descriptor) ||
               raise("Failed to find path for #{descriptor.inspect} in #{file.name}")
      end

      file.source_code_info.location.find do |loc|
        loc.path == path
      end
    end

    def path_descend(path, object, target)
      return unless object
      return path if object.equal? target

      object.class.fields_by_number.each do |num, field|
        next unless field.type == :message

        if field.repeated?
          ary = object.send(field.name)
          ary.each_with_index do |v, idx|
            r = path_descend(path + [num, idx], v, target)
            return r if r
          end
        else
          r = path_descend(path + [num], object.send(field.name), target)
          return r if r
        end
      end
      nil
    end

    def parent(file, descriptor)
      each_parent(file, descriptor).to_a.last
    end

    def each_parent(file, descriptor)
      return enum_for(__method__, file, descriptor) unless block_given?

      path = path_descend([], file, descriptor) ||
             raise("Failed to find path for #{descriptor.inspect} in #{file.name}")
      path.pop

      path.reduce(file) do |acc, elem|
        case acc
        when Array
          acc[elem]
        else
          yield acc unless acc.equal? file
          acc.send(acc.class.fields_by_number[elem].name)
        end
      end
      nil
    end
  end
end
