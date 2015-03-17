class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  after_action :clean_session

  def clean_session
    session[:user_id] = nil unless current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  private

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, alert: "Access denied."
    end
  end

  def authenticate_user!
    unless current_user
      redirect_to root_url, alert: "You need to sign in to access this page."
    end
  end
end
