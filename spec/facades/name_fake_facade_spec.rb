require "rails_helper"

RSpec.describe NameFakeFacade do 
  describe "#generate_username" do 
     it "returns a generated username string", :vcr do 
      generated_username = NameFakeFacade.new.generate_username
      expect(generated_username).to be_a(String)
     end
  end
end