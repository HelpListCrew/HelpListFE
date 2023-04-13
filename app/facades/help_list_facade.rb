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

	def find_or_create
		user = @service.authenticate_user(@params)
		if user[:errors]
			user = @service.create_user({uid: @params[:uid], email: @params[:email], password: SecureRandom.hex(15)})
		end
		User.new(user)
	end

	def find_user(id)
		user = @service.find_user(id)
		User.new(user)
	end
end