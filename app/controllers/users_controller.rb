class UsersController < ApplicationController
  def new
  end
end
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end


  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success]= "Register success"
      redirect_to @user
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit :user_id, :name, :username, :email, :password, :password_confirmation, :birthdate, :is_admin, :is_active
    end
end
