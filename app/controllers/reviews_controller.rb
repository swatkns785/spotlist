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

  def edit
    @playlist = Playlist.find(params[:playlist_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @playlist = Playlist.find(params[:playlist_id])

    if @review.update_attributes(review_params)
      flash[:notice] = "You have successfully updated your review"
      redirect_to playlist_path(params[:playlist_id])
    else
      render 'reviews/edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
