require 'sinatra'

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

@state = State.new

#func move(axis, destination):
#	Controller.send("m"+axis+str(destination))
#
#func goto(user_coord):
#	print("Goto "+str(user_coord))
#	var polar = PolarCoord.new().set_from_user_coord(user_coord)
#	print("Going to "+str(polar))
#	move("b", polar.b)
#	move("h", polar.h)
#	move("y", polar.y)
#	move("t", polar.t)
#	move("a", polar.a)
#	move("r", Globals.max_r)
#
#func grab(obj):
#	print("Grabing")
#	var dest = obj.translation+Vector3(0.0,obj.get_height()-20.0,0.0)
#	goto(UserCoord.new().set_from_vector(dest, 180.0))
#	move("r", obj.diameter)

#def grab(obj)
#  goto(UserCoord.new().set_from_vector(dest, 180.0))
#end

get '/poll' do
end

get '/add_jar' do
  @state.jars << Jar.new(params[:jar_id],params[:x],params[:y],params[:z])
end

get '/grab/:jar_id' do
end

get '/execute' do
  cmd = params[:cmd]
  puts "Received command: #{cmd}"
  nil
end
