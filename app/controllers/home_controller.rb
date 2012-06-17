class HomeController < ApplicationController
  def index
    @episodes = Episode.page params[:page]
  end
end
