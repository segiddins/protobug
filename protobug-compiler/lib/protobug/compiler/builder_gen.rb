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

        def _module
          append Token.new(type: :keyword, content: "module")
        end

        def parens(item, &blk)
          append Group.new(
            name: :parens,
            items: [item],
            open: "(",
            close: ")",
            indent: 2
          ).tap(&blk)
        end

        def list(*items, &blk)
          append Group.new(
            name: :list,
            items: items,
            separator: ",",
            indent: 2
          ).tap(&blk)
        end

        def index(*items, &blk)
          append Group.new(
            name: :index,
            items: items,
            open: "[",
            close: "]",
            separator: ","
          ).tap(&blk)
        end

        def call(*args, &blk)
          append Group.new(
            name: :call,
            items: args,
            open: "(",
            close: ")",
            separator: ", ",
            indent: 2
          ).tap(&blk)
        end
      end

      class Group
        def _class
          append Statement.new._class
        end

        def _def
          append Statement.new._def
        end

        def _module
          append Statement.new._module
        end
      end
    end
  end
end
