class NameFakeService
  def connection
    url = "https://api.namefake.com"
    Faraday.new(url: url)
  end

  def get_username
    response = connection.get("")
    JSON.parse(response.body, symbolize_names: true)
  end
end