require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do

    context "Sulfuras" do
      before do
        @items = [Item.new("Sulfuras", 5, 90)]
        GildedRose.new(@items).update_quality()
      end
      it "quality value should remain 80" do
        expect(@items[0].quality).to eq 80
      end
      it "sell_in should decrease" do
        expect(@items[0].sell_in).to eq 4
      end
    end

    context "Aged Brie" do
      before do
        @items = [Item.new("Aged Brie", 10, 25)]
        GildedRose.new(@items).update_quality()
        @items1 = [Item.new("Aged Brie", 12, 55)]
        GildedRose.new(@items1).update_quality()
      end
      it "quality should increase if quality is less than 50" do
        expect(@items[0].quality).to eq 26
      end
      it "should not change quality if it is greater than 50" do
        expect(@items1[0].quality).to eq 55
      end
      it "sell_in should decrease" do
        expect(@items[0].sell_in).to eq 9
      end
    end
  end

end
