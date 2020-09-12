redis_host = ENV['REDIS_HOST'] || "10.160.62.103"

require 'rack/session/redis'
use Rack::Session::Redis, :redis_server => "redis://#{redis_host}:6379/0", :expires_in => 3600

require './app'

run App
