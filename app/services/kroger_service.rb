class KrogerService
  def get_products(product_name)
    get_url("/v1/products?filter.locationId=62000426&filter.term=#{CGI.escape(product_name)}")
  end

	def user_token(code)
    encoded_id_secret = Base64.encode64("#{ENV['KROGER_CLIENT_ID']}:#{ENV['KROGER_CLIENT_SECRET']}").gsub("\n","")

    conn = Faraday.new(url: "https://api.kroger.com", headers: {"Content-Type": "application/x-www-form-urlencoded", "Authorization": "Basic #{encoded_id_secret}"})

    response = conn.post('/v1/connect/oauth2/token') do |req|
			req.params["grant_type"] = "authorization_code"
			req.params["scope"] = "product.compact profile.compact cart.basic:write",
			req.body = { code: code, redirect_uri: ENV['KROGER_REDIRECT_URL'] }
    end

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    parsed_response[:access_token]
  end

	def add_to_cart(access_token, api_item_id)
		items = {
			"items": [
					{
					"quantity": 1,
					"upc": api_item_id,
					"modality": "DELIVERY"
					}
				]
			}.to_json

		post_url(access_token, items)
	end

  private
  def connection(headers)
    Faraday.new(url: "https://api.kroger.com", headers: headers)
  end

  def get_url(url)
    headers = {
                "CONTENT_TYPE": "application/json",
                "Authorization": "Bearer #{get_token}"
              }
							
    response = connection(headers).get(url)

    JSON.parse(response.body, symbolize_names: true) 
  end

  def post_url(access_token, items)
    headers = {
                "CONTENT_TYPE": "application/json",
                "Authorization": "Bearer #{access_token}"
              }
							
    response = Faraday.put("https://api.kroger.com/v1/cart/add") do |req|
			req.headers = headers
			req.body = items
    end
  end

  # Retrieves new token regardless of 30 minute token timer
  def get_token
    encoded_id_secret = Base64.encode64("#{ENV['KROGER_CLIENT_ID']}:#{ENV['KROGER_CLIENT_SECRET']}").gsub("\n","")

    conn = Faraday.new(url: "https://api.kroger.com", headers: {"Content-Type": "application/x-www-form-urlencoded", "Authorization": "Basic #{encoded_id_secret}"})
    
    response = conn.post('/v1/connect/oauth2/token') do |req|
      req.params["grant_type"] = "client_credentials"
      req.params["scope"] = "product.compact"
    end

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    parsed_response[:access_token]
  end



end