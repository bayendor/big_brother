class User < ActiveRecord::Base
  def update_from_auth(hash)
    self.name    = hash["info"]["name"]
    self.picture = hash["info"]["image"]
  end
end
