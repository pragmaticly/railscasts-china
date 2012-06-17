class EpisodesController < ApplicationController
  def show
    @episode = Episode.new
  end
end
