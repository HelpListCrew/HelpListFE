class Organizations::UsersController < ApplicationController
  def show
    @help_list_facade = HelpListFacade.new(params)
    # @session_access_token = session[:access_token] if session[:access_token]
  end
end