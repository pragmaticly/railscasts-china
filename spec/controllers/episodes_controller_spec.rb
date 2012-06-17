require 'spec_helper'

describe EpisodesController do

  describe "GET 'show'" do
    let(:episode) { create(:episode)}
    it "returns http success" do
      get 'show', id: episode.id
      response.should be_success
    end
  end

end
