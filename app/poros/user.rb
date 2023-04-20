class User
  attr_reader :id,
              :username,
              :email,
              :user_type

  def initialize(info)
    @id = info[:id]
    @username = info[:attributes][:username]
    @email = info[:attributes][:email]
    @user_type = info[:attributes][:user_type]
  end
end