require "rails_helper"

RSpec.describe "Organizations Show" do

  describe "As a logged in user" do
    describe "when I visit an Organization's show page" do
      context "when an organization has a mission statement" do
        it "I see that organization's mission statement", :vcr do
          visit organization_path(1)

          within "#mission-statement" do
            expect(page).to have_content("Mission Statement")
            expect(page).to have_content("To empower and uplift individuals, families, and communities in need through comprehensive support, compassionate care, and sustainable solutions.")
          end
        end
      end

      context "when an organization does not have a mission statement" do
        it "I do not see a mission statement section", :vcr do
          visit organization_path(2)

          expect(page).to_not have_css("#mission-statement")
        end
      end

      describe "I see a link to 'View all Recipients'" do
        it "When I click the link, I am taken to that org's recipient index", :vcr do
          visit organization_path(1)

          expect(page).to have_link("View all Recipients")
          click_link("View all Recipients")
          expect(current_path).to eq("/organizations/1/users")
        end
      end
    end
  end
end