class VotesController < ApplicationController
  def upvote
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, review_id: params[:id])
    if @vote.new_record? == true
      @vote.entry = 1
      @vote.save
      redirect_to playlist_path(Review.find(params[:id]).playlist.id)
    end
  end

  def downvote
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, review_id: params[:id])
    if @vote.new_record? == true
      @vote.entry = -1
      @vote.save
      redirect_to playlist_path(Review.find(params[:id]).playlist.id)
    end
  end
end
