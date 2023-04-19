require "rails_helper"

RSpec.describe HelpListFacade do 
  describe "#create_new_user", :vcr do
    it "registers a new user" do 
      facade = HelpListFacade.new(email: "octodog86@gmail.com", username: "burger_boss", password: "iloveclimbing1234")
    
      new_user = facade.create_new_user
      expect(new_user).to be_a(User)
      expect(new_user.email).to be_a(String)
      expect(new_user.user_type).to be_a(String)
      expect(new_user.username).to be_a(String)
    end
  end

  describe "#find_organizations_near_me", :vcr do 
    it "returns a list of organizations near the given params" do 
      facade = HelpListFacade.new(address: "80226", miles: 10)
      orgs = facade.find_organizations_near_me
      org = orgs.first

      expect(org).to be_a(Organization)
      expect(org.city).to be_a(String)
      expect(org.email).to be_a(String)
      expect(org.id).to be_a(String)
      expect(org.name).to be_a(String)
      expect(org.phone_number).to be_a(String)
      expect(org.state).to be_a(String)
      expect(org.street_address).to be_a(String)
      expect(org.website).to be_a(String)
      expect(org.zip_code).to be_a(String)
      expect(org.mission_statement).to be_a(String).or be_nil

    end
  end

  describe "#get_organization(id)", :vcr do
    it "returns an organization with the given id" do
      org = HelpListFacade.new.get_organization(1)

      expect(org).to be_an(Organization)

      expect(org.city).to be_a(String)
      expect(org.city).not_to be_nil

      expect(org.email).to be_a(String)
      expect(org.email).not_to be_nil

      expect(org.id).to be_a(String)
      expect(org.id).not_to be_nil

      expect(org.name).to be_a(String)
      expect(org.name).not_to be_nil

      expect(org.phone_number).to be_a(String)
      expect(org.phone_number).not_to be_nil

      expect(org.state).to be_a(String)
      expect(org.state).not_to be_nil

      expect(org.street_address).to be_a(String)
      expect(org.street_address).not_to be_nil

      expect(org.website).to be_a(String)
      expect(org.website).not_to be_nil

      expect(org.zip_code).to be_a(String)
      expect(org.zip_code).not_to be_nil

      expect(org.mission_statement).to be_a(String).or be_nil
    end
  end

  describe "#get_unpurchased_wishlist_items", :vcr do 
    it "returns a list of organizations near the given params" do 
      facade = HelpListFacade.new(address: "80226", miles: 10)
      items = facade.get_unpurchased_wishlist_items(8)
      item = items.first

			expect(item).to be_a(HelpListItem)
      expect(item.api_item_id).to be_a(String)
      expect(item.image_path).to be_a(String)
      expect(item.name).to be_a(String)
      expect(item.id).to be_a(String)
      expect(item.size).to be_a(String)
      expect(item.price).to be_a(Float)
    end
  end

  describe "#get_donated_items", :vcr do
    it "returns a list of donated items for a specific user" do
      facade = HelpListFacade.new(id: 2)
      items = facade.get_donated_items

      item = items.first

      expect(item).to be_a(HelpListItem)
      expect(item.api_item_id).to be_a(String)
      expect(item.image_path).to be_a(String)
      expect(item.name).to be_a(String)
      expect(item.id).to be_a(String)
      expect(item.size).to be_a(String)
      expect(item.price).to be_a(Float)
    end
  end
end