require 'rails_helper'

RSpec.describe User, type: :model do
  it "can update from an oauth hash" do
    hash = { "omniauth.auth"=>
             {"provider"=>"github",
              "uid"=>"123456",
              "info"=>{"email"=>"",
                       "name"=>"Somebody Else",
                       "image"=>"https://avatars.githubusercontent.com/u/123456",
                       "credentials"=>{"token"=>"b6ccdc2e4d491f97468e1724a5e3037bd285f254", "expires"=>false}}
             }
           }

    user = User.create!(github_id: hash["uid"])
    user.update_from_auth(hash)
    user.save!

    expect(user.reload.name).to eq("Somebody Else")
  end
end
