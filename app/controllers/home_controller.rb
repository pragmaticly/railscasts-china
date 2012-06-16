class HomeController < ApplicationController
  def index
    @episodes = [1, 2, 3] # Episode.page params[:page]
  end
end
