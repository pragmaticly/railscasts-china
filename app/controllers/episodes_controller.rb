class EpisodesController < ApplicationController
  def show
    @episode = Episode.new
  end

  def index
    @episodes = Episode.by_tag(params[:tag_name]).page(params[:page])
  end
end
