class SessionsController < ApplicationController
  def create
    if login_successful?
      @user = User.find_or_create_by(github_id: request.env["omniauth.auth"]["uid"])
      @user.update_from_auth(request.env["omniauth.auth"])
      @user.save!
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def login_successful?
    request.env["omniauth.auth"]
  end
end
