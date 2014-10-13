#!/usr/bin/ruby -w
# coding: utf-8

def funny_sort(a)
  hash = {}
  pattern = /\d+/
  a.each do |x|
    number = pattern.match(x)
    if number
      hash[number.to_s.to_i] = x
    else
      hash[-1] = x
    end
  end
  result = []
  hash.sort.each do |x|
    result << x[1]
  end
  result
end

a = ["this is the 100st string", "this is the -242.5nd string", "this is the 3rd string", "there is no number here"]
b = ["abc99.6", "-100x500", "no number"]
puts "Original array: "
print "#{b}\n"
puts "Sorted array: "
print "#{funny_sort(b)}\n"
