class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def create

    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id

    if @playlist.save
      redirect_to playlist_path(@playlist)
      flash[:notice] = "Your playlist has been successfully added."
    else
      render :new
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:title, :url, :description, :user_id)
  end


end
