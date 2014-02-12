class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path,notice: 'User Successfully.'
    else
      render action: 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path ,notice: 'User Deleted .'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :name,:address,:city,:state,:zip,:school_received_degree_form,:years_in_practice,:role,:password,:password_confirmation)
  end


end
