class HelpListFacade

  def initialize(params = {})
    @params = params
    @service = HelpListService.new
  end

  def create_new_user
    new_user = @service.create_user(@params)
    User.new(new_user)
  end
end