class_name PolarCoord

var h : float
var y : float
var t : float
var a : float 
var b : float
var error := ""

func set_a(_a):
	self.a = _a
	if _a > Heda.robot.wrist.max_position:
		self.a = _a - 360.0
	elif _a < Heda.robot.wrist.min_position:
		self.a = _a + 360.0

func set_from_units(_h,_y,_t,_a,_b=0.0):
	h=_h; y=_y; t=_t; a=_a; b=_b
	return self

func set_from_user_coord_and_t(coord : UserCoord, _t : float):
	self.y = coord.y
	self.t = _t
	set_a(coord.angle - _t)
	self.b = coord.b

	var elbow_x = coord.x + sin(coord.angle / 180.0 * PI) * Globals.humerus_length
	self.h = elbow_x - (sin(t / 180.0 * PI) * Globals.humerus_length)

	return self

func invalid_destination():
	for motor in Heda.robot.motors:
		var err = motor.test_position(self.get(motor.id))
		if err:
			error += err
	return !error.empty()
	

func set_from_user_coord(coord : UserCoord):
	
	# Given the ending position and angle of the forearm, we can
	# calculate the position of the elbow.
	var dz = cos(coord.angle / 180.0 * PI) * Globals.forearm_grip_length
	var elbow_z = coord.z - dz # WHYYY minus??? Seems to work...
	
	# There are then 2 positions possible for the trolley.
	# Also, maybe it is impossible for the arm to be get
	# at this position with this angle.
	var _t = acos((Globals.trolley_z - elbow_z)/Globals.humerus_length)*180.0/PI
	assert(!is_nan(_t))

	self.set_from_user_coord_and_t(coord, -_t)
	var neg_t_h = self.h
	var neg_t_valid = invalid_destination()
	
	self.set_from_user_coord_and_t(coord, _t)
	
	if neg_t_valid and invalid_destination():
		return self.set_from_user_coord_and_t(coord, -_t)
	elif !neg_t_valid and !invalid_destination():
		return self
	elif !neg_t_valid:
		push_error("Invalid polar coord destination.")

	# return the solution with h closest to the middle	
	var middle_h = (Heda.robot.trolley.min_position + Heda.robot.trolley.max_position)/2.0
	if abs(self.h - middle_h) < abs(neg_t_h - middle_h):
		return self
	else:
		self.set_from_user_coord_and_t(coord, -_t)

	return self

func _to_string():
	return "("+str(h)+","+str(y)+","+str(t)+","+str(a)+","+str(b)+")"
