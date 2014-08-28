class VotesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!

  def create
    @episode = Episode.find(votes_params[:episode_id])
    if current_user.votes.where(election_id: @episode.election_id).count < @episode.election.max_allowed_vote_per_user
      @episode.votes.create(votes_params.merge(user_id: current_user.id, election_id: @episode.election_id))
      respond_to do |format|
        format.html { redirect_to @episode, notice: 'Vote successful!' }
        format.json
      end
    else
      respond_to do |format|
        format.html { redirect_to @episode, alert: "Vote number per #{@episode.election.name} exceed, allow #{@episode.election.max_allowed_vote_per_user} only" }
        format.json
      end
    end
  end

  def destroy
    @episode = Episode.find(votes_params[:episode_id])
    Vote.find(params[:id]).destroy
    redirect_to @episode, notice: 'Unvote successful'
  end


private
  def votes_params
    params.require(:vote).permit(:episode_id)
  end
end
