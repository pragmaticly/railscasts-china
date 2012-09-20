class CommentsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!
  before_filter :fetch_episode


  def index
    @comments = Comment.all
  end

  def create
    @comment = @episode.comments.create(episode_params.merge(user_id: current_user.id))
    respond_to do |format|
      format.html { redirect_to @episode }
      format.json
    end
  end

  def edit
  end

  def update
  end

  private

  def episode_params
    ep = params.require(:comment).permit(:content, :parent_id)
    parent_id = ep.delete(:parent_id)
    if parent_id
      ep.merge!(parent: Comment.find(parent_id))
    end
    ep
  end

  def fetch_episode
    @episode = Episode.find_by_permalink(params[:episode_id])
  end
end
