class UsersController < ApplicationController
  def new
    
  end

  def show
		@user = current_user
  end

  def create
		new_user = HelpListFacade.new(user_params).create_new_user
    session[:user_id] = new_user.id
    redirect_to dashboard_path
  end



  private
  def user_params
    params.permit(:email, :password, :user_type)
  end

end