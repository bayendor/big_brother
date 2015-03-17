class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :check_api_key

  def update
    @user = User.find_by(github_id: big_bro_params["api_key"])
    @user.update(commands: merge_in_new_commands(@user))
    if @user.save
      render json: @user
    end
  end

  private

  def merge_in_new_commands(user)
    current_commands = user.commands
    new_commands     = big_bro_params["commands"]
    current_commands.deep_merge(new_commands) { |_key, old, new| old + new }
  end

  def big_bro_params
    JSON.parse(params["big_bro"])
  end

  def check_api_key
    api_key = ApiKey.find_by(access_token: params[:access_token])
    head :unauthorized unless api_key
  end
end
