class NameFakeFacade

  def generate_username
   json =  NameFakeService.new.get_username
    json[:username]
  end
end

