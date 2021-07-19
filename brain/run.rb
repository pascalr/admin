require 'sinatra'

# This is the brain of Heda.
#
# It communicates with the simulation and with arduino, and the user.

class Jar
  def initialize(x,y,z)
    @x = x; @y = y; @z = z
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

sent = false

get '/' do
  'Hello world!'
end

# TODO: Make sure only the simulation can use this
get '/poll' do
  if sent
    '...'
  else
    sent = true
    'move x,y,z'
  end
end

get '/add_jar' do
  @state.jars << Jar.new(params[:x],params[:y],params[:z])
end

get '/execute' do
  cmd = params[:cmd]
  puts "Received command: #{cmd}"
  nil
end
