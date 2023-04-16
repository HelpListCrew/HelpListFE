require "rails_helper"

RSpec.describe "Searches Index" do
  describe "As a recipient" do
    describe "When I make a search and arrive at search_path ", :vcr do
      let(:user) {User.new({:data=>{:id=>"1", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :user_type=>"recipient"}}})}

      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_path

        fill_in :query, with: "string cheese"
        click_button "Search"
        
      end

      it "I can see a list of search items" do
        expect(current_path).to eq(search_path)

        within("#items") { expect(page).to have_css("p", count: 50)}

        within("#item-0004171623215") {
          expect(page).to have_css("img")
          expect(page).to have_content("Frigo® Cheese Heads® Original Mozzarella String Cheese")
          expect(page).to have_content("Frigo")
          expect(page).to have_content("5.99")
          expect(page).to have_content("12 ct / 1 oz")
        }
      end

      xit "I can see a button to add an item to my wishlist items" do
        within("#item-0004171623215") { click_button "Add to Wishlist" }

        expect(current_path).to eq(dashboard_path)

        within("#wishlist_items") { expect(page).to have_content("Frigo® Cheese Heads® Original Mozzarella String Cheese") }
      end
    end
  end
end