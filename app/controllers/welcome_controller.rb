class WelcomeController < ApplicationController
  def show
		@location = request.location.data["loc"]
  end
end