class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :check_api_key

  def update
    @user = User.from_api_key(@api_key.access_token)
    if @user
      @user.update(commands: merge_in_new_commands(@user))
      render json: @user
    else
      render json: {"message" => "Sorry, that isn't a valid api key"}
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
    @api_key = ApiKey.find_by(access_token: big_bro_params["api_key"])
    head :unauthorized unless @api_key
  end
end
