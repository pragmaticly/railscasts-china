class EpisodesController < ApplicationController
  def show
  end

  def index
    @episodes = Episode.all
  end
end
