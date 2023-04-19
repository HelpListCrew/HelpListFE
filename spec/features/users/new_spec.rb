require "rails_helper"

RSpec.describe "Register User" do
  describe "As a visitor", :vcr do
    before :each do 
    	visit register_path
    end

    describe "when I click on the link to register as a new user" do
      context "when successful" do
        it "takes me to a form to register as a new user" do 
          expect(page).to have_field(:username)
          expect(page).to have_field(:email)
          expect(page).to have_field(:password)
          expect(page).to have_field(:password_confirmation)

          expect(page).to have_button("Register")
          expect(page).to have_content("I am registering as a Donor!")
          expect(page).to have_content("I am registering as a Recipient!")
          page.has_checked_field?("donor")
        end
        
        it "takes a user to the welcome page if they already have an account" do
          expect(page).to have_content("Have an account?")

          click_button "Login Here"

          expect(current_path).to eq(root_path)
        end

        it "creates a new user when valid credentials are provided" do
          allow_any_instance_of(HelpListFacade).to receive(:get_donated_items).and_return([])
          fill_in :username, with: "bloomin_babe"
          fill_in :email, with: "plant_zaddy45@gmail.com"
          fill_in :password, with: "leafy_greens34"
          fill_in :password_confirmation, with: "leafy_greens34"

          choose(option: "donor")
          click_button "Register"

          expect(current_path).to eq(dashboard_path)
        end

        it "creates a new user when no username is provided" do
          allow_any_instance_of(HelpListFacade).to receive(:get_donated_items).and_return([])
          fill_in :email, with: "plant_mami45@gmail.com"
          fill_in :password, with: "leafy_greens34"
          fill_in :password_confirmation, with: "leafy_greens34"

          choose(option: "donor")
          click_button "Register"

          expect(current_path).to eq(dashboard_path)
        end

        it "creates a recipient user when the recipient radio button is clicked" do 
          fill_in :email, with: "spoon_fight_at_night33@gmail.com"
          fill_in :password, with: "nightfight"

          choose(option: "recipient")

          click_button "Register"

          recipient = HelpListFacade.new.find_user(13)

          expect(recipient.user_type).to eq("recipient")
          expect(recipient.email).to eq("spoon_fight_at_night33@gmail.com")
        end

        it "creates a donor user when the donor radio button is clicked" do 
          fill_in :email, with: "snickerz_lover85@gmail.com"
          fill_in :password, with: "caramelizyumz"

          choose(option: "donor")

          click_button "Register"

          recipient = HelpListFacade.new.find_user(14)

          expect(recipient.user_type).to eq("donor")
          expect(recipient.email).to eq("snickerz_lover85@gmail.com")
        end
      end

      context "when unsuccessful" do 
        it "will not register a user with invalid credentials" do 
          fill_in :email, with: "not_a_valid_email"
          fill_in :password, with: ""
          fill_in :password_confirmation, with: ""

          
          click_button "Register"
          expect(page).to have_content("Email is invalid. Password can't be blank.")
        end
      end
    end
  end
end