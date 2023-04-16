class ApplicationController < ActionController::Base
	helper_method :current_user

	def current_user
		if session[:user_id]
			@user ||= HelpListFacade.new.find_user(session[:user_id])
		else
			flash[:error] = "Must be logged in to acces"
			redirect_to root_path
		end
	end

	private
	def error_message(errors)
		errors.full_messages.join(', ')
	end
end
