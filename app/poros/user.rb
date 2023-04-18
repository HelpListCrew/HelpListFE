class User
  attr_reader :id,
              :username,
              :email,
              :user_type

  def initialize(info)
    @id = info[:data][:id]
    @username = info[:data][:attributes][:username]
    @email = info[:data][:attributes][:email]
    @user_type = info[:data][:attributes][:user_type]
  end
end