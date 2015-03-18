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

  def top_commands
    commands.map do |key, value|
      if commands[key].is_a?(Hash)
        commands[key].map { |k,v| "#{key} #{k}: #{v}" }
      else
        "#{key}: #{value}"
      end
    end.flatten
  end

  private

  def generate_apikey
    ApiKey.create(user: self)
  end
end
