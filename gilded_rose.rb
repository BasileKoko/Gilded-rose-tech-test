class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Sulfuras"
        item.quality = 80
        item.sell_in = item.sell_in
      end

      if item.name == "Aged Brie"
        item.sell_in = item.sell_in - 1
          if item.quality < 50
            item.quality = item.quality + 1
          elsif item.quality  > 50
            item.quality = item.quality # you should not cap it, return what is given
          end
      end

      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in <= 0
          item.quality = 0
        elsif item.sell_in < 6 && item.quality < 48
          item.quality = item.quality + 3
        elsif item.sell_in < 11 && item.quality < 49
          item.quality = item.quality + 2
        elsif item.sell_in > 10 && item.quality < 50
          item.quality = item.quality + 1
        else
          item.quality = item.quality
        end
        item.sell_in = item.sell_in - 1

      end

     end
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
