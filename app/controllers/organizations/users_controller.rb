class Organizations::UsersController < ApplicationController
  def show
    @help_list_facade = HelpListFacade.new(params)
  end
end