require './gilded_rose'
require './item'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      item = [Item.new("foo", 0, 0)]
      GildedRose.new(item).update_quality()
      expect(item[0].name).to eq "foo"
    end
  end

  context "sell in value" do
    it "drops by 1 each time update_value is run" do
      item = [Item.new("test", 10, 10)]
      GildedRose.new(item).update_quality()
      expect(item[0].sell_in).to eq(9)
    end
  end

  context "quality value" do
    it "drops by 1 each time update_value is run" do
      item = [Item.new("test", 10, 10)]
      GildedRose.new(item).update_quality()
      expect(item[0].quality).to eq(9)
    end
  end



end
