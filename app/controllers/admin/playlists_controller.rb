class Admin::PlaylistsController < ApplicationController
  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    flash[:notice] = "Your playlist has been successfully deleted."

    redirect_to root_path
  end
end
