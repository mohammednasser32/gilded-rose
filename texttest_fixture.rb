#!/usr/bin/ruby -w

require File.join(File.dirname(__FILE__), 'gilded_rose')
require './consts/items'

puts "OMGHAI!"
items = Array.new(ITEMS)

days = 2
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
