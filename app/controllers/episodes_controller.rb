class EpisodesController < ApplicationController
  before_action :admin_required, only: [:new, :create, :edit, :update]
  before_action :fetch_episode, only: [:show, :edit, :update]

  def index
    @episodes = Episode.published.by_tag(params[:tag_id]).by_keywords(params[:query]).page(params[:page])
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def show
    @vote = @episode.votes.find_or_initialize_by(user_id: current_user.id) if current_user.present?
  end

  def edit
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      redirect_to @episode, notice: "Episode created successfully."
    else
      render :new
    end
  end

  def update
    if @episode.update_attributes(episode_params)
      redirect_to @episode, notice: "Episode updated successfully."
    else
      render :edit
    end
  end

private
  def episode_params
    params.require(:episode).permit(:name, :permalink, :notes, :description,
                                    :still, :publish, :tag_list, :seconds, :video_url, :download_url, :election_id,
                                    :allow_download, :allow_comment)
  end

  def fetch_episode
    @episode ||= Episode.find_by(permalink: params[:id])
  end
end
