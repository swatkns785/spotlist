class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      @user.profile_photo = "http://sellleadsucceed.files.wordpress.com/2014/02/bigstock-silhouette-with-a-question-mar-59367497.jpg"
    else
      redirect_to user_path(@user)
    end
  end

end
