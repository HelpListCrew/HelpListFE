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
end