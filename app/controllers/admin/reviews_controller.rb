class Admin::ReviewsController < ApplicationController
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Review successfully deleted."
      redirect_to playlist_path(@review.playlist_id)
    else
      flash[:alert] = "Failed to delete review."
      redirect_to playlist_path(@playlist)
    end
  end
end
