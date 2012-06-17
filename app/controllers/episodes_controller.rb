class EpisodesController < ApplicationController
  def show
    @episode = Episode.new
  end

  def index
    @episodes = Episode.page(params[:page])
  end
end
