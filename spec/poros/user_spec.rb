require "rails_helper"

RSpec.describe User do 
  describe "#initialize" do 
    let(:new_user) {User.new({:id=>"5", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :username=>"electric_emerald", :user_type=>"donor"}})}
    it "exists" do 
      expect(new_user).to be_a(User)
      expect(new_user.username).to eq("electric_emerald")
      expect(new_user.email).to eq("octodog86@gmail.com")
      expect(new_user.user_type).to eq("donor")
    end
  end
end