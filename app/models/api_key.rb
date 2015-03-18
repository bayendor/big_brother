class ApiKey < ActiveRecord::Base
  belongs_to :user
  before_create :generate_access_token

  validates :access_token, uniqueness: true

  private

  def generate_access_token
    self.access_token = nil
    until access_token && !self.class.exists?(access_token: access_token)
      self.access_token = SecureRandom.hex(13)
    end
  end
end
