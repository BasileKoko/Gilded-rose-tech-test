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

  end

end
