class Organizations::UsersController < ApplicationController
  def show
		session[:return_to] = organization_user_path(params[:organization_id], params[:id])
    @help_list_facade = HelpListFacade.new(params)
    @session_access_token = session[:user_token] if session[:user_token]
  end
end