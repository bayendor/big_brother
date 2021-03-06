require "rails_helper"

def mock_auth_hash
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    "provider"=>"github",
    "uid"=>"123456",
    "info"=>
    {"email"=>"",
     "name"=>"Somebody Else",
     "image"=>"https://avatars.githubusercontent.com/u/123456",
     "credentials"=>{"token"=>"jv93u4tighv87aueib4utg9u2i4r78fgubi827", "expires"=>false}}
  })
end

describe "github login", type: :feature do
  it "can log in with github" do
    mock_auth_hash
    visit root_path

    find_link("Login").click

    expect(page).not_to have_link("Login")
    expect(page).to have_link("Logout")
  end

  it "can log out" do
    mock_auth_hash
    visit root_path
    find_link("Login").click

    find_link("Logout").click

    expect(page).not_to have_link("Logout")
    expect(page).to have_link("Login")
  end

  it "redirects correctly on login" do
    mock_auth_hash
    visit root_path
    find_link("Login").click

    expect(current_path).to eq(getting_started_path)
    find_link("Logout").click
    user = User.find_by(github_id: "123456")

    find_link("Login").click
    expect(current_path).to eq(user_path(user))
  end
end
