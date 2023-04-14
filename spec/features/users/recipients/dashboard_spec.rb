require "rails_helper"

describe "User Dashboard", :vcr do
  describe "As a logged in user" do
    describe "when I visit my dashboard" do
      it "displays an items search bar" do
        visit root_path

        fill_in :email, with: "plant_zaddy45@gmail.com"
        fill_in :password, with: "leafy_greens34"
        click_button "Login"
        
        save_and_open_page
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_field(:search)
      end
    end
  end
end
