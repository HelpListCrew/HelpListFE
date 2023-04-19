class HelpListService
  def connection
		url = ENV["HELPLIST_URL"]
    Faraday.new(url: url)
  end

  def create_wishlist_item(params)
    response = connection.post("/api/v1/wishlist_items") do |con|
			con.headers = { "CONTENT_TYPE" => "application/json" }
			con.body = { wishlist_item: params }
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def create_user(params)
    response = connection.post("/api/v1/users") do |con|
			con.headers = { "CONTENT_TYPE" => "application/json" }
			con.body = { user: params.to_hash }
    end
    JSON.parse(response.body, symbolize_names: true)
  end

	def authenticate_user(params)
    response = connection.post("/api/v1/login") do |con|
			con.headers = { "CONTENT_TYPE" => "application/json" }
			con.body = { user: params.to_hash }
    end
    JSON.parse(response.body, symbolize_names: true)
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
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_wishlist_items(id)
    response = connection.get("/api/v1//wishlist_items") do |con|
			con.params[:user_id] = id
    end
    JSON.parse(response.body, symbolize_names: true)
    #make test
  end
  
	def update_wishlist_item(user_id, params)
		connection.patch("/api/v1/wishlist_items/#{params[:id]}") do |con|
			con.headers = { "CONTENT_TYPE" => "application/json" }
			con.body = { wishlist_item: params.to_hash }
			con.params[:donor_id] = user_id
		end
    #make test
	end

	def get_unpurchased_wishlist_items(id)
		response = connection.get("/api/v1/wishlist_items") do |con|
			con.params[:user_id] = id
			con.params[:modifier] = "unpurchased"
		end
		JSON.parse(response.body, symbolize_names: true)
	end

  def delete_wishlist_item(id)
    response = connection.delete("/api/v1/wishlist_items/#{id}") 
  end

  def get_org_by_id(id)
    response = connection.get("/api/v1/organizations/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end
end