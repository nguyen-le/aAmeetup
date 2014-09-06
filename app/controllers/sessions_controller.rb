class SessionsController < ApplicationController
  before_action :no_login_twice, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params[:name], user_params[:password])

    if @user
      login!(@user)
      redirect_to '/home'
    else
      flash.now[:notices] = ["Invalid name/password combination"]
      @user = User.new(name: user_params[:name])
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def no_login_twice
    if logged_in?
      redirect_to events_url
    end
  end

end
