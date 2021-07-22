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

	# return the first valid solution
	self.set_from_user_coord_and_t(coord, -_t)
	var _first_try
	if self.invalid_destination():
		_first_try = self.error
		self.error = ""
		self.set_from_user_coord_and_t(coord, _t)
	
	assert(!self.invalid_destination())

	return self

func _to_string():
	return "("+str(h)+","+str(y)+","+str(t)+","+str(a)+","+str(b)+")"
