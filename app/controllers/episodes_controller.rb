class EpisodesController < ApplicationController

  def show
    @episode = Episode.find_by_permalink(params[:id])
  end

  def index
    @episodes = Episode.by_tag(params[:tag_name]).page(params[:page])
  end

  def new
  end

end
