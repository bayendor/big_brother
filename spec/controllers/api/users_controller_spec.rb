require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe "PUT update" do
    it "updates a user's commands" do
      user = User.create!(name: "Test User")
      user.api_key.access_token = "abc123"
      user.api_key.save!
      put :update, "big_bro"=>'{"api_key":"abc123", "commands":{"sudo":{"other":1}}}'

      expect(user.reload.commands).to eq({"sudo"=> {"other"=>1}})
    end
  end
end
