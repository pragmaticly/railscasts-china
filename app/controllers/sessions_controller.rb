class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    redirect_to '/auth/github'
  end

  def create
    auth = request.env["omniauth.auth"]
    auth['uid'] = auth['uid'].to_s
    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
