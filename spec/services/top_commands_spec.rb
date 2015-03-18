require "rails_helper"

describe "Top Commands" do
  it "finds the top commands from all users" do
    user1 = User.create!(name: "test user", commands: {"git" => {"status" => 5, "hist" => 1, "commit" => 3}})
    user2 = User.create!(name: "test user", commands: {"rake" => {"spec" => 5, "test" => 1}})
    user3 = User.create!(name: "test user", commands: {"git" => {"status" => 4, "hist" => 2, "commit" => 4}})

    expect(TopCommands.top(10)).to eq([{"git status"=>9}, {"git commit"=>7}, {"rake spec"=>5}, {"git hist"=>3}, {"rake test"=>1}])
  end
end
