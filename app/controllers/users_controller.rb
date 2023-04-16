class UsersController < ApplicationController
  def new
    
  end

  def show
		@user = current_user
    @wishlist_items = HelpListFacade.new.get_wishlist_items(@user.id)
  end

  def create
		new_user = HelpListFacade.new(user_params).create_new_user
    unless new_user.is_a?(User)
      errors =  new_user.map do |error|
        error[:title]
      end
      flash[:error] = errors.join(". ")+ "."
      redirect_to register_path
    else
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    end
  end

  private
  def user_params
    params.permit(:email, :password, :user_type)
  end
end