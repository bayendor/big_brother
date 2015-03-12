require "simplecov"
SimpleCov.start
require "omniauth"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  OmniAuth.config.test_mode = true
  OmniAuth.config.logger = Logger.new(StringIO.new)

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
