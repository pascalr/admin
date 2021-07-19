require 'byebug'

require './brain/globals.rb'
require './brain/models.rb'
require './brain/polar_coord.rb'
require './brain/user_coord.rb'
require './brain/simulation.rb'
require './brain/server.rb'

# This is the brain of Heda.
#
# It communicates with the simulation and with arduino, and the user.

STATE = State.new
$command = ""

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

