require 'raven'

Raven.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.dsn = ENV['RAVEN']
  end
end