class VotesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!

  def create
    @episode = Episode.find(votes_params[:episode_id])
    @episode.votes.create(votes_params.merge(user_id: current_user.id))
    respond_to do |format|
      format.html { redirect_to @episode, notice: 'Vote successful!' }
      format.json
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
