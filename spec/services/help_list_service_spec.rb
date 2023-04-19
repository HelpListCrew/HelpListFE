require "rails_helper"

RSpec.describe HelpListService do 
  describe "register a user", :vcr do 
  
    let(:new_user) {HelpListService.new.create_user({email: "octocat33@gmail.com", password: "iloveclimbing1234"})}
    it "returns a new_user json object" do
      expect(new_user).to be_a(Hash)
     
      expect(new_user).to have_key(:data)
      expect(new_user[:data]).to be_a(Hash)

      expect(new_user[:data]).to have_key(:id)
      expect(new_user[:data][:id]).to be_a(String)

      expect(new_user[:data]).to have_key(:type)
      expect(new_user[:data][:type]).to be_a(String)

      expect(new_user[:data]).to have_key(:attributes)
      expect(new_user[:data][:attributes]).to be_a(Hash)

      expect(new_user[:data][:attributes]).to have_key(:email)
      expect(new_user[:data][:attributes][:email]).to be_a(String)

      expect(new_user[:data][:attributes]).to have_key(:user_type)
      expect(new_user[:data][:attributes][:user_type]).to be_a(String)
    end
  end

  describe "#find_organizations", :vcr do 
    let(:orgs) { HelpListService.new.find_organizations(address: "80226", miles: 50) }

    it "returns a new json object" do 
      expect(orgs).to be_a(Hash)
      expect(orgs[:data]).to be_an(Array)
      
      orgs[:data].each do |org|
        expect(org).to have_key(:id)
        expect(org[:id]).to be_a(String)

        expect(org).to have_key(:type)
        expect(org[:type]).to be_a(String)

        expect(org).to have_key(:attributes)
        expect(org[:attributes]).to be_a(Hash)

        expect(org[:attributes]).to have_key(:name)
        expect(org[:attributes][:name]).to be_a(String)

        expect(org[:attributes]).to have_key(:street_address)
        expect(org[:attributes][:street_address]).to be_a(String)

        expect(org[:attributes]).to have_key(:city)
        expect(org[:attributes][:city]).to be_a(String)

        expect(org[:attributes]).to have_key(:state)
        expect(org[:attributes][:state]).to be_a(String)

        expect(org[:attributes]).to have_key(:zip_code)
        expect(org[:attributes][:zip_code]).to be_a(String)

        expect(org[:attributes]).to have_key(:email)
        expect(org[:attributes][:email]).to be_a(String)

        expect(org[:attributes]).to have_key(:phone_number)
        expect(org[:attributes][:phone_number]).to be_a(String)

        expect(org[:attributes]).to have_key(:website)
        expect(org[:attributes][:website]).to be_a(String)
      end
    end

    describe "#delete_wishlist_item", :vcr do
      it "deletes a wishlist item" do
        response = HelpListService.new.delete_wishlist_item(1)
      expect(response.status).to eq(204)
      end
    end
  end

  describe "#get_unpurchased_wishlist_items", :vcr do 
    let(:items) { HelpListService.new.get_unpurchased_wishlist_items(8) }

    it "returns all unpurchased items for a user" do 
      expect(items).to be_a(Hash)
      expect(items[:data]).to be_an(Array)

			items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a(String)

        expect(item).to have_key(:type)
        expect(item[:type]).to be_a(String)

        expect(item).to have_key(:attributes)
        expect(item[:attributes]).to be_a(Hash)

        expect(item[:attributes]).to have_key(:api_item_id)
        expect(item[:attributes][:api_item_id]).to be_a(String)

        expect(item[:attributes]).to have_key(:purchased)
        expect(item[:attributes][:purchased]).to be(false)

        expect(item[:attributes]).to have_key(:received)
        expect(item[:attributes][:received]).to be(false)

        expect(item[:attributes]).to have_key(:image_path)
        expect(item[:attributes][:image_path]).to be_a(String)

        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)

        expect(item[:attributes]).to have_key(:price)
        expect(item[:attributes][:price]).to be_a(Float)

        expect(item[:attributes]).to have_key(:size)
        expect(item[:attributes][:size]).to be_a(String)
      end
    end
  end

  describe "#get_org_by_id", :vcr do 
    let(:org) { HelpListService.new.get_org_by_id(1) }

    it "returns a new json object" do
      keys = [
              :name, 
              :street_address, 
              :city, 
              :state, 
              :zip_code, 
              :email, 
              :phone_number, 
              :website,
              :mission_statement
            ]

      expect(org).to be_a(Hash)
      expect(org[:data]).to be_a(Hash)
      expect(org[:data].keys).to eq([:id, :type, :attributes])
      expect(org[:data][:id]).to be_a(String)
      expect(org[:data][:type]).to be_a(String)
      expect(org[:data][:attributes]).to be_a(Hash)
      expect(org[:data][:attributes].keys).to eq(keys)

      expect(org[:data][:attributes][:name]).to be_a(String)
      expect(org[:data][:attributes][:street_address]).to be_a(String)
      expect(org[:data][:attributes][:city]).to be_a(String)
      expect(org[:data][:attributes][:state]).to be_a(String)
      expect(org[:data][:attributes][:zip_code]).to be_a(String)
      expect(org[:data][:attributes][:email]).to be_a(String)
      expect(org[:data][:attributes][:phone_number]).to be_a(String)
      expect(org[:data][:attributes][:website]).to be_a(String)
      expect(org[:data][:attributes][:mission_statement]).to be_a(String).or be_nil
    end
  end

  describe "#get_donated_wishlist_items", :vcr do 
    let(:items) { HelpListService.new.get_donated_items(2) }

    it "returns all unpurchased items for a user" do 
      expect(items).to be_a(Hash)
      expect(items[:data]).to be_an(Array)

			items[:data].each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a(String)

        expect(item).to have_key(:type)
        expect(item[:type]).to be_a(String)

        expect(item).to have_key(:attributes)
        expect(item[:attributes]).to be_a(Hash)

        expect(item[:attributes]).to have_key(:api_item_id)
        expect(item[:attributes][:api_item_id]).to be_a(String)

        expect(item[:attributes]).to have_key(:purchased)
        expect(item[:attributes][:purchased]).to be(false)

        expect(item[:attributes]).to have_key(:received)
        expect(item[:attributes][:received]).to be(false)

        expect(item[:attributes]).to have_key(:image_path)
        expect(item[:attributes][:image_path]).to be_a(String)

        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)

        expect(item[:attributes]).to have_key(:price)
        expect(item[:attributes][:price]).to be_a(Float)

        expect(item[:attributes]).to have_key(:size)
        expect(item[:attributes][:size]).to be_a(String)
      end
    end
  end
end