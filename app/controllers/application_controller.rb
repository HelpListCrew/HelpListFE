class ApplicationController < ActionController::Base
	helper_method :current_user

	def current_user
		@user ||= HelpListFacade.new.find_user(session[:user_id]) unless !session[:user_id]
	end

	private
	def error_message(errors)
		errors.full_messages.join(', ')
	end
end
