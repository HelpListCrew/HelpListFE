class ApplicationController < ActionController::Base
	helper_method :current_user

	def current_user
		@user ||= HelpListFacade.new.find_user(session[:user_id])
	end
end
