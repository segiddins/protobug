# frozen_string_literal: true

module Protobug
  class Compiler
    module Builder
      class Statement
        def _class
          append Token.new(type: :keyword, content: "class")
        end

        def _def
          append Token.new(type: :keyword, content: "def")
        end

        def _do
          append Token.new(type: :keyword, content: "do")
        end

        def _module
          append Token.new(type: :keyword, content: "module")
        end

        def parens(item, &)
          append Group.new(
            name: :parens,
            items: [item],
            open: "(",
            close: ")",
            indent: 2
          ).tap(&)
        end

        def list(*items, &)
          append Group.new(name: :list, items:, separator: ",", indent: 2).tap(
            &
          )
        end

        def index(*items, &)
          append Group.new(
            name: :index,
            items:,
            open: "[",
            close: "]",
            separator: ","
          ).tap(&)
        end

        def call(*args, &)
          append Group.new(
            name: :call,
            items: args,
            open: "(",
            close: ")",
            separator: ", ",
            indent: 2
          ).tap(&)
        end
      end

      class Group
        def _class
          append Statement.new._class
        end

        def _def
          append Statement.new._def
        end

        def _do
          append Statement.new._do
        end

        def _module
          append Statement.new._module
        end
      end
    end
  end
end
