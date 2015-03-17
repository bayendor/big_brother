class UsersController < ApplicationController
  # before_filter :authenticate_user!
  before_filter :correct_user?, except: [:index]
  before_action :find_user, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :commands, :picture)
  end

  def find_user
    # @user = User.find(params[:id])
    @user = User.find(1)
  end
end
