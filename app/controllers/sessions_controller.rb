class SessionsController < ApplicationController

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
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end  

	def omniauth
		if params[:provider] == "google_oauth2"
			user = HelpListFacade.new({	
																	uid: request.env['omniauth.auth'][:uid], 
																	email: request.env['omniauth.auth'][:info][:email]
																}).find_or_create
			session[:user_id] = user.id

			redirect_to dashboard_path
		elsif params[:provider] = "kroger"
			session[:user_token] = 
			Rails.cache.fetch(:user_token, expires_in: 5.seconds) do
				KrogerService.new.user_token(params[:code])
			end
      redirect_to session[:return_to]
		end
	end

	private
  def user_params
    params.permit(:email, :password, :user_type)
  end
end