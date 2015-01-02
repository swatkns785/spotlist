class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
    @review = Review.new
    # @upvotes = Vote.find(review_id = params(id)
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user

    if @playlist.save
      redirect_to playlist_path(@playlist)
      flash[:notice] = "Your playlist has been successfully added."
    else
      render :new
    end
  end

  def edit
    @playlist = current_user.playlists.find(params[:id])
  end

  def update
    @playlist = current_user.playlists.find(params[:id])
    if @playlist.update(playlist_params)
      redirect_to playlist_path(@playlist)
      flash[:notice] = "Your playlist has been successfully updated."
    else
      render :edit
      flash[:alert] = "Please fill out the forms correctly."
    end
  end

  def destroy
    @playlist = current_user.playlists.find(params[:id])
    @playlist.destroy
    flash[:notice] = "Your playlist has been successfully deleted."
    redirect_to root_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:title, :url, :description)
  end
end
