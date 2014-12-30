class ReviewsController < ApplicationController
  def create
    @playlist = Playlist.find(params[:playlist_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.playlist = @playlist
    if @review.save
      flash[:notice] = "You have successfully created a review"
      redirect_to playlist_path(@playlist)
    else
      flash[:alert] = "You have missing fields"
      render "playlists/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
