class User < ActiveRecord::Base
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
end
