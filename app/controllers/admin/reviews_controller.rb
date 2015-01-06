class Admin::ReviewsController < ApplicationController
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to playlist_path(@review.playlist_id)
  end
end
