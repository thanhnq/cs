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

print "x = Adder.new(10)\n"
x = Adder.new(10)
print "y = Adder.new(1)\n"
y = Adder.new(1)

print "x.plus1\n"
puts x.plus1
print "y.plus1\n"
puts y.plus1
print "x.plus100\n"
puts x.plus100
print "y.add1\n"
puts y.add1

