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
    end
  end
end