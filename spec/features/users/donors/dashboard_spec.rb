require "rails_helper"

describe "Donor Dashboard", :vcr do
  describe "As a logged in donor user" do
    describe "when I visit my dashboard" do
      let(:user) {User.new({:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :user_type=>"donor"}}})}
      it "shows a section to explore organizations near me" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_path

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Explore Organizations Near Me")
      end

      it "shows a section the donor's donated items" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_path
   
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Donated Items")
      end
    end
  end    
end      

