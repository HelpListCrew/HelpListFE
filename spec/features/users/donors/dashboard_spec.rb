require "rails_helper"

describe "Donor Dashboard", :vcr do
  describe "As a logged in donor user" do
    describe "when I visit my dashboard" do

      let(:user) {User.new({:id=>"5", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :user_type=>"donor"}})}
      before :each do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(HelpListFacade).to receive(:get_donated_items).and_return([])
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
    end

    describe "when I visit my dashboard with donated items" do
      it "shows a section the donor's donated items" do
        donor = User.new({:id=>"2", :type=>"user", :attributes=>{:email=>"donor@gmail.com", :user_type=>"donor"}})
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(donor)
        visit dashboard_path

        expect(current_path).to eq(dashboard_path)

        within("#donated-items") {
          expect(page).to have_css("img", count: 4)
          expect(page).to have_css("p", count: 9)
        }
      end
    end
  end    
end      
