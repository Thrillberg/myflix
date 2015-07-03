require 'sentry-raven'

Raven.configure do |config|
  config.dsn = ENV['RAVEN']
end