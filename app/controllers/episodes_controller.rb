class EpisodesController < ApplicationController
  def show
    @episode = Episode.new
  end

  def index
    @episodes = Episode.all
  end
end
