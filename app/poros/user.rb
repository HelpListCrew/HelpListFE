class User 
  attr_reader :id,
              :email,
              :user_type

  def initialize(info)
    require 'pry'; binding.pry
    @id = info[:data][:id]
    @email = info[:data][:attributes][:email]
    @user_type = info[:data][:attributes][:user_type]
  end
end