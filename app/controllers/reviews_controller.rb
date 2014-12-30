class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @playlist = Playlist.find(params[:playlist_id])
    #@review = @playlist.reviews.new(review_params)
    @review = Review.new(review_params)
    @review.user = current_user
    @review.playlist_id = Playlist.find(params[:playlist_id]).id
    if @review.save
      flash[:notice] = "You have successfully created a review"
      redirect_to playlist_path(@playlist)
    else
      flash[:notice] = "You have missing fields"
      render 'playlists/show'
    end
  end

  private

  def review_params
      params.require(:review).permit(:rating, :description)
  end
end
