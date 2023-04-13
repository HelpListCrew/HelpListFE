require "rails_helper"

RSpec.describe "Google Oauth" do
	before do
		visit root_path
	end

	describe "Logging in with google oauth" do
		it "allows visitors to log in with google oauth" do
			expect(page).to have_button("Login with Google")

			click_button "Login with Google"
		end
	end
end