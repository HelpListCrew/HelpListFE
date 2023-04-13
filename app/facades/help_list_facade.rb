class HelpListFacade

  def initialize(params = {})
# require 'pry'; binding.pry
    @params = params
    @service = HelpListService.new
  end

  def create_new_user
    new_user = @service.create_user(@params)
    User.new(new_user)
  end
end