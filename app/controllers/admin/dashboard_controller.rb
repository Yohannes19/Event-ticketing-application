class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  layout 'admin'

  def index
    @events = Event.all
    @users = User.all
  end

  private

  def admin_only
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end
end
