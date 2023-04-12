require "rails_helper"

RSpec.describe "Register User" do
  describe "As a visitor" do
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
    end
  end
end