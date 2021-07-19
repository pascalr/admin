require 'byebug'
require 'sinatra'

require './brain/globals.rb'
require './brain/polar_coord.rb'
require './brain/user_coord.rb'

# This is the brain of Heda.
#
# It communicates with the simulation and with arduino, and the user.

class Jar
  attr_reader :jar_id, :x, :y, :z
  def initialize(jar_id,x,y,z)
    @jar_id = jar_id; @x = x; @y = y; @z = z
  end
end

# The state of Heda is stored in memory here.
# But it is also saved sometimes as a backup in a file.
# (Save json object probably)
class State

  attr_reader :jars

  def initialize
    @jars = []
  end
end

STATE = State.new
$command = ""
$waiting_for_simulation = false

def send_command(cmd)
  $waiting_for_simulation = true
  $command = cmd
  puts "Sending command: #{$command}"
  while not $command.empty?
    sleep 0.02
  end
  wait_simulation_done
  puts "done"
end

def wait_simulation_done
  while $waiting_for_simulation
    sleep 0.02
  end
end

def move(axis, destination)
  send_command "m#{axis}#{destination}"
end

def goto(user_coord)
  puts "Goto #{user_coord}"
  polar = PolarCoord.new().set_from_user_coord(user_coord)
  puts "Going to #{polar}"
  move("b", polar.b)
  move("h", polar.h)
  move("y", polar.y)
  move("t", polar.t)
  move("a", polar.a)
  move("r", Globals::MAX_R)
end

def grab(obj)
  raise "Can't grab nil object." unless obj
  coord = UserCoord.new(obj.x,obj.y,obj.z,180.0)
  goto(coord)
end

def execute_command(raw_cmd)
  cmd, args = raw_cmd.split(' ',2).map(&:strip)
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
end

get '/add_jar' do
  STATE.jars << Jar.new(params[:jar_id].to_i,params[:x].to_f,params[:y].to_f,params[:z].to_f)
end

get '/grab/:jar_id' do
end

get '/execute' do
  cmd = params[:cmd]
  puts "Received command: #{cmd}"
  execute_command(cmd)
  nil
end
