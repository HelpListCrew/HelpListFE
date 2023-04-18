require "rails_helper"

RSpec.describe HelpListItem, type: :model do
  describe "#instance methods", :vcr do
    before(:each) do
      @items = HelpListFacade.new.get_wishlist_items("5")
    end

    describe "#initialize" do
      it "exists" do
        expect(@items.first).to be_a(HelpListItem)
      end

      it "has readable attributes" do
        expect(@items.first.id).to be_a(String)
        expect(@items.first.api_item_id).to be_a(String)
        expect(@items.first.name).to be_a(String)
        expect(@items.first.price).to be_a(Float)
        expect(@items.first.image_path).to be_a(String)
        expect(@items.first.size).to be_a(String)
      end
    end
  end
end