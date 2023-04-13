class HelpListFacade

  def initialize(params = {})
    @params = params
    @service = HelpListService.new
  end

  def create_new_user
    new_user = @service.create_user(@params)
    User.new(new_user)
  end

	def authenticate_user
		user = @service.authenticate_user(@params)
		if user[:errors]
			return user = nil
		end
		User.new(user)
	end

	def find_user(id)
		user = @service.find_user(id)
		User.new(user)
	end
end