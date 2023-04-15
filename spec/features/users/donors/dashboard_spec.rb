require "rails_helper"

describe "Donor Dashboard", :vcr do
  describe "As a logged in donor user" do
    describe "when I visit my dashboard" do
      let(:user) {User.new({:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :user_type=>"donor"}}})}
      
      it "displays a recipient's about me section" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_path
        save_and_open_page
        
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("About Me")
      end
      
      xit " displays a list of recipients's wishlist items" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_path
  
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("#{user.email}'s Wishlist")
      end
    end
  end
end      

