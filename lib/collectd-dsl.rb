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

    def snake_to_camel method_name
      method_name.split("_").map{|w| w.capitalize }.join("")
    end

    def method_missing method_name, *args
      mapped_args = args.map do |a|
        if a.class == String 
          "\"" + a.to_s + "\""
        else
          a.to_s
        end
      end.join(" ")
        
      mapped_args = (" " + mapped_args) unless mapped_args.empty?

      camel_method_name = snake_to_camel method_name.to_s
      if block_given?
         @directives << indent("<#{camel_method_name}#{mapped_args}>")
        @indent += 1
        yield # rely on the outer scope
        @indent -= 1
        @directives << indent("</#{camel_method_name}>")
      else
        @directives << indent("#{camel_method_name}#{mapped_args}")
      end
    end
  end
end
