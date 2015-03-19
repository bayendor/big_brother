class SessionsController < ApplicationController
  def create
    if login_successful?
      @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = @user.id
      set_redirect_path_and_redirect(@user)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def set_redirect_path_and_redirect(user)
    if new_user?
      redirect_to getting_started_path
    else
      redirect_to user_path(user)
    end
  end

  def login_successful?
    request.env["omniauth.auth"]
  end

  def new_user?
    user = User.find(session[:user_id])
    user.login_count == 1
  end
end
