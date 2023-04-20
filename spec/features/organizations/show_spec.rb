require "rails_helper"

RSpec.describe "Organizations Show" do

  describe "As a logged in user" do
    describe "when I visit an Organization's show page" do

      context "when an organization has a mission statement" do
        it "I see that organization's mission statement", :vcr do
          visit organization_path(1)

          expect(page).to have_content("Littel-Kreiger")

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

      describe "I should see all the recipients associated with the org", :vcr do

        context "if a user doesn't have a username" do
          it "their show link will reference their user id" do
            visit organization_path(1)

            within "#recipients" do
              expect(page).to have_content("Our Recipients")
              
              within "##{1}" do
                expect(page).to have_link("Recipient 1's Wishlist")
              end
            end
          end
        end

        context "if a user has a username" do 
          it "their show link will reference their username" do
            visit organization_path(1)

            within "#recipients" do
              within "##{2}" do
                expect(page).to have_link("OceanicDreamer's Wishlist")
              end

              within "##{3}" do
                expect(page).to have_link("Stargazer321's Wishlist")
              end
            end
          end
        end
      end
    end
  end
end