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
end