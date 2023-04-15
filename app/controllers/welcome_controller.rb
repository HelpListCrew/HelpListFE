class WelcomeController < ApplicationController
  def show
		@location = request.location.data["loc"]
		require 'pry'; binding.pry
  end
end