class UsersController < ApplicationController
  before_action :must_be_logged_in, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if verification_passed?
      if @user.save
        login!(@user)
        redirect_to events_url
      else
        flash.now[:notices] =  @user.errors.full_messages
        render :new
      end
    else
      flash.now[:notices] = ["Verification failed!"]
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      flash.now[:notices] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_url
  end

  def home
    @features = Feature.all
    @recent_events   = Event.where("events.date < ?", Time.now)
    @upcoming_events = Event.where("events.date > ?", Time.now)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def verification_passed?
    string = params[:verify].downcase
    string.include?("rails") && string.include?("backbone")
  end

end
