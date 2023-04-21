require "rails_helper"

RSpec.describe NameFakeService do 
  let(:username) { NameFakeService.new.get_username }

  it "returns a json object containing a randomly generated username", :vcr do 
    expect(username).to be_a(Hash)
    
    expect(username).to have_key(:username)
    expect(username[:username])
  end
end
