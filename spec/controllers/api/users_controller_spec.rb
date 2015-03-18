require 'rails_helper'
require "tmpdir"

RSpec.describe Api::UsersController, type: :controller do
  describe "PUT update" do
    it "updates a user's commands" do
      user = User.create!(name: "Test User")
      user.api_key.access_token = "abc123"
      user.api_key.save!

      temp_path = File.expand_path "temp.json", Dir.tmpdir
      File.write temp_path, '{"api_key":"abc123", "commands":{"sudo":{"other":1}}}'

      put :update, file: Rack::Test::UploadedFile.new(temp_path, "text/json")

      expect(user.reload.commands).to eq({"sudo"=> {"other"=>1}})
    end
  end
end
