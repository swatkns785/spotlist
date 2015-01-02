class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(current_user)
    @user.destroy
    redirect_to new_user_registration_path
    flash[:notice] = "You have canceled your account with Spotlist"
  end
end
