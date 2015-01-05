class VotesController < ApplicationController
  before_action :authenticate_user!
  
  def upvote
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, review_id: params[:id])
    if @vote.new_record? == true
      @vote.entry = 1
      @vote.save
      flash[:alert] = "Your vote has been saved."
      redirect_to playlist_path(Review.find(params[:id]).playlist.id)
    elsif @vote.new_record? == false && @vote.entry == -1
      @vote.entry = 1
      @vote.save
      flash[:alert] = "Your vote has been updated."
      redirect_to playlist_path(Review.find(params[:id]).playlist.id)
    else
      flash[:alert] = "You have already up-voted for this review."
      redirect_to playlist_path(Review.find(params[:id]).playlist.id)
    end
  end

  def downvote
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, review_id: params[:id])
    if @vote.new_record? == true
      @vote.entry = -1
      @vote.save
      flash[:alert] = "Your vote has been saved."
      redirect_to playlist_path(Review.find(params[:id]).playlist.id)
    elsif @vote.new_record? == false && @vote.entry == 1
      @vote.entry = -1
      @vote.save
      flash[:alert] = "Your vote has been updated."
      redirect_to playlist_path(Review.find(params[:id]).playlist.id)
    else
      flash[:alert] = "You have already down-voted for this review."
      redirect_to playlist_path(Review.find(params[:id]).playlist.id)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:entry)
  end
end
