class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  layout 'admin'
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully deleted.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :role)
  end

  def admin_only
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end
end
