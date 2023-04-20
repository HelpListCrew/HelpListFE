require "rails_helper"

RSpec.describe Item, type: :model do
  describe "#instance methods", :vcr do
    before(:each) do
      @item = KrogerFacade.new(query: "string cheese").find_items.first
    end

    describe "#initialize" do
      it "exists" do
        expect(@item).to be_a(Item)
      end

      it "has readable attributes" do
        expect(@item.id).to be_a(String)
        expect(@item.categories).to be_a(Array)
        expect(@item.brand).to be_a(String)
        expect(@item.description).to be_a(String)
        expect(@item.image_url).to be_a(String)
        expect(@item.price).to be_a(Float)
        expect(@item.size).to be_a(String)
      end
    end
  end
end