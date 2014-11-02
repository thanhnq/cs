#!/usr/bin/ruby -w
# coding: utf-8

class Adder
  def initialize(num)
    @num = num
  end
  
  attr_reader :num

  def method_missing(meth, *args, &block)
    if meth.to_s =~ /^plus\d+/
      inc = /\d+/.match(meth.to_s).to_s.to_i
      Adder.class_eval do
        #eval("def #{meth}; @num + #{inc}; end")
        define_method(meth) { @num + inc }
      end
      eval("self.#{meth}")
    else
      super
    end
  end
end
