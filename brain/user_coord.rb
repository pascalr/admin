class UserCoord
  attr_accessor :x, :y, :z, :angle, :b

  def initialize(x,y,z,angle,b=0.0)
    @x = x; @y = y; @z = z; @angle = angle; @b = b
  end

  def to_s
    "(#{@x},#{@y},#{@z},#{@angle},#{@b})"
  end
end

#func set_from_vector(vector:Vector3,_angle:float,_b:float=0.0):
#	self.x = vector.x
#	self.y = vector.y
#	self.z = vector.z
#	self.angle = _angle
#	self.b = _b
#	return self
#
#func set_from_units(_x:float,_y:float,_z:float,_angle:float,_b:float=0.0):
#	self.x = _x
#	self.y = _y
#	self.z = _z
#	self.angle = _angle
#	self.b = _b
#	return self
#
#func _to_string():
#	return "("+str(x)+","+str(y)+","+str(z)+","+str(angle)+","+str(b)+")"
#
