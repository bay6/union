# config/unicorn.rb
RAILS_ROOT = File.expand_path("../..", __FILE__)

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 240
preload_app true

listen 8081, :tcp_nopush => false
listen "#{RAILS_ROOT}/tmp/sockets/union.socket"
pid "#{RAILS_ROOT}/tmp/pids/unicorn.pid"
stderr_path "#{RAILS_ROOT}/log/unicorn.err.log"
stdout_path "#{RAILS_ROOT}/log/unicorn.out.log"

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end 

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
