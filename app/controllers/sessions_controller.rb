class SessionsController < ApplicationController
  # before_action :set_current_user

	def login
		new_user = HelpListFacade.new(user_params).authenticate_user

		if new_user
			session[:user_id] = new_user.id
			redirect_to dashboard_path
		else
      flash[:success] = "Incorrect password or email."
			redirect_to root_path
		end
  end

  def logout
    session.clear
    flash[:success] = "You have been logged out"
    redirect_to root_path
  end

  # private

  # def set_current_user
  #   @current_user = User.find_by(id: session[:user_id])
  # end
	private
  def user_params
    params.permit(:email, :password, :user_type)
  end
end