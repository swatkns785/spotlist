class SearchesController < ApplicationController
  def index
    @results = Playlist.search(params[:query])
  end
end
