class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if !current_user
      flash[:error] = "You must be logged in to view this page"
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully registered and are logged in!"
      redirect_to dashboard_path
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.email}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Incorrect email or password"
      redirect_to root_path
    end
  end

  def logout
    session.clear
    flash[:success] = "You have been logged out"
    redirect_to root_path
  end

  private
class UsersController < ApplicationController
  def new
  end

  def show

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