require "rails_helper"

RSpec.describe "Kroger Facade" do
  describe "#instance methods", :vcr do
    describe "#find_items" do
      it "returns a list of item objects based on search parameters" do
        facade = KrogerFacade.new(query: "string cheese")

        items = facade.find_items

        expect(items.count).to eq(10)

        items.each do |item|
          expect(item.id).to be_a(String)
          expect(item.brand).to be_a(String)
          expect(item.categories).to be_an(Array)
          expect(item.description).to be_a(String)
          expect(item.image_url).to be_a(String)
          expect(item.price).to be_a(Float)
          expect(item.size).to be_a(String)
        end
      end
    end
  end
end