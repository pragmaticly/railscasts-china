class EpisodesController < ApplicationController
  before_filter :admin_required, only: [:new, :create, :edit, :update]
  before_filter :fetch_episode, only: [:show, :edit, :update]

  def index
    @episodes = Episode.by_tag(params[:tag_id]).by_keywords(params[:query]).page(params[:page])
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def show
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
                                    :still, :publish, :tag_list, :seconds, :video_url, :download_url)
  end

  def fetch_episode
    @episode ||= Episode.find_by_permalink(params[:id])
  end
end
