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
    let(:orgs) { HelpListService.new.find_organizations({address: "80003", miles: 50}) }

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

        expect(org[:attributes]).to have_key(:mission_statement)
        expect(org[:attributes][:mission_statement]).to be_a(String).or be_nil
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


  describe "#create_wishlist_item", :vcr do
    let(:item) { HelpListService.new.create_wishlist_item({api_item_id: "0001111041700", recipient_id: 1}) }
    let(:item2) { HelpListService.new.create_wishlist_item({api_item_id: "0001111042315", recipient_id: 1, size: "10.00", name: "Fat Free Milk", price: 5.00, image_path: "www.here.now"}) }

    it "creates a new wishlist item for an organization user" do
      keys = [
              :api_item_id, 
              :purchased, 
              :received, 
              :size, 
              :name, 
              :price, 
              :image_path 
            ]

      expect(item).to be_a(Hash)
      expect(item[:data]).to be_a(Hash)
      expect(item[:data].keys).to eq([:id, :type, :attributes])
      expect(item[:data][:id]).to be_a(String)
      expect(item[:data][:type]).to be_a(String)
      expect(item[:data][:attributes]).to be_a(Hash)
      expect(item[:data][:attributes].keys).to eq(keys)
      expect(item[:data][:attributes][:api_item_id]).to be_a(String)
      expect(item[:data][:attributes][:purchased]).to be(false)
      expect(item[:data][:attributes][:received]).to be(false)
      expect(item[:data][:attributes][:size]).to be(nil)
      expect(item[:data][:attributes][:name]).to be(nil)
      expect(item[:data][:attributes][:price]).to be(nil)
      expect(item[:data][:attributes][:image_path]).to be(nil)
    
      expect(item2[:data][:attributes][:size]).to be_a(String)
      expect(item2[:data][:attributes][:name]).to be_a(String)
      expect(item2[:data][:attributes][:price]).to be_a(Float)
      expect(item2[:data][:attributes][:image_path]).to be_a(String)
    end
  end

  describe "#authenticate_user", :vcr do
    let(:user) {HelpListService.new.authenticate_user({email: "recipient@gmail.com", password: "123"})}
    let(:user2) {HelpListService.new.authenticate_user({email: "anotherrecipient@gmail.com", password: "123"})}
    
    it "authenticates login information of a user" do
      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data].keys).to eq([:id, :type, :attributes])
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes].keys).to eq([:email, :user_type, :username])
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes][:user_type]).to be_a(String)
      expect(user[:data][:attributes][:username]).to be(nil)
      expect(user2[:data][:attributes][:username]).to be_a(String)
    end
  end

  describe "#find_user", :vcr do
    let(:user) { HelpListService.new.find_user(1) }

    it "finds a user with a given id" do
      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data].keys).to eq([:id, :type, :attributes])
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes].keys).to eq([:email, :user_type, :username])
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes][:user_type]).to be_a(String)
      expect(user[:data][:attributes][:username]).to be_a(String).or be_nil
    end
  end

  describe "#get_wishlist_items", :vcr do
    let(:wisheditems) { HelpListService.new.get_wishlist_items(8) }

    it "finds wishlist items by user id" do
      keys = [
        :api_item_id, 
        :purchased, 
        :received, 
        :size, 
        :name, 
        :price, 
        :image_path 
      ]

      expect(wisheditems).to be_a(Hash)
      expect(wisheditems[:data]).to be_an(Array)
      expect(wisheditems[:data][0]).to be_a(Hash)
      expect(wisheditems[:data][0].keys).to eq([:id, :type, :attributes])
      expect(wisheditems[:data][0][:id]).to be_a(String)
      expect(wisheditems[:data][0][:type]).to be_a(String)
      expect(wisheditems[:data][0][:attributes]).to be_a(Hash)
      expect(wisheditems[:data][0][:attributes].keys).to eq(keys)
      expect(wisheditems[:data][0][:attributes][:api_item_id]).to be_a(String)
      expect(wisheditems[:data][0][:attributes][:purchased]).to be(false)
      expect(wisheditems[:data][0][:attributes][:received]).to be(false)
      expect(wisheditems[:data][0][:attributes][:size]).to be_a(String)
      expect(wisheditems[:data][0][:attributes][:name]).to be_a(String)
      expect(wisheditems[:data][0][:attributes][:price]).to be_a(Float)
      expect(wisheditems[:data][0][:attributes][:image_path]).to be_a(String)
    end
  end

  describe "#update_wishlist_item", :vcr do
    let(:wisheditem) { HelpListService.new.update_wishlist_item(8, {id: 2, purchased: true}) }

    it "updates an existing wishlist item" do
      keys = [
        :api_item_id, 
        :purchased, 
        :received, 
        :size, 
        :name, 
        :price, 
        :image_path 
      ]

      expect(wisheditem).to be_a(Hash)
      expect(wisheditem[:data]).to be_a(Hash)
      expect(wisheditem[:data].keys).to eq([:id, :type, :attributes])
      expect(wisheditem[:data][:id]).to be_a(String)
      expect(wisheditem[:data][:type]).to be_a(String)
      expect(wisheditem[:data][:attributes]).to be_a(Hash)
      expect(wisheditem[:data][:attributes].keys).to eq(keys)
      expect(wisheditem[:data][:attributes][:api_item_id]).to be_a(String)
      expect(wisheditem[:data][:attributes][:purchased]).to be(true)
      expect(wisheditem[:data][:attributes][:received]).to be(false)
      expect(wisheditem[:data][:attributes][:size]).to be_a(String)
      expect(wisheditem[:data][:attributes][:name]).to be_a(String)
      expect(wisheditem[:data][:attributes][:price]).to be_a(Float)
      expect(wisheditem[:data][:attributes][:image_path]).to be_a(String)
    end
  end
end