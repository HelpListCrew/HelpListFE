require "rails_helper"

describe "User Logout", :vcr do
  describe "As a logged in user" do
    describe "when I visit my dashboard" do
      it "can log out a user and redirect to the welcome page" do
        visit root_path

        fill_in :email, with: "plant_zaddy45@gmail.com"
        fill_in :password, with: "leafy_greens34"
        click_button "Login"

        expect(current_path).to eq(dashboard_path)
        click_button "Log Out"

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You have been logged out")
      end
    end  
  end  
end