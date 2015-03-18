require 'rails_helper'

RSpec.describe User, type: :model do
  it "can update from an oauth hash" do
    hash = {"provider"=>"github",
            "uid"=>"123456",
            "info"=>{"email"=>"",
                     "name"=>"Somebody Else",
                     "image"=>"https://avatars.githubusercontent.com/u/123456",
                     "credentials"=>{"token"=>"b6ccdc2e4d491f97468e1724a5e3037bd285f254", "expires"=>false}}
           }

    user = User.from_omniauth(hash)

    expect(user.reload.name).to eq("Somebody Else")
  end

  it "can find its top commands" do
    user = User.create(name: "test user")
    user.commands = {"git" => {"status" => 5, "hist" => 1, "commit" => 3}}
    user.save!

    expect(user.top_commands).to eq(["git status: 5", "git commit: 3", "git hist: 1"])
  end
end
