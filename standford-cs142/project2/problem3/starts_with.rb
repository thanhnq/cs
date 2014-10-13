#!/usr/bin/ruby -w
# coding: utf-8

def each_starts_with(a, s)
  pattern = /^#{s}/
  a.each do |x|
    if x =~ pattern
      yield x
    end
  end
end

array = ["abcd", "axyz", "able", "xyzab", "qrst"]
str = "ab"

each_starts_with(array, str) do |x|
  print "#{x}\n"
end
