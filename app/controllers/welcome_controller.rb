class WelcomeController < ApplicationController
  def show
		@user = current_user
		@location = request.location.data["loc"]
  end
end