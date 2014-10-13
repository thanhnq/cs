#!/usr/bin/ruby -w
# coding: utf-8

class Numeric
  def squared
    Math.sqrt(self)
  end
end

puts 9.squared
puts 16.squared
