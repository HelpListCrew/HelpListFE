require "rails_helper"

RSpec.describe "Organization User Show Page" do
  describe "As a user" do
    describe "When I visit the organization user show path" do
      it "should see a list of all the user's wishlist items", :vcr do
        visit organization_user_path(12,8)
				
        within("#wishlist_items") { 
          expect(page).to have_css("img", count: 2)
          expect(page).to have_css("p", count: 6)
        }
      end

      it "next to each item, I should see a message 'Login to Kroger Cart Above', 
      and I should see a button at the top that allows me to login to Kroger", :vcr do
        visit organization_user_path(12, 8)
			
        within("#wishlist_item-0072216022326") { expect(page).to have_content("Login to Kroger Cart Above") }

				expect(page).to have_button("Login with Kroger")
      end
		end

		describe "when I'm logged in through Kroger OAuth" do
      it "next to each item, I should see a button 'Add to Kroger Cart' and when pressed, 
      it should be added to my kroger cart and I should remain on the page", :vcr do
    		allow_any_instance_of(Organizations::UsersController).to receive(:session_access_token).and_return(true)

        visit organization_user_path(12, 8)
			
        within("#wishlist_item-0072216022326") { expect(page).to have_button("Add to Kroger Cart") }
      end

      it "next to each item, I should see a button 'I Purchsed This Item' and and when pressed, 
			I should remain on the page and the item should disappear", :vcr do
    		allow_any_instance_of(Organizations::UsersController).to receive(:session_access_token).and_return(true)

        visit organization_user_path(12, 8)
				
        within("#wishlist_item-0004400006025") { 
					expect(page).to have_button("I Purchased This Item") 
					
					click_button "I Purchased This Item"
				}
				
				expect(page).to_not have_css("#wishlist_item-0004400006025")
      end
    end
  end
end