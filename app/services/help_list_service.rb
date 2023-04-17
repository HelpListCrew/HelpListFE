class HelpListService
  def connection
    url = "http://localhost:5000"
    Faraday.new(url: url)
  end

  def create_wishlist_item(params)
    response = connection.post("/api/v1/wishlist_items") do |con|
			con.headers = { "CONTENT_TYPE" => "application/json" }
			con.body = { wishlist_item: params }
    end

    JSON.parse(response.body, symbolize_names: true)
    #make test
  end

  def create_user(params)
    response = connection.post("/api/v1/users") do |con|
			con.headers = { "CONTENT_TYPE" => "application/json" }
			con.body = { user: params.to_hash }
    end
    JSON.parse(response.body, symbolize_names: true)
    #make test
  end

	def authenticate_user(params)
    response = connection.post("/api/v1/login") do |con|
			con.headers = { "CONTENT_TYPE" => "application/json" }
			con.body = { user: params.to_hash }
    end
    JSON.parse(response.body, symbolize_names: true)
    #make test
	end

	def find_user(id)
		response = connection.get("/api/v1/users/#{id}")
		JSON.parse(response.body, symbolize_names: true)
    #make test
	end

  def find_organizations(params)
    response = connection.get("/api/v1/organizations/find_all") do |con|
      con.params = params
    end
  end

  def get_wishlist_items(id)
    response = connection.get("/api/v1//wishlist_items") do |con|
			con.params[:user_id] = id
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end