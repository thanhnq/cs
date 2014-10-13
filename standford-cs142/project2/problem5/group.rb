#!/usr/bin/ruby -w
# coding: utf-8

module Enumerable
  def each_group_by_first_letter
    h = {}
    self.each do |x|
      new = true
      h.each do |k, v|
        if x[0] == k then
          v << x
          new = false
          break  
        end
      end
      if new == true then 
        h[x[0]] = [x]
      end
    end
    h.each do |k, v|
      yield k, v
    end
  end
end

x = ["abcd", "axyz", "able", "xyzab", "qrst"]
print "x = #{x}\n"

x.each_group_by_first_letter do |letter, words|
  print "#{letter}: #{words.join(" ")}\n"
end
