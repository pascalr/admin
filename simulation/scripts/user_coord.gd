class_name UserCoord

var x : float
var y : float
var z : float
var angle : float
var b : float

func set_from_vector(vector:Vector3,_angle:float,_b:float=0.0):
	self.x = vector.x
	self.y = vector.y
	self.z = vector.z
	self.angle = _angle
	self.b = _b
	return self

func set_from_units(_x:float,_y:float,_z:float,_angle:float,_b:float=0.0):
	self.x = _x
	self.y = _y
	self.z = _z
	self.angle = _angle
	self.b = _b
	return self

func set_from_polar(polar):
	self.y = polar.y
	self.b = polar.b
	self.angle = polar.a + polar.t
	var elbow_x = polar.h + sin(polar.t*PI/180.0)*Globals.humerus_length
	var elbow_z = Globals.trolley_z - cos(polar.t*PI/180.0)*Globals.humerus_length
	self.x = elbow_x - sin(angle*PI/180.0)*Globals.forearm_grip_length
	self.z = elbow_z + cos(angle*PI/180.0)*Globals.forearm_grip_length
	return self

func _to_string():
	return "(%.2f,%.2f,%.2f,%.2f,%.2f)" % [x,y,z,angle,b]
	#return "("+str(x)+","+str(y)+","+str(z)+","+str(angle)+","+str(b)+")"
