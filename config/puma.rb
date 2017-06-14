#changer to match your cpu core count
workers 8
#min and max threads per worker
threads 64,128
app_dir=File.expand_path("../..",__FILE__)
shared_dir = "#{app_dir}/shared"
#default to production
#rails_env=ENV["RAILS_ENv"]||"production"
#environment rails_env

#set up socket location
#bind "unix://#{shared_dir}/sockets/puma.sock"
bind "tcp://192.168.10.166:4567"

#Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log","#{shared_dir}/log/puma.stderr.log",true

#Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state}"

app_name = 'public-bookmarks-sinatra'

application_path = "/home/zhilu/sinatra/#{app_name}"

#The directory to operate out of
directory "#{application_path}"

activate_control_app # "unix:///var/run/pumactl.sock"

preload_app!
on_worker_boot do
#	require "active_record"
#	ActiveRecord::Base.connetcion.disconnect! rescue ActiveRecord::ConnectNotEstablished
#	ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml"[rails_env])
end
