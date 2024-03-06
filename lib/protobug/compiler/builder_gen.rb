# frozen_string_literal: true

module Protobug
  class Compiler
    module Builder
      class Statement
        def _alias
          append Token.new(type: :keyword, content: "alias")
        end

        def _and
          append Token.new(type: :keyword, content: "and")
        end

        def _begin
          append Token.new(type: :keyword, content: "begin")
        end

        def _break
          append Token.new(type: :keyword, content: "break")
        end

        def _case
          append Token.new(type: :keyword, content: "case")
        end

        def _class
          append Token.new(type: :keyword, content: "class")
        end

        def _def
          append Token.new(type: :keyword, content: "def")
        end

        def _defined?
          append Token.new(type: :keyword, content: "defined?")
        end

        def _do
          append Token.new(type: :keyword, content: "do")
        end

        def _else
          append Token.new(type: :keyword, content: "else")
        end

        def _elsif
          append Token.new(type: :keyword, content: "elsif")
        end

        def _end
          append Token.new(type: :keyword, content: "end")
        end

        def _ensure
          append Token.new(type: :keyword, content: "ensure")
        end

        def _false
          append Token.new(type: :keyword, content: "false")
        end

        def _for
          append Token.new(type: :keyword, content: "for")
        end

        def _if
          append Token.new(type: :keyword, content: "if")
        end

        def _in
          append Token.new(type: :keyword, content: "in")
        end

        def _module
          append Token.new(type: :keyword, content: "module")
        end

        def _next
          append Token.new(type: :keyword, content: "next")
        end

        def _not
          append Token.new(type: :keyword, content: "not")
        end

        def _or
          append Token.new(type: :keyword, content: "or")
        end

        def _rescue
          append Token.new(type: :keyword, content: "rescue")
        end

        def _retry
          append Token.new(type: :keyword, content: "retry")
        end

        def _return
          append Token.new(type: :keyword, content: "return")
        end

        def _then
          append Token.new(type: :keyword, content: "then")
        end

        def _true
          append Token.new(type: :keyword, content: "true")
        end

        def _until
          append Token.new(type: :keyword, content: "until")
        end

        def _when
          append Token.new(type: :keyword, content: "when")
        end

        def _while
          append Token.new(type: :keyword, content: "while")
        end

        def _yield
          append Token.new(type: :keyword, content: "yield")
        end

        def parens(item, &blk)
          append Group.new(name: :parens, items: [item], open: "(", close: ")").tap(&blk)
        end

        def list(*items, &blk)
          append Group.new(name: :list, items: items, separator: ",").tap(&blk)
        end

        def index(*items, &blk)
          append Group.new(name: :index, items: items, open: "[", close: "]", separator: ",").tap(&blk)
        end

        def call(*args, &blk)
          append Group.new(name: :call, items: args, open: "(", close: ")", separator: ", ").tap(&blk)
        end
      end

      class Group
        def _alias
          append Statement.new._alias
        end

        def _and
          append Statement.new._and
        end

        def _begin
          append Statement.new._begin
        end

        def _break
          append Statement.new._break
        end

        def _case
          append Statement.new._case
        end

        def _class
          append Statement.new._class
        end

        def _def
          append Statement.new._def
        end

        def _defined?
          append Statement.new._defined?
        end

        def _do
          append Statement.new._do
        end

        def _else
          append Statement.new._else
        end

        def _elsif
          append Statement.new._elsif
        end

        def _end
          append Statement.new._end
        end

        def _ensure
          append Statement.new._ensure
        end

        def _false
          append Statement.new._false
        end

        def _for
          append Statement.new._for
        end

        def _if
          append Statement.new._if
        end

        def _in
          append Statement.new._in
        end

        def _module
          append Statement.new._module
        end

        def _next
          append Statement.new._next
        end

        def _not
          append Statement.new._not
        end

        def _or
          append Statement.new._or
        end

        def _rescue
          append Statement.new._rescue
        end

        def _retry
          append Statement.new._retry
        end

        def _return
          append Statement.new._return
        end

        def _then
          append Statement.new._then
        end

        def _true
          append Statement.new._true
        end

        def _until
          append Statement.new._until
        end

        def _when
          append Statement.new._when
        end

        def _while
          append Statement.new._while
        end

        def _yield
          append Statement.new._yield
        end
      end
    end
  end
end
