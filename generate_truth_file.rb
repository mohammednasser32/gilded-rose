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
File.open("truth.txt", "w") do |f|
  (0...days).each do |day|
    data = []
    items.each do |item|
      data << ["Day: #{day}", item.name, item.sell_in, item.quality]
    end
    f.write("#{data.to_s}\n")
    gilded_rose.update_quality
  end
end
