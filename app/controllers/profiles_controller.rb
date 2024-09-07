class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @organized_events = @user.organized_events
    @tickets = @user.tickets.includes(:event)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: "Profule updated Successfully"
    else
       render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :profile_picture)
  end
end