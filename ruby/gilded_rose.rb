require_relative './item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1 if item.sell_in > 0

      case item.name
      when "Aged Brie"
        item.quality += 1 if item.quality < 50
      when "Backstage passes to a TAFKAL80ETC concert"
        if item.quality < 50
          if item.sell_in.between?(6, 10)
            item.quality += 2
          elsif item.sell_in.between?(1, 5)
            item.quality += 3
          elsif item.sell_in = 0
            item.quality = 0
          end
        end
      when "Sulfuras, Hand of Ragnaros"
        item.quality = item.quality if item.quality < 50
      else
        if item.quality.between?(1, 50)
          item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
        end
      end

    end
  end

end
