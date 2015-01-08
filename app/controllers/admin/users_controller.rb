class Admin::UsersController < ApplicationController
  before_filter :check_if_admin

  def index
    @users = User.order('id DESC')
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User successfully deleted"
      redirect_to admin_users_path
    else
      flash[:alert] = "Failed to delete user."
      redirect_to admin_users_path
    end
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
