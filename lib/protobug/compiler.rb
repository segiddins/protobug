require "syntax_tree"

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

    include SyntaxTree::DSL

    def initialize(request, response)
      @request = request
      @response = response
    end

    attr_reader :request, :response

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
      when Google::Protobuf::FileDescriptorProto
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

    def compile!
      response.supported_features |= Google::Protobuf::Compiler::CodeGeneratorResponse::Feature::FEATURE_PROTO3_OPTIONAL.value
      request.proto_file.each do |file|
        file_out = Google::Protobuf::Compiler::CodeGeneratorResponse::File.new
        file_out.name = file_name(file)
        file_out.content = file_contents(file)
        response.add_file(file_out)
      end
    end

    def file_contents(file)
      decls = Statements([
                           VoidStmt()
                         ])

      file.message_type.each do |msg|
        decls.body << Comment("# #{msg}", false)
      end

      requires = Statements(
        file.dependency.map do |dep|
          Command(
            Ident("require"),
            Args([
                   StringLiteral([
                                   TStringContent("#{dep}")
                                 ], '"')
                 ]), nil
          )
        end
      )

      mod = to_constant(file).split("::").reverse_each.reduce(decls) do |acc, elem|
        # ModuleDeclaration(ConstRef(Const(elem)),
        #                   BodyStmt(Statements([acc]), nil, nil, nil, nil))
        Module_(elem) { |stmts| stmts.body << acc }
      end
      program = Program(
        Statements([
                     Comment("# frozen_string_literal: true", false),
                     Statements([VoidStmt()]),
                     Comment("# syntax: #{file.syntax}", false),
                     requires,
                     mod
                   ])
      )

      SyntaxTree.format_node("", program)
    end

    def Module_(name, &blk)
      ModuleDeclaration(ConstRef(Const(name)), BodyStmt(Statements([]).tap(&blk), nil, nil, nil, nil))
    end

    # Indenter = Struct.new(:writer, :indent) do

    # end

    # Group = Struct.new(:name, :items, :open, :close, :separator, :multi, :indent) do
    #   def render(out)
    #     out.write(open) if open

    #     items.each_with_index do |item, i|
    #       item.render(out)
    #     end

    #     out.write(close) if close
    #   end

    #   def comment(comment)
    #     items << Comment.new(comment)
    #   end

    #   def empty
    #     items << Statement.new
    #   end

    #   def raw(*)
    #   end
    # end

    # Statement = Struct.new(:items) do
    #   def render(out)
    #     items&.each do |item|
    #       item.render(out)
    #     end
    #   end
    # end

    # class Comment < Statement
    #   def initialize(comment)
    #     @comment = comment
    #   end

    #   def render(out)
    #     out.write("# #{@comment}")
    #   end
    # end

    # class File < Group
    #   def initialize(format: false)
    #     super(
    #       nil,
    #       [],
    #       nil,
    #       nil,
    #       nil,
    #       true,
    #       ""
    #     )
    #   end
    # end
  end
end
