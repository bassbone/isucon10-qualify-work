bind 'tcp://0.0.0.0:1323'
workers 2
threads 16, 16
preload_app!
environment 'production'
stdout_redirect '/tmp/puma.stdout', '/tmp/puma.stderr'

#before_fork do
#    require 'puma_worker_killer'
#    PumaWorkerKiller.config do |config|
#        config.ram           = 2048 # mb
#        config.frequency     = 5    # seconds
#        config.percent_usage = 0.5
#        config.rolling_restart_frequency = 12 * 3600
#        config.reaper_status_logs = true
#        config.pre_term = -> (worker) { puts "Worker #{worker.inspect} being killed" }
#    end  
#    PumaWorkerKiller.start
#end