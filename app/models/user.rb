class User < ActiveRecord::Base
  has_one :api_key
  serialize :commands, ActiveRecord::Coders::NestedHstore
  after_create :generate_apikey

  def self.from_omniauth(hash)
    user = first_or_create(github_id: hash["uid"])
    user.update_from_auth(hash)
    user
  end

  def update_from_auth(hash)
    self.name    = hash["info"]["name"]
    self.picture = hash["info"]["image"]
    save!
  end

  def most_used_command
    sorted_commands.first.keys.first
  end

  def sorted_commands
    commands_array.sort_by { |pair| -pair.values.first }
  end

  private

  def generate_apikey
    ApiKey.create(user: self)
  end

  def commands_hash
    commands.each_with_object({}) do |(first_cmd, sub_commands), total|
      sub_commands.each do |second_cmd, amt|
        command = [first_cmd, second_cmd].join(" ").strip
        total[command] = amt
      end
    end
  end

  def commands_array
    commands_hash.inject([]) do |memo, (k,v)|
      memo << {k => v}
    end
  end
end
