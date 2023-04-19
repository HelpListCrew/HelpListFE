require "rails_helper"

describe "User Dashboard", :vcr do
  describe "As a logged in user" do
    describe "when I visit my dashboard" do
      it "displays a generic header if user has no username" do
        allow_any_instance_of(HelpListFacade).to receive(:get_donated_items).and_return([])
        visit root_path

        fill_in :email, with: "plant_zaddy45@gmail.com"
        fill_in :password, with: "leafy_greens34"
        click_button "Login"

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Donor Dashboard")
      end

      it "diplays a custom header if the donor has a username", :vcr do 
        allow_any_instance_of(HelpListFacade).to receive(:get_donated_items).and_return([])
        visit root_path

        fill_in :email, with: "crzy_cat_ldy33@gmail.com"
        fill_in :password, with: "cat"

        click_button "Login"
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("pixelated_tiger's Donor Dashboard")
      end

      it "displays a custom welcome if the recipient has a username" do 
        visit root_path

        fill_in :email, with: "moon_child@gmail.com"
        fill_in :password, with: "spaceluvr"

        click_button "Login"
      
        expect(page).to have_content("Cosmic_cutie42's Recipient Dashboard")
      end
    end
  end
end