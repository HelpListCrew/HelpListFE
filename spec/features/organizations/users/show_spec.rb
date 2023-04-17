require "rails_helper"

RSpec.describe "Organization User Show Page" do
  describe "As a user" do
    describe "When I visit the organization user show path" do
      it "should see a list of all the user's wishlist items", :vcr do
        visit organization_user_path(12,8)

        within("#wishlist_items") { 
          expect(page).to have_css("img", count: 3)
          expect(page).to have_css("p", count: 6)
        }
      end

      it "next to each item, I should see a button 'Add to Kroger Cart' and when pressed, 
      it should be added to my kroger cart and I should remain on the page", :vcr do
    		allow_any_instance_of(ApplicationController).to receive(:session).and_return({access_token: "token"})

        visit organization_user_path(12, 8)

        within("#wishlist_item-0004171623215") { expect(page).to have_content("button") }
      end

      it "next to each item, I should see a button to acknowledge that the item has been purchased,
      and when pressed, I should remain on the page and the item should disappear", :vcr do
      
      end
    end
  end
end