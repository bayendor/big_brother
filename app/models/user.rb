class User < ActiveRecord::Base
  def update_from_auth(hash)
    self.name    = hash["omniauth.auth"]["info"]["name"]
    self.picture = hash["omniauth.auth"]["info"]["image"]
  end
end
