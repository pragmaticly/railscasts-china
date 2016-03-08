require 'spec_helper'

describe EpisodesController do

  describe "GET 'index'" do
    let(:episode1) { double(:episode) }
    let(:episode2) { double(:episode) }
    let(:tagged_episodes) { [episode1] }
    let(:episodes) { [episode1, episode2] }

    before do
      Episode.stub(:by_tag).with("test").and_return(tagged_episodes)
      Episode.stub(:by_tag).with(nil).and_return(episodes)
      tagged_episodes.stub(:by_keywords).and_return(tagged_episodes)
      episodes.stub(:by_keywords).and_return(episodes)
      tagged_episodes.stub(:page).and_return(tagged_episodes)
      episodes.stub(:page).and_return(episodes)
    end

    it "returns all episodes" do
      get 'index'
      response.should be_success
      assigns[:episodes].should == episodes
    end

    it "returns tagged_episodes" do
      get 'index', tag_id: 'test'
      response.should be_success
      assigns[:episodes].should == tagged_episodes
    end
  end

  describe "GET 'show'" do
    let(:episode) { create(:episode)}
    it "returns http success" do
      get 'show', id: episode.id
      response.should be_success
    end
  end

  context "management" do
    let(:user) { double(:user) }

    before do
      controller.stub(:current_user).and_return(user)
      user.stub(:admin?).and_return(true)
    end

    describe "GET 'new'" do
      it "should render new form" do
        get 'new'
        response.should be_success
        response.should render_template('new')
      end
    end

    describe "POST 'create'" do
      let(:params) { { "name" => 'Test Episode' } }
      let(:episode) { mock_model('Episode') }

      before do
        Episode.stub(:new).with(params).and_return(episode)
      end

      it "should create the episode" do
        episode.stub(:save).and_return(true)
        post 'create', episode: params
        response.should redirect_to episode_path(episode)
        flash[:notice].should == "Episode created successfully."
      end

      it "should fail and re-render new form" do
        episode.stub(:save).and_return(false)
        post 'create', episode: params
        response.should render_template(:new)
      end
    end

    describe "GET 'edit'" do
      let(:params) { { "name" => "Updated Episode" } }
      let(:episode) { double(:episode, class: Episode) }

      before do
        Episode.stub(:find_by).and_return(episode)
      end

      it "should show the edit form" do
        get "edit", id: 'episode'
        response.should be_success
        response.should render_template("edit")
      end
    end

    describe "PATCH 'update'" do
      let(:params) { { "name" => "Updated Episode" } }
      let(:episode) { mock_model('Episode') }

      before do
        Episode.stub(:find_by).and_return(episode)
      end

      it "should update the episode" do
        episode.stub(:update_attributes).and_return(true)
        patch 'update', episode: params, id: 'update-episode'
        response.should redirect_to episode_path(episode)
        flash[:notice].should == "Episode updated successfully."
      end

      it "should fail to update the episode" do
        episode.stub(:update_attributes).and_return(false)
        patch 'update', episode: params, id: 'update-episode'
        response.should render_template("edit")
      end
    end
  end
end
