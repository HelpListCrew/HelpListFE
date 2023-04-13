class HelpListService
  def connection
    url = "http://localhost:5000"
    Faraday.new(url: url)
  end

  def create_user(params)
    response = connection.post("/api/v1/users") do |con|
			con.headers = { "CONTENT_TYPE" => "application/json" }
			con.body = { user: params.to_hash }
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end