require "rails_helper"

describe "application.html.erb" do
  it "has a title and tagline" do
    visit root_path

    expect(page).to have_content("HelpList")
    expect(page).to have_content("Helping Humans Help Humans")
  end

  it "has a nav bar with link for the home" do
    visit root_path

    expect(page).to have_link("Home")
  end

	it "only shows dashboard and wishlist links in navbar if a user is logged in" do
		visit root_path

		expect(page).to_not have_link "Dashboard"

		user = User.new({:id=>"5", :type=>"user", :attributes=>{:email=>"octodog86@gmail.com", :user_type=>"donor"}})

		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
		visit root_path

		expect(page).to have_link("Dashboard")
	end
end