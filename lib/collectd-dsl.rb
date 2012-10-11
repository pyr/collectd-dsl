module Collectd
  class DSL
    VERSION = "0.3.0"

    def initialize(&block)
      @directives = []
      @indent = 0
      instance_eval(&block) if block_given?
    end

    def dump
      @directives.join("\n") + "\n"
    end

    def self.parse(&block)
      DSL.new(&block).dump if block_given?
    end

    def indent str
      ("\t" * @indent) + str
    end

    def method_missing method_name, *args
      mapped_args = args.map{|a| a.to_s}.join(" ")
      mapped_args = (" " + mapped_args) unless mapped_args.empty?

      if block_given?
        @directives << indent("<#{method_name.to_s}#{mapped_args}>")
        @indent += 1
        yield # rely on the outer scope
        @indent -= 1
        @directives << indent("</#{method_name.to_s}>")
      else
        @directives << indent("#{method_name.to_s}#{mapped_args}")
      end
    end
  end
end
