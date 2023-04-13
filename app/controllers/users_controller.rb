class UsersController < ApplicationController
  def new
  end

  def show

  end

  def create
    require 'pry'; binding.pry
    new_user = HelpListFacade.new(params).create_new_user
    session[:user_id] = new_user.id
    redirect_to dashboard_path
  end

  # private
  # def user_params
  #   # require 'pry'; binding.pry
  #   params.permit(:email, :password, :user_type)
  # end
end