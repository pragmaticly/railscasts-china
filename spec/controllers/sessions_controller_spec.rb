require 'spec_helper'

describe SessionsController do

  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = {
        'uid' => '12345',
        'provider' => 'github',
        'info' => {
          'name' => 'Dingding Ye'
        }
      }
  end

  describe "GET 'new'" do
    it "redirectes users to authentication" do
      get 'new'
      assert_redirected_to '/auth/github'
    end
  end

  describe "creates new user" do
    it "should create new user and redirect to root_url" do
      visit '/signin'
      page.should have_content('Signed in!')
      page.should have_content('Dingding Ye')
    end

    it "should retrieve usser and redirect to root_url" do
      create(:user)
      visit '/signin'
      page.should have_content('Signed in!')
      page.should have_content('Dingding Ye')
    end
  end

  describe "log out" do
    it "should log user out" do
      visit '/signout'
      page.should have_content('Signed out!')
    end
  end

  describe "fail to log in" do
    it "should show the error message" do
      visit '/auth/failure?message=Invalid'
      page.should have_content('Authentication error: Invalid')
    end
  end
end
