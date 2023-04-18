require "rails_helper"

describe "Donor Dashboard", :vcr do
  describe "As a logged in donor user" do
    describe "when I visit my dashboard" do

      let(:user) {User.new({:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :user_type=>"donor"}}})}
      before :each do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit dashboard_path
      end

      it "displays a generic welcome if the user has no username" do 
        expect(page).to have_content("Donor Dashboard")
      end
      
      it "shows a section to explore organizations near me" do
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Explore Organizations Near Me")
      end

      it "displays a search form with a zipcode field and number selector for miles radius" do 
        expect(page).to have_field(:address) #numericality
        page.has_select?("Radius")
        expect(page).to have_button("Search")
      end

      it "when I enter a zip code and a mile radius I am shown a list of up to ten organizations near me as links" do
        fill_in :address, with: 80226
        select 50, from: :miles
        click_on "Search"
      
        expect(page).to have_content("Schmitt-Walter")
        expect(page).to have_content("Robel, Reilly and Baumbach")
      end

      it "does not display any organizations with invalid params" do
        fill_in :address, with: 00000
        select 75, from: :miles
        click_on "Search"
    
        expect(page).to_not have_content("Schmitt-Walter")
        expect(page).to_not have_content("Robel, Reilly and Baumbach")
      end

      it "shows a section the donor's donated items" do
      #add to test to expect page to have list of donated items
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Donated Items")
      end
    end
  end    
end      

