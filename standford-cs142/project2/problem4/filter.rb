#!/usr/bin/ruby -w
# coding: utf-8

def filter(a, h={})
  a.each do |x|
    tmp = x
    if h[:min] and x < h[:min] then tmp = nil end
    if h[:max] and x > h[:max] then tmp = nil end
    if h[:odd] and (x % 2 == 0) then tmp = nil end
    if h[:even] and (x % 2 != 0) then tmp = nil end
    if h[:scale] and tmp then tmp = tmp * h[:scale] end
    if tmp then yield tmp end
  end
  nil
end

puts "nums:"
nums = [6, -5, 319, 400, 18, 94, 11]
print "#{nums}\n"

puts
puts "filter(nums, :min => 10, :max => 350, :odd => 1, :scale => 2) {|n| puts n}"
filter(nums, :min => 10, :max => 350, :odd => 1, :scale => 2) {|n| puts n}

puts
puts "filter(nums, :max => 0) {|n| puts n}"
filter(nums, :max => 0) {|n| puts n}

puts
puts "filter(nums) { |x| puts x }"
filter(nums) { |x| puts x }
