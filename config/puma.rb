#changer to match your cpu core count
workers 8
#min and max threads per worker
threads 600,600
app_dir=File.expand_path("../..",__FILE__)
shared_dir = "#{app_dir}/shared"
#default to production
#rails_env=ENV["RAILS_ENv"]||"production"
#environment rails_env

#set up socket location
bind "unix://#{shared_dir}/tmp/sockets/puma.sock"
bind "tcp://192.168.10.166:4567"

#Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log","#{shared_dir}/log/puma.stderr.log",true

#Set master PID and state locations
pidfile "#{shared_dir}/tmp/pids/puma.pid"
state_path "#{shared_dir}/tmp/pids/puma.state}"
activate_control_app  "unix://#{shared_dir}/tmp/sockets/pumactl.sock"

app_name = 'public-bookmarks-sinatra'

#application_path = "/home/zhilu/sinatra/#{app_name}"

#The directory to operate out of指定项目目录
#directory "#{app_dir}/current"

# Code to run immediately before the master starts workers.
#
before_fork do
   puts "Starting workers..."
end

# Code to run in a worker before it starts serving requests.
#
# This is called everytime a worker is to be started.
#
# on_worker_boot do
#   puts 'On worker boot...'
# end

# Code to run in a worker right before it exits.
#
# This is called everytime a worker is to about to shutdown.
#
on_worker_shutdown do
   puts 'On worker shutdown...'
end

# Code to run in the master right before a worker is started. The worker's
# index is passed as an argument.
#
# This is called everytime a worker is to be started.
#
on_worker_fork do
   puts 'Before worker fork...'
end

# Code to run in the master after a worker has been started. The worker's
# index is passed as an argument.
#
# This is called everytime a worker is to be started.
#
after_worker_fork do
   puts 'After worker fork...'
end

preload_app!
#daemonize true
on_worker_boot do
    puts 'On worker boot...'
#	require "active_record"
#	ActiveRecord::Base.connetcion.disconnect! rescue ActiveRecord::ConnectNotEstablished
#	ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml"[rails_env])
end
