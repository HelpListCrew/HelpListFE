require "rails_helper"

RSpec.describe HelpListFacade do 
  describe "#create_new_user", :vcr do
    it "registers a new user" do 
      facade = HelpListFacade.new(email: "octodog86@gmail.com", password: "iloveclimbing1234")
    
      new_user = facade.create_new_user
      expect(new_user).to be_a(User)
      expect(new_user.email).to be_a(String)
      expect(new_user.user_type).to be_a(String)
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
end