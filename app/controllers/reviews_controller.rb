class ReviewsController < ApplicationController
  def create
    @playlist = Playlist.find(params[:playlist_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.playlist = @playlist
    if user_signed_in?
      if @review.save
        flash[:notice] = "You have successfully created a review"
        redirect_to playlist_path(@playlist)
        UserMailer.review_notification(@playlist).deliver_now
      else
        render "playlists/show"
      end
    else
      flash[:alert] = "You must be signed in to leave a review."
      redirect_to playlist_path(@playlist)
    end
  end

  def edit
    @playlist = Playlist.find(params[:playlist_id])
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if user_signed_in?
      if @review.update_attributes(review_params)
        flash[:notice] = "You have successfully updated your review"
        redirect_to playlist_path(params[:playlist_id])
      else
        render :edit
      end
    else
      flash[:alert] = "You must be signed in to update a review."
      render :edit
    end
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to playlist_path(@playlist)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
