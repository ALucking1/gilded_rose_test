require_relative './item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality #using a proc(?), turn each item into own file and call the update quality method
    #in each file using only the part that relates to it. Then iterate over items in this file and call update_quality
    #it will then pertain to the item's own version of update_quality
    @items.each do |item|
      item.sell_in -= 1 if item.sell_in > 0

      case item.name
      when "Aged Brie"
        aged_brie(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        backstage_passes(item)
      when "Sulfuras, Hand of Ragnaros"
        sulfuras(item)
      else
        other_item(item)
      end

    end
  end


  def aged_brie(item)
    item.quality += 1 if item.quality < 50
  end

  def backstage_passes(item)
    if item.quality < 50
      if item.sell_in.between?(6, 10)
        item.quality += 2
      elsif item.sell_in.between?(1, 5)
        item.quality += 3
      else item.sell_in = 0
        item.quality = 0
      end
    end
  end

  def sulfuras(item)
    item.quality = item.quality if item.quality < 50
  end

  def other_item(item)
    if item.quality.between?(1, 50)
      item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
    end
  end

end
