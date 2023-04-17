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
      let(:delete_item) { HelpListService.new.delete_wishlist_item(3) }
      
      it "returns a new json object" do
        expect(delete_item).to be_a(Hash)
        expect(delete_item[:data]).to be_a(Hash)
      end
    end
  end
end