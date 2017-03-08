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
      it "sell_in should not change" do
        expect(@items[0].sell_in).to eq 5
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

    context "Backstage passes to a TAFKAL80ETC concert" do
      before do
        @items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 48)]
        GildedRose.new(@items).update_quality()
        @items1 = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 47)]
        GildedRose.new(@items1).update_quality()
        @items2 = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)]
        GildedRose.new(@items2).update_quality()
        @items3 = [Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 40)]
        GildedRose.new(@items3).update_quality()
        @items4 = [Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 70)]
        GildedRose.new(@items4).update_quality()
      end

      it "increases item quality by 2 if quality is less than 49" do
        expect(@items[0].quality).to eq 50
      end
      it "increases item quality by 3 if quality is less than 48" do
        expect(@items1[0].quality).to eq 50
      end
      it "item quality drop to 0 after concert" do
        expect(@items2[0].quality).to eq 0
      end
      it "item quality increase by 1 if sell_in is greater than 10 and item quality is less than 50" do
        expect(@items3[0].quality).to eq 41
      end
      it "should not change item quality if quality is greater than 50" do
        expect(@items4[0].quality).to eq 70
      end
      it "sell_in should decrease" do
        expect(@items[0].sell_in).to eq 9
      end
    end

    context "Conjured" do
      before do
        @items = [Item.new("Conjured", -2, 13)]
        GildedRose.new(@items).update_quality()
        @items1 = [Item.new("Conjured", -1, 2)]
        GildedRose.new(@items1).update_quality()
        @items2 = [Item.new("Conjured", 0, 6)]
        GildedRose.new(@items2).update_quality()
        @items3 = [Item.new("Conjured", 1, 1)]
        GildedRose.new(@items3).update_quality()
      end

      it "decreases quality by 4 if sell_in is less than 0 and quality is greater than 3" do
        expect(@items[0].quality).to eq 9
      end
      it "does not change quality if sell_in is less than 0 and quality is less than 4" do
        expect(@items1[0].quality).to eq 2
      end
      it "decreases quality by 2 if sell_in is greater or equal to 0 and quality is greater than 2" do
        expect(@items2[0].quality).to eq 4
      end
      it "does not change quality if sell_in is greater or equal to 0 and quality is less than 2" do
        expect(@items3[0].quality).to eq 1
      end
    end

  end
end
