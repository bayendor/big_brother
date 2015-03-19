class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :correct_user?, except: [:index]

  def index
    @top_commands = User.top_commands(10)
    @users = User.all
    @top_editors = TopCommands.sorted_editors
  end

  def show
    @user = User.find(params[:id])
  end
end
