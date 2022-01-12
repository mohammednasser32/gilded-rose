require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

require './consts/items'

class TestUntitled < Test::Unit::TestCase

  def test_100_days
    items = Array.new(ITEMS)
    file = File.open("truth.txt")  
    gilded_rose = GildedRose.new items
    true_data = file.readlines.map(&:chomp)
    (0...100).each do |day|
      day_data = true_data[day]
      items.each_with_index do |item, index|
        assert_equal ["Day: #{day}", item.name, item.sell_in, item.quality], eval(day_data)[index]
      end
      gilded_rose.update_quality
    end
  end

end