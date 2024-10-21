# frozen_string_literal: true

require "protobug_compiler_protos"

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

    class Files
      def initialize
        @descs_by_name = {}
        @files_by_path = {}
        @num_files = 0
      end

      def register_file(file)
        @files_by_path[file.name] = register_decl(FileDescriptorProto.new(file, nil, path: []))
      end

      def fetch(name)
        @files_by_path.fetch(name)
      end

      def fetch_type(name)
        @descs_by_name.fetch(name)
      end

      def register_decl(decl)
        raise ArgumentError, "parent must be a Descriptor" if decl.parent && !decl.parent.is_a?(Descriptor)

        unless decl.is_a?(FileDescriptorProto)
          raise "already registered: #{decl.full_name}" if @descs_by_name[decl.full_name]

          @descs_by_name[decl.full_name] = decl
        end

        decl.each_declaration do |d|
          register_decl(d)
        end
        decl
      end
    end

    module Descriptor
      attr_reader :descriptor, :parent, :file, :source_loc

      def initialize(descriptor, parent, path:)
        unless descriptor.is_a?(self.class.descriptor_class)
          raise ArgumentError,
                "#{descriptor.class} (#{descriptor}) is not #{self.class.descriptor_class}"
        end

        raise ArgumentError, "parent must be a Descriptor" if parent && !parent.is_a?(Descriptor)

        @descriptor = descriptor
        @parent = parent
        @file = parent&.file || self
        @path = path

        super(descriptor)

        @source_loc = if parent
                        file.source_code_info.location.find do |loc|
                          loc.path == path
                        end
                      else
                        source_code_info.location[1]
                      end
      end

      def full_name
        if parent
          "#{parent.full_name}.#{name}"
        else
          descriptor.package
        end
      end

      def to_constant
        if parent
          "#{parent.to_constant}::#{name}"
        else
          return file.options.ruby_package if file.options&.ruby_package?

          parts = descriptor.package.split(".")
          parts.map! do |part|
            part.split("_").map(&:capitalize).join
          end
          parts.join("::")
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
        base.class_eval do
          methods = []

          fields_by_name.each do |name, field|
            unless field.is_a?(Field::MessageField) &&
                   /\AGoogle::Protobuf::([^:]*Descriptor[^:]*)\z/ =~ field.message_class
              next
            end
            raise "expected #{self}.#{name} to be repeated" unless field.repeated?

            message_name = Regexp.last_match(1)

            methods << name

            define_method(name) do
              field_type = Compiler.const_get(message_name)
              __getobj__.send(name).map.with_index do |d, idx|
                field_type.new(d, self, path: @path + [field.number, idx])
              end
            end
          end

          define_method(:each_declaration) do |&blk|
            return enum_for(__method__) unless blk # rubocop:disable Lint/ToEnumArguments

            decls = methods.flat_map { send(_1) }
            decls.sort_by! { |d| d.source_loc&.span || [] }
            decls.each(&blk)
            nil
          end
        end
      end

      module ClassMethods
        def descriptor_class
          Google::Protobuf.const_get(name.split("::").last)
        end

        def fields_by_number
          descriptor_class.fields_by_number
        end

        def fields_by_name
          descriptor_class.fields_by_name
        end
      end
    end

    class FileDescriptorProto < DelegateClass(Google::Protobuf::FileDescriptorProto)
      include Descriptor

      def file_name
        ruby_package = options.ruby_package if options&.ruby_package?
        prefix = if ruby_package
                   ruby_package.split("::").map!(&:downcase).join("/")
                 else
                   package.split(".").map!(&:downcase).join("/")
                 end
        name.gsub(%r{^.*?([^/]+)\.proto$}, "#{prefix}/\\1_pb.rb")
      end

      def loc_by_path(path)
        source_code_info.location.find { |loc| loc.path == path }
      end

      attr_accessor :file_to_generate
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

      def to_constant
        const_name = name.start_with?("k") ? "K_#{name[1..]}" : name

        prefix = parent.name.gsub(/(?:(?<=([A-Za-z\d]))|\b)(?=\b|[^a-z])/) do
          "#{::Regexp.last_match(1) && "_"}#{::Regexp.last_match(2)}"
        end
        prefix.gsub!(/(?<=[A-Z])(?=[A-Z][a-z])|(?<=[a-z\d])(?=[A-Z])/, "_")
        prefix.upcase!

        const_name = const_name.delete_prefix(prefix) if const_name.match?(/\A#{Regexp.escape(prefix)}[A-Z]/)
        const_name = "K_#{const_name}" unless const_name.match?(/\A[A-Z]/)
        const_name
      end
    end

    class ServiceDescriptorProto < DelegateClass(Google::Protobuf::ServiceDescriptorProto)
      include Descriptor
    end

    class OneofDescriptorProto < DelegateClass(Google::Protobuf::OneofDescriptorProto)
      include Descriptor
    end

    class MethodDescriptorProto < DelegateClass(Google::Protobuf::MethodDescriptorProto)
      include Descriptor

      def ruby_method_name
        return name unless /[A-Z-]|::/.match?(name)

        word = name.gsub("::", "/")
        # word.gsub!(inflections.acronyms_underscore_regex) do
        #   "#{::Regexp.last_match(1) && "_"}#{::Regexp.last_match(2).downcase}"
        # end
        word.gsub!(/(?<=[A-Z])(?=[A-Z][a-z])|(?<=[a-z\d])(?=[A-Z])/, "_")
        word.tr!("-", "_")
        word.downcase!
        word
      end
    end

    def compile!
      response.supported_features |= Google::Protobuf::Compiler::CodeGeneratorResponse::Feature::PROTO3_OPTIONAL
      @files = Files.new

      request.proto_file.each do |file|
        files.register_file(file)
      end

      request.file_to_generate.each do |name|
        files.fetch(name).file_to_generate = true
      end

      request.file_to_generate.each do |name| # rubocop:disable Style/CombinableLoops
        file = files.fetch(name)
        file_out = Google::Protobuf::Compiler::CodeGeneratorResponse::File.new
        file_out.name = file.file_name
        file_out.content = file_contents(files, file)
        response.add_file(file_out)
      end
    end

    def emit_decls(descriptor, group)
      source_loc = descriptor.source_loc
      return unless source_loc

      source_loc.leading_detached_comments&.each do |c|
        group.comment(c)
        group.empty
      end

      group.comment(source_loc.leading_comments) if source_loc.leading_comments?

      case descriptor
      when DescriptorProto
        group._class.identifier(descriptor.name).block do |g|
          g.identifier("extend").identifier("Protobug::Message")
          g.empty
          g.identifier("self").dot("full_name").op("=").literal(descriptor.full_name)

          requires_empty = true
          descriptor.each_declaration do |decl|
            g.empty if requires_empty
            requires_empty = emit_decls(decl, g) &&
                             !decl.is_a?(FieldDescriptorProto) && !decl.is_a?(OneofDescriptorProto)
          end

          if descriptor.reserved_range.any? || descriptor.reserved_name.any?
            g.empty
            descriptor.file.loc_by_path(descriptor.source_loc.path +
                                        [DescriptorProto.fields_by_name.fetch("reserved_range").number])&.tap do |loc|
              g.comment(loc.leading_comments) if loc.leading_comments?
            end
            descriptor.reserved_range.each_with_index do |range, idx|
              descriptor.file.loc_by_path(descriptor.source_loc.path + [
                DescriptorProto.fields_by_name.fetch("reserved_range").number, idx
              ]).tap do |loc|
                g.comment(loc.leading_comments) if loc.leading_comments?
              end
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
      when EnumDescriptorProto
        group._module.identifier(descriptor.name).block do |g|
          g.identifier("extend").identifier("Protobug::Enum")
          g.empty
          g.identifier("self").dot("full_name").op("=")
           .literal(descriptor.full_name)
          g.empty

          descriptor.each_declaration do |decl|
            emit_decls(decl, g)
          end

          if descriptor.reserved_range.any? || descriptor.reserved_name.any?
            g.empty
            descriptor.reserved_range.each do |range|
              g.identifier("reserved_range").call do |c|
                c.literal(range.start).op("..").literal(range.end - 1)
              end
            end
            descriptor.reserved_name.each do |name|
              g.identifier("reserved_name").call do |c|
                c.literal(name)
              end
            end
          end
        end
      when EnumValueDescriptorProto
        group.identifier(descriptor.to_constant).op("=").identifier("register").call do |c|
          c.literal(descriptor.name)
          c.literal(descriptor.number)
        end
      when FieldDescriptorProto
        if descriptor.extendee?
          containing_type = files.fetch_type(
            if descriptor.extendee.start_with?(".")
              descriptor.extendee[1..]
            else
              "#{descriptor.parent.full_name}.#{descriptor.extendee}"
            end
          )
          group.comment("extension: #{containing_type.full_name}\n  #{descriptor.name} #{descriptor.number}")
          return # rubocop:disable Lint/NonLocalExitFromIterator
        end

        type = descriptor.type_case_name.downcase.delete_prefix!("type_").to_sym

        if descriptor.type_name?
          referenced_type = files.fetch_type(descriptor.type_name.delete_prefix("."))
          type = :map unless referenced_type.source_loc
        end

        group.identifier(
          case descriptor.label
          when Google::Protobuf::FieldDescriptorProto::Label::OPTIONAL
            "optional"
          when Google::Protobuf::FieldDescriptorProto::Label::REPEATED
            if type == :map
              "map"
            else
              "repeated"
            end
          when Google::Protobuf::FieldDescriptorProto::Label::REQUIRED
            "required"
          else
            raise "Unknown label: #{descriptor.label}"
          end
        ).call do |c|
          c.literal(descriptor.number)
          c.literal(descriptor.name)
          c.identifier("type:").literal(type) unless type == :map

          if type == :map
            raise unless referenced_type.field.count == 2

            c.identifier("key_type:")
             .literal(referenced_type.field[0].type_case_name.downcase.delete_prefix("type_").to_sym)
            value_type = referenced_type.field[1].type_case_name.downcase.delete_prefix("type_").to_sym
            c.identifier("value_type:")
             .literal(value_type)
            if referenced_type.field[1].type_name?
              nested_name = referenced_type.field[1].type_name.delete_prefix(".")
              c.identifier("#{value_type}_class:").literal(files.fetch_type(nested_name).to_constant)
            end
          elsif descriptor.type_name? && type != :group
            nested_name = descriptor.type_name.delete_prefix(".")
            c.identifier("#{type}_class:").literal(files.fetch_type(nested_name).to_constant)
          end

          packed = descriptor.options&.packed
          # TODO: exclude other types that cannot be packed
          if !descriptor.options&.packed? && !%i[message bytes string map].include?(type)
            packed = descriptor.label == Google::Protobuf::FieldDescriptorProto::Label::REPEATED &&
                     descriptor.file.syntax == "proto3"
          end
          c.identifier("packed:").literal(packed) if packed
          if descriptor.json_name? && descriptor.json_name != descriptor.name
            c.identifier("json_name:").literal(descriptor.json_name)
          end
          if descriptor.oneof_index?
            oneof = descriptor.parent.oneof_decl[descriptor.oneof_index]
            synthetic = descriptor.proto3_optional && (descriptor.parent.field.count do |f|
              f.oneof_index? && f.oneof_index == descriptor.oneof_index
            end == 1)
            c.identifier("oneof:").literal(oneof.name.to_sym) unless synthetic
          end
          if descriptor.label == Google::Protobuf::FieldDescriptorProto::Label::OPTIONAL &&
             descriptor.file.syntax == "proto3" && !descriptor.proto3_optional
            c.identifier("proto3_optional:").literal(false)
          end
          c.identifier("default:").literal(descriptor.default_value) if descriptor.default_value?
        end
      when OneofDescriptorProto
        group.empty if source_loc.leading_comments?
        # no-op
      when ServiceDescriptorProto
        group._class.identifier(descriptor.name).block do |g|
          requires_empty = false
          descriptor.each_declaration do |decl|
            g.empty if requires_empty
            requires_empty = true
            requires_empty = emit_decls(decl, g)
          end
        end
      when MethodDescriptorProto
        group._def.identifier(descriptor.ruby_method_name)
             .call do |c|
          c.identifier("...")
        end.block do |defn|
          defn.identifier("raise").call do |c|
            c.identifier("NotImplementedError")
          end
        end
      else
        raise "Unknown descriptor type: #{descriptor.class}"
      end.tap do |s|
        s.comment(source_loc.trailing_comments) if source_loc.trailing_comments?
      end
    end

    def file_contents(files, file)
      Builder.build_file do |f|
        f.header_comment "frozen_string_literal: true"
        f.header_comment "Code generated by protoc-gen-protobug. DO NOT EDIT."

        f.comment "source: #{file.name}"
        f.comment "syntax: #{file.syntax? ? file.syntax : "proto2"}"
        f.comment "package: #{file.package}"
        f.comment "options:"
        if file.options
          file.options.class.fields_by_name.each do |name, field|
            next unless file.options.send(:"#{name}?")

            value = file.options.send(name)
            if value.is_a?(Symbol)
              raise "Unknown symbol: #{value} for #{name} in #{file.options.inspect}"
            elsif field.is_a?(Field::EnumField)
              value = file.options.send(:"#{name}_case_name")
            else
              value = value.inspect
            end

            f.comment "   #{name}: #{value}"
          end
        end

        file.source_loc.leading_detached_comments.each do |c|
          f.empty
          f.comment c
        end

        f.empty
        f.identifier("require").literal("protobug")

        local, external = file.dependency.map do |dep|
          files.fetch(dep)
        end.partition(&:file_to_generate)
        if external.any?
          f.empty
          external.each do |dep|
            f.identifier("require").literal(dep.file_name.delete_suffix(".rb"))
          end
        end
        if local.any?
          f.empty
          local.each do |dep|
            relative_path = Pathname(dep.file_name.delete_suffix(".rb"))
                            .relative_path_from(Pathname(file.file_name).dirname)
                            .to_path
            f.identifier("require_relative").literal(relative_path)
          end
        end

        f.empty

        g = f
        file.to_constant.split("::").each do |part|
          g._module.identifier(part).block { |g_| g = g_ }
        end

        first = true
        file.each_declaration do |decl|
          g.empty unless first
          emit_decls(decl, g)
          first = false
        end
      end
    end
  end
end
