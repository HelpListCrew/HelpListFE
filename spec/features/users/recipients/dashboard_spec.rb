require "rails_helper"

describe "User Dashboard", :vcr do
  describe "As a logged in recipient user" do
    describe "when I visit my dashboard" do
      let(:user) {User.new({:id=>"5", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :user_type=>"recipient"}})}

      before(:each) do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_path
      end

      it "displays an items search bar" do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        # visit dashboard_path

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_field(:query)
      end

      #potentially add sad pathing
      it "I can search for an item by name and click search" do
        fill_in :query, with: "string cheese"
        click_button "Search"

        expect(current_path).to eq(search_path)
      end    

      it "displays a section to show my wishlist items" do
        visit dashboard_path

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Wishlist Items")
      end

      it "shows a section the recipient's wished items" do
        visit dashboard_path
        
        fill_in :query, with: "string cheese"
        click_button "Search"

        expect(current_path).to eq(search_path)
				
        within("#item-0004171623215") { click_button "Add to Wishlist" }
				
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Frigo® Cheese Heads® Original Mozzarella String Cheese")
      end

      it "shows a button to remove an item from my wishlist" do
        visit dashboard_path
        
        fill_in :query, with: "string cheese"
        click_button "Search"
      
        expect(current_path).to eq(search_path)
       
        within("#item-0004171623215") { click_button "Add to Wishlist" }
        
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Frigo® Cheese Heads® Original Mozzarella String Cheese")
        expect(page).to have_button("Delete")
        click_button "Delete"
        expect(page).to_not have_content("Frigo® Cheese Heads® Original Mozzarella String Cheese")
      end
    end
  end
end
