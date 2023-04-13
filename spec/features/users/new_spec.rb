require "rails_helper"

RSpec.describe "Register User" do
  describe "As a visitor", :vcr do
    before :each do 
    	visit register_path
    end

    describe "when I click on the link to register as a new user" do
      it "takes me to a form to register as a new user" do 
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
        expect(page).to have_field(:password_confirmation)

        expect(page).to have_button("Register")
        expect(page).to have_content("I am registering as a Donor!")
        expect(page).to have_content("I am registering as a Recipient!")
      end

      it "creates a new user when valid credentials are provided" do
        fill_in :email, with: "plant_zaddy45@gmail.com"
        fill_in :password, with: "leafy_greens34"
        fill_in :password_confirmation, with: "leafy_greens34"

        choose(option: "donor")
        click_button "Register"

        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end