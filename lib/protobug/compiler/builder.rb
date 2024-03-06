# frozen_string_literal: true

require "delegate"
require "forwardable"

module Protobug
  class Compiler
    module Builder
      def self.build_file
        builder = File.new
        if block_given?
          yield builder
          builder.render
        else
          builder
        end
      end

      class Statement
        attr_reader :items

        def initialize
          @items = []
        end

        def comment(text)
          append Comment.new(text)
        end

        def empty
          append Token.new(type: :empty, content: "")
        end

        def identifier(name)
          append Token.new(type: :identifier, content: name)
        end

        def literal(content)
          append Token.new(type: :literal, content: content)
        end

        def block(&blk)
          append Group.new(
            name: "block", items: [], close: "end", multi: true, indent: 2
          ).tap(&blk)
        end

        def dot(name)
          append(Token.new(type: :delimiter, content: ".")).identifier(name)
        end

        def op(op)
          append Token.new(type: :operator, content: op)
        end

        def render(out = +"")
          first = true
          prev = nil
          items.each do |item|
            next if item.empty?

            if !first && !item.compact? && !prev&.compact? && !(item.is_a?(Group) && item.name == :call) && !(item.is_a?(Group) && item.multi)
              out << " "
            end
            first = false
            prev = item

            item.render(out)
          end
          out
        end

        def append(item)
          items << item
          self
        end

        def empty?
          items.none? { |item| !item.empty? }
        end

        def compact? = false
      end

      Group = Struct.new(:name, :items, :open, :close, :separator, :multi, :indent,
                         keyword_init: true) do
        include Builder

        def comment(text)
          append Statement.new.comment(text)
        end

        def empty
          append Statement.new.empty
        end

        def block(&blk)
          append Statement.new.block(&blk)
        end

        def identifier(name)
          append Statement.new.identifier(name)
        end

        def literal(content)
          append Statement.new.literal(content)
        end

        def op(op)
          append Statement.new.op(op)
        end

        def render(out = +"")
          return out << "; end" if name == "block" && empty?

          out << open if open

          if indent
            sub = write_items.gsub!(/^/m, " " * indent)
            sub.gsub!(/^\s*$/m, "")
            out << sub
          else
            write_items(out)
          end

          out << "\n" if multi && close
          out << close if close
          out
        end

        def append(item)
          items << item
          item
        end

        def empty?
          return false if name != :call && (open || close)

          items.none? { |item| !item.empty? }
        end

        def compact? = false

        private

        def write_items(out = +"")
          first = true
          items.each do |item|
            next if item.empty?

            out << separator if separator && !first
            out << "\n" if multi
            item.render(out)
            first = false
          end
          out
        end
      end

      class File < DelegateClass(Group)
        def initialize
          @headers = []
          super Group.new(name: "file", items: [], multi: true)
        end

        def header_comment(text)
          @headers << text
        end

        def render(out = +"")
          @headers.each { |header| Comment.new(header).render(out) << "\n" } if @headers.any?
          super
          out << "\n"
        end
      end

      Comment = Struct.new(:comment) do
        def render(out = +"")
          out << if comment.start_with?("#")
                   comment
                 else
                   prefixed = comment.start_with?(" ")
                   comment.chomp.gsub(/^/m, prefixed ? "#" : "# ").tap { |s| s.gsub!(/^#\s*$/m, "#") }
                 end
        end

        def empty? = false
        def compact? = false
      end

      Token = Struct.new(:type, :content,
                         keyword_init: true) do
        def render(out = +"")
          case type
          when :empty
            out << content
          when :keyword
            out << content
          when :identifier
            out << content
          when :literal
            out << content.inspect
          when :delimiter
            out << content
          when :operator
            out << content
          end
        end

        def empty? = false

        def compact?
          case type
          when :operator
            %w[** .. ...].include?(content)
          when :delimiter
            content == "."
          end
        end
      end
    end
  end
end

require_relative "builder_gen"
