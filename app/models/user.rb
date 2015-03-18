class User < ActiveRecord::Base
  has_one :api_key
  serialize :commands, ActiveRecord::Coders::NestedHstore
  after_create :generate_apikey

  def self.from_api_key(token)
    ApiKey.find_by(access_token: token).try(:user)
  end

  def self.from_omniauth(hash)
    user         = first_or_create(github_id: hash["uid"])
    user.update_from_auth(hash)
    user
  end

  def update_from_auth(hash)
    self.name    = hash["info"]["name"]
    self.picture = hash["info"]["image"]
    save!
  end

  private

  def generate_apikey
    ApiKey.create(user: self)
  end
end
