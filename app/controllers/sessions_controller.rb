class SessionsController < ApplicationController
  def create
    if login_successful?
      @user = User.find_or_create_by(github_id: request.env["omniauth.auth"]["uid"])
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  private

  def login_successful?
    request.env["omniauth.auth"]
  end
end
