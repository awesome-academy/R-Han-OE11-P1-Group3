class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update)
  before_action :correct_user, only: %i(edit update)

  def index
    @user = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      login_url @user
      flash[:success]= "Register success"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def set_user
    @user = User.find_by params[:id]
  end

  def user_params
    params.require(:user).permit :user_id, :name, :username, :email, :password, :password_confirmation, :birthdate, :is_admin, :is_active
  end
end
