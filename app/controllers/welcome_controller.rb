class WelcomeController < ApplicationController
  def show
		require 'pry'; binding.pry
		@user = current_user
		@location = request.location.data["loc"]
  end
end