class GildedRose

  ITEM_METHODS = {
    "Aged Brie" => "aged_brie_update",
    "Backstage passes to a TAFKAL80ETC concert" => "backstage_update",
    "Conjured Mana Cake" => "conjured_update"
  }

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"

      send(ITEM_METHODS.fetch(item.name, "normal_update"), item)
    end
  end


  def aged_brie_update(item)
    item.sell_in -= 1

    item.quality +=1
    item.quality +=1 if item.sell_in < 0
    item.quality = 50 if item.quality > 50
  end

  def backstage_update(item)
    item.sell_in -= 1
    return item.quality = 0 if item.sell_in < 0

    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
    item.quality = 50 if item.quality > 50
  end

  def conjured_update(item)
    normal_update(item, 2)
  end

  def normal_update(item, quality_speed_factor = 1)
    item.sell_in -= 1

    item.quality -= 1 * quality_speed_factor
    item.quality -= 1 * quality_speed_factor if item.sell_in < 0
    item.quality = 0 if item.quality < 0
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
