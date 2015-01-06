class Admin::UsersController < ApplicationController
  before_filter :check_if_admin

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path
  end

  protected

  def check_if_admin
    if current_user.admin?
    else
      flash[:notice] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end
end
