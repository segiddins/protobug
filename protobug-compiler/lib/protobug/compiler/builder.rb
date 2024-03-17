# frozen_string_literal: true

require "delegate"
require "forwardable"
require "prettier_print"

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

        def op(operator)
          append Token.new(type: :operator, content: operator)
        end

        def render(q) # rubocop:disable Naming/MethodParameterName
          first = true
          prev = nil
          q.group do
            items.each do |item|
              next if item.empty?

              if !first && !item.compact? && !prev&.compact?
                if (item.is_a?(Token) && item.type == :operator) || (prev.is_a?(Token) && prev.type == :operator) ||
                   item.is_a?(Comment)
                  q.text " "
                elsif !(item.is_a?(Group) && item.name == :call) && !(item.is_a?(Group) && item.multi)
                  q.fill_breakable " "
                end
              end
              first = false unless item.compact? || prev&.compact?
              prev = item

              item.render(q)
            end
          end
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

        def op(operator)
          append Statement.new.op(operator)
        end

        def render(q) # rubocop:disable Naming/MethodParameterName
          if name == "block" && empty?
            q.breakable "; "
            q.text "end"
          end

          q.group do
            q.text open if open
            q.nest(indent || 0) do
              write_items(q)
            end
            return unless close

            multi ? q.breakable_force : q.breakable_empty
            q.text close
          end
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

        def write_items(q) # rubocop:disable Naming/MethodParameterName
          multi ? q.breakable_force : q.breakable_empty
          q.seplist(items.reject(&:empty?), lambda {
                                              if separator == "\n" || multi
                                                q.breakable_force
                                              elsif separator
                                                q.text separator.rstrip
                                                if separator.end_with?(" ")
                                                  q.breakable
                                                else
                                                  q.breakable_empty
                                                end
                                              end
                                            }, :each) do |item|
            item.render(q)
          end
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

        def render
          q = PrettierPrint.new(+"")
          @headers.each_with_index do |header, idx|
            q.breakable_force if idx.positive?
            Comment.new(header).render(q)
            q.breakable_force
          end
          super(q)
          q.trim
          q.breakable_force
          q.flush
          q.output
        end
      end

      Comment = Struct.new(:comment) do
        def render(q) # rubocop:disable Naming/MethodParameterName
          if comment.start_with?("#")
            q.text(comment)
          else
            prefixed = comment.start_with?(" ")

            q.group do
              q.break_parent
              q.seplist(
                comment.chomp.gsub(/^/m, prefixed ? "#" : "# ").tap do |s|
                  s.gsub!(/^#\s*$/m, "#")
                end.each_line(chomp: true),
                -> { q.breakable_empty }
              ) do |line|
                q.text line
              end
            end
          end
        end

        def empty? = false
        def compact? = false
      end

      Token = Struct.new(:type, :content,
                         keyword_init: true) do
        def render(q) # rubocop:disable Naming/MethodParameterName
          case type
          when :empty, :keyword, :identifier, :delimiter
            q.text content
          when :operator
            q.text content
          when :literal
            q.text content.inspect
          else
            raise "Unknown token type: #{type}"
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
