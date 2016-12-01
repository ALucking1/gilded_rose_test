require './gilded_rose'
require './item'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      item = [Item.new("foo", 0, 0)]
      GildedRose.new(item).update_quality
      expect(item[0].name).to eq "foo"
    end
  end

  context "sell in value" do
    it "drops by 1 each time update_value is run" do
      item = [Item.new("test", 10, 10)]
      GildedRose.new(item).update_quality
      expect(item[0].sell_in).to eq(9)
    end
  end

  context "quality value" do
    it "drops by 1 each time update_value is run" do
      item = [Item.new("test", 10, 10)]
      GildedRose.new(item).update_quality
      expect(item[0].quality).to eq(9)
    end
  end

  context "sell by date has passed" do
    it 'quality degrades twice as fast' do
      item = [Item.new("test", -1, 6)]
      GildedRose.new(item).update_quality
      expect(item[0].quality).to eq(4)
    end
  end

  context "quality of an item" do
    it "is never negative" do
      item = [Item.new("test", 5, 0)]
      GildedRose.new(item).update_quality
      expect(item[0].quality).to eq(0)
    end
  end

  context "Aged Brie" do
    it "increases as it gets older" do
      item = [Item.new("Aged Brie", 5, 50)]
      GildedRose.new(item).update_quality
      expect(item[0].quality).to eq(50)
    end
  end

  xcontext "quality of an item" do
    it "is never more than 50" do
      item = [Item.new("test", 10, 55)]
      GildedRose.new(item).update_quality
      expect(item[0].quality).to eq(50)
    end
  end

  context "Sulfuras" do
    it "never decreases in quality" do
      item = [Item.new("Sulfuras, Hand of Ragnaros", 0, 45)]
      GildedRose.new(item).update_quality
      expect(item[0].quality).to eq(45)
    end
  end

  context "backstages passes" do
    it "increases in quality by 2 when there are 10 days or less" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      GildedRose.new(item).update_quality
      expect(item[0].quality).to eq(12)
    end
  end

  context "backstages passes" do
    it "increases in quality by 3 when there are 5 days or less" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(item).update_quality()
      expect(item[0].quality).to eq(13)
    end
  end

  context "backstages passes" do
    it "increases in quality by 2 when there are 10 days or less" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(item).update_quality
      expect(item[0].quality).to eq(0)
    end
  end
end
