require "rails_helper"

describe "User Dashboard", :vcr do
  describe "As a logged in user" do
    describe "when I visit my dashboard" do
      let(:user) {User.new({:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :user_type=>"donor"}}})}
      it "displays an items search bar" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_field(:search)
      end
    end
  end
end
