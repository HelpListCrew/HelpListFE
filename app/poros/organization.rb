class Organization
  attr_reader :id,
              :name,
              :street_address,
              :city,
              :state,
              :zip_code,
              :email,
              :phone_number,
              :website,
              :mission_statement

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @street_address = data[:attributes][:street_address]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @zip_code = data[:attributes][:zip_code]
    @email = data[:attributes][:email]
    @phone_number = data[:attributes][:phone_number]
    @website = data[:attributes][:website]
    @mission_statement = data[:attributes][:mission_statement]
  end
end