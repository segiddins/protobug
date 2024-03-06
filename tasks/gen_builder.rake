namespace :compiler do
  file "lib/protobug/compiler/builder_gen.rb" => FileList["lib/protobug/compiler/*.rb"].include(__FILE__).exclude("lib/protobug/compiler/builder_gen.rb") do
    keywords = %w[
      alias
      and
      begin
      break
      case
      class
      def
      defined?
      do
      else
      elsif
      end
      ensure
      false
      for
      if
      in
      module
      next
      not
      or
      rescue
      retry
      return
      then
      true
      until
      when
      while
      yield
    ].freeze

    groups = {
      parens: { open: "(", close: ")", parameters: %w[item] },
      list: { variadic: true, separator: ",", parameters: %w[items] },
      index: { variadic: true, open: "[", close: "]", separator: ",", parameters: %w[items] },
      call: { variadic: true, open: "(", close: ")", separator: ", ", parameters: %w[args] }
    }.freeze

    require_relative "../lib/protobug/compiler/builder"

    contents = Protobug::Compiler::Builder.build_file do |f|
      f.header_comment "# frozen_string_literal: true"

      f._module.identifier("Protobug").block do |mod|
        mod._class.identifier("Compiler").block do |mod|
          mod._module.identifier("Builder").block do |mod|
            mod._class.identifier("Statement").block do |cls|
              first = true
              keywords.each do |keyword|
                cls.empty unless first
                cls._def.identifier("_#{keyword}").block do |defn|
                  defn.identifier("append").identifier("Token").dot("new").call do |s|
                    s.identifier("type:").literal(:keyword)
                    s.identifier("content:").literal(keyword)
                  end
                end
                first = false
              end

              groups.each do |name, group|
                cls.empty unless first
                parameters = group.fetch(:parameters, [])
                raise "Variadic groups must have a single parameter" if group[:variadic] && parameters.size != 1

                cls._def.identifier(name.to_s).call do |c|
                  parameters.each do |param|
                    param = "*#{param}" if group[:variadic]
                    c.identifier(param)
                    c.identifier("&blk")
                  end
                end.block do |defn|
                  defn.identifier("append").identifier("Group").dot("new").call do |s|
                    s.identifier("name:").literal(name)
                    s.identifier("items:").tap do |items|
                      if parameters.empty?
                        items.literal([])
                      elsif group[:variadic]
                        items.identifier(parameters.first)
                      else
                        items.index do |index|
                          parameters.each do |param|
                            index.identifier(param)
                          end
                        end
                      end
                    end
                    group.each do |key, value|
                      next if %i[parameters variadic].include?(key)

                      s.identifier("#{key}:").literal(value)
                    end
                  end.dot("tap").call { |c| c.identifier("&blk") }
                end
                first = false
              end
            end
            mod.empty
            mod._class.identifier("Group").block do |cls|
              first = true
              keywords.each do |keyword|
                cls.empty unless first
                cls._def.identifier("_#{keyword}").block do |defn|
                  defn.identifier("append").identifier("Statement").dot("new").dot("_#{keyword}").call {}
                end
                first = false
              end
            end
          end
        end
      end
    end

    File.write("lib/protobug/compiler/builder_gen.rb", contents) if eval(contents.sub("module Protobug",
                                                                                      "module Protobug2"))
  end
end
