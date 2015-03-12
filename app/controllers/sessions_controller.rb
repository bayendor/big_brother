class SessionsController < ApplicationController
  def create
    if login_successful?
      @user = User.from_omniauth(request.env["omniauth.auth"])
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
