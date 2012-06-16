Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["RAILSCASTS_GITHUB_CLIENT_ID"], ENV["RAILSCASTS_GITHUB_CLIENT_SECRET"]
end
