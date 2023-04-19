class HelpListFacade

  def initialize(params = {})
    @params = params
    @service = HelpListService.new
  end

  def create_new_user
    new_user = @service.create_user(@params)
    if new_user[:errors]
      return new_user[:errors]
    else
      User.new(new_user)
    end
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
			user = @service.create_user({uid: @params[:uid], email: @params[:email], username: @params[:username], password: SecureRandom.hex(15)})
		end
		User.new(user)
	end

	def find_user(id)
		user = @service.find_user(id)
		User.new(user)
	end

  def find_organizations_near_me
    orgs =  @service.find_organizations(@params)

    orgs[:data].map do |org|
      Organization.new(org)
    end
  end

  def get_wishlist_items(id = @params[:id])
    wishlist_items = @service.get_wishlist_items(id)
    wishlist_items[:data].map do |item|
      HelpListItem.new(item)
    end
  end

	def get_unpurchased_wishlist_items(id)
		wishlist_items = @service.get_unpurchased_wishlist_items(id)
		wishlist_items[:data].map { |item| HelpListItem.new(item) }
	end

  def get_organization(id)
    org = @service.get_org_by_id(id)
    Organization.new(org[:data])
  end
end