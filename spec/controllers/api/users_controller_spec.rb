require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe "PUT update" do
    it "updates a user's commands" do
      user = User.create!(name: "Test User", github_id: "abc123")
      patch :update, "big_bro"=>'{"api_key":"abc123", "commands":{"sudo":{"other":1}}}'

      expect(user.reload.commands).to eq({"sudo"=> {"other"=>1}})
    end
  end
end
