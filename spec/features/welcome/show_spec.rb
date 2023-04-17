require "rails_helper"

RSpec.describe "Welcome Page" do
  before :each do 
    visit root_path
  end
  describe "As a visitor" do 
    describe "when I visit the welcome page" do 
      it "displays the name of the application at the top of the page" do
        expect(page).to have_content("HelpList")
        expect(page).to have_content("Helping Humans Help Humans")
      end
      
      it "displays a form to log in with an email and password" do
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
      end

      it "displays a link to register a new user" do
        expect(page).to have_link("Register Here")
      end

      it "displays two buttons to log in" do
        expect(page).to have_button("Login")
        expect(page).to have_button("Login with Google")
      end

      it "displays a header abouve the map of organizations" do
        within("#map") {
        expect(page).to have_content("Organizations Near Me:")
        expect(page).to have_css("iframe")
        }
      end
    end
  end
end