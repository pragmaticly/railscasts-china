module OpenSSL
  module SSL
    remove_const :VERIFY_PEER
  end
end
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["RAILSCASTS_GITHUB_CLIENT_ID"], ENV["RAILSCASTS_GITHUB_CLIENT_SECRET"]
end
