source "https://rubygems.org"

gem "rails", "4.2.0"

gem "dotenv-rails", groups: [:development, :test]
gem "pg"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", group: :doc
gem "bootstrap-sass", "~> 3.3.3"
gem "unicorn"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "byebug"
  gem "web-console", "~> 2.0"
  gem "spring"
  gem "rspec-rails", "~> 3.0"
  gem "simplecov", require: false, group: :test
end

group :production, :staging do
  gem "rails_12factor"
end
