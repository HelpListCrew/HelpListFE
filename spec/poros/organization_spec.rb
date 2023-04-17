require "rails_helper"
RSpec.describe Organization do 
  describe "#instance methods", :vcr do

    before(:each) do 
      facade = HelpListFacade.new(address: "80226", miles: 10)
      @orgs = facade.find_organizations_near_me
      @org = @orgs.first
    end
    describe "#initialize" do 
      it "exists" do
       expect(@org).to be_a(Organization)
      end
      it "has atributes" do 
        expect(@org.id).to eq("42")
        expect(@org.email).to eq("cherlyn@dickinson-bode.test")
        expect(@org.city).to eq("Denver")
        expect(@org.name).to eq("Welch LLC")
        expect(@org.phone_number).to eq("1-855-077-9529 x349")
        expect(@org.state).to eq("CO")
        expect(@org.street_address).to eq("1101 W. 7th Ave.")
        expect(@org.website).to eq("http://example.com/jake")
        expect(@org.zip_code).to eq("80204")
      end
    end
  end
end