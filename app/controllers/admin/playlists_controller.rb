class Admin::PlaylistsController < ApplicationController
  def destroy
    @playlist = Playlist.find(params[:id])

    if @playlist.destroy
      flash[:notice] = "Your playlist has been successfully deleted."
      redirect_to root_path
    else
      flash[:alert] = "Failed to delete playlist."
      redirect_to playlist_path(@playlist)
    end
  end
end
