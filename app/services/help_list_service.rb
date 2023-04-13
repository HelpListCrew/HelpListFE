class HelpListService
  def connection
    url = "http://localhost:5000"
    Faraday.new(url: url)
  end

  def create_user(params)
    require 'pry'; binding.pry
    response = connection.post("/api/v1/users", user: params, "Content-Type" => "application/json")
    JSON.parse(response.body, symbolize_names: true)
  end
end