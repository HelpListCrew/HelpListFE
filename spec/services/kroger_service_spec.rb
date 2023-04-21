require "rails_helper"

RSpec.describe "Kroger Service" do
  describe "#instance methods", :vcr do
    let(:kroger_service) { KrogerService.new }

    describe "#get_product" do
      it "should retrieve JSON data for a product based on parameters" do
        json_items = kroger_service.get_products("string cheese")

        expect(json_items[:data].count).to eq(10)
        
        json_items[:data].each do |json_item|
          expect(json_item[:productId]).to be_a(String)
          expect(json_item[:categories]).to be_an(Array)
          expect(json_item[:brand]).to be_a(String)
          expect(json_item[:description]).to be_a(String)
          expect(json_item[:images]).to be_an(Array)
          expect(json_item[:images].first[:sizes].third[:url]).to be_a(String)
          expect(json_item[:items].first[:price][:regular]).to be_a(Float)
          expect(json_item[:items].first[:size]).to be_a(String)
        end
      end
    end

		describe "user_token" do
			it "returns an access token after logging in with omniauth" do
				code = "9VZqqaEkx1GS7YCaet4001XRxguDbsd0mcUNO8s5"

				access_token = kroger_service.user_token(code)

				expect(access_token).to be_a String
			end
		end
	end
end