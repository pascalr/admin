require 'sinatra'
set :app_file, __FILE__
set :run, true

def execute_command(raw_cmd)
  cmd, raw_args = raw_cmd.split(' ',2).map(&:strip)
  args = raw_args.nil? ? nil : raw_args.split(',').map(&:strip)
  puts "cmd: #{cmd}"
  puts "args: #{args}"
  if cmd == "grab"
    grab(STATE.jars.find {|j| j.jar_id == args[0].to_i})
  elsif cmd == "move"
    move(args[0],args[1].to_f)
  end
end

get '/poll' do
  r = $command.dup
  $command.clear
  r
end

get '/done' do
  $waiting_for_simulation = false
  nil
end

get '/add_jar' do
  STATE.jars << Jar.new(params[:jar_id].to_i,params[:x].to_f,params[:y].to_f,params[:z].to_f)
  nil
end

get '/execute' do
  cmd = params[:cmd]
  puts "Received command: #{cmd}"
  execute_command(cmd)
  nil
end

get '/exit' do
  Process.kill('TERM', Process.pid)
end

get '/fail' do
  Process.kill('KILL', Process.pid)
end
