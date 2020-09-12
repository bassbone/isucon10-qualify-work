redis_host = ENV['REDIS_HOST'] || "10.160.62.103"

require 'rack/session/redis'
use Rack::Session::Redis, :redis_server => "redis://#{redis_host}:6379/0", :expires_in => 3600

require './app'

require 'stackprof'

is_stackprof         = true
stackprof_mode       = (ENV['STACKPROF_MODE']       || :wall).to_sym
stackprof_interval   = (ENV['STACKPROF_INTERVAL']   || 1000).to_i
stackprof_save_every = (ENV['STACKPROF_SAVE_EVERY'] || 1).to_i
stackprof_path       =  ENV['STACKPROF_PATH']       || '/tmp/stackprof/'

use StackProf::Middleware, enabled:    is_stackprof,
                           mode:       stackprof_mode,
                           raw:        true,
                           interval:   stackprof_interval,
                           save_every: stackprof_save_every,
                           path:       stackprof_path

run App
