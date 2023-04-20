class Organizations::UsersController < ApplicationController
	helper_method :session_access_token
	
	def index
		
	end

  def show
		session[:return_to] = organization_user_path(params[:organization_id], params[:id])
    @help_list_facade = HelpListFacade.new(params)
		@recipient = params[:id]
  end

	private

	def session_access_token
    @session_access_token ||= session[:user_token] if session[:user_token]
	end
end