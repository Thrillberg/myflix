source 'https://rubygems.org'
ruby '2.1.6'

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'rails', '4.1.1'
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'pg'
gem 'bootstrap_form'
gem 'bcrypt-ruby'
gem 'fabrication'
gem 'faker'
gem 'sidekiq'
gem 'unicorn'
gem 'figaro'
gem 'carrierwave'
gem 'carrierwave-aws'
gem 'mini_magick'
gem 'stripe'
gem 'stripe_event'
gem 'draper'

group :development do
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'letter_opener'
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails', '2.99'
end

group :test do
  gem 'database_cleaner', '1.2.0'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'capybara-email'
  gem 'vcr'
  gem 'webmock', '1.11.0'
  gem 'selenium-webdriver'
end

group :staging, :production do
  gem 'rails_12factor'
  gem 'sentry-raven'
end