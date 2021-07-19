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
