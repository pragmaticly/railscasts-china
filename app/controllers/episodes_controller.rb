class EpisodesController < ApplicationController

  def show
    @episode = Episode.find_by_permalink(params[:id])
  end

  def index
    @episodes = Episode.by_tag(params[:tag_name]).page(params[:page])
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


  private

    def episode_params
      params.require(:episode).permit(:name, :permalink, :notes,
                                      :description, :still, :duration, :publish)
    end


end
