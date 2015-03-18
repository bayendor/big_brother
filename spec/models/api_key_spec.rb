require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  it 'has an access_token' do
    apikey = ApiKey.create!

    expect(apikey.access_token).to be_present
  end

  it 'is invalid if the token is not unique' do
    apikey = ApiKey.create!
    invalid_apikey = apikey.dup

    expect(invalid_apikey.save).to be false
  end

  it 'contains only hex values' do
    10.times do
      apikey = ApiKey.create!
      expect(apikey.access_token).to match(/[a-fA-Z0-9]/)
    end
  end
end
