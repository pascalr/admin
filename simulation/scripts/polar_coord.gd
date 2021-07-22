class_name PolarCoord

var h : float
var y : float
var t : float
var a : float 
var b : float
var error := ""

func set_a(_a):
	self.a = _a
	if _a > Globals.robot.wrist.max_position:
		self.a = _a - 360.0
	elif _a < Globals.robot.wrist.min_position:
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
	for motor in Globals.robot.motors:
		var err = motor.test_position(self.get(motor.id))
		if err:
			error += err
#	if h < Globals.robot.trolley.min_position or h > Globals.robot.trolley.max_position:
#		error += "Invalid h. Got " + str(h)
#	elif y < Globals.robot.support.min_position or y > Globals.robot.support.max_position:
#		error += "Invalid y. Got " + str(y)
#	elif t < Globals.robot.humerus.min_position or t > Globals.robot.humerus.max_position:
#		error += "Invalid t. Got " + str(t)
#	elif a < Globals.robot.wrist.min_position or a > Globals.robot.wrist.max_position:
#		error += "Invalid a. Got " + str(a)
#	elif b < Globals.robot.hand.min_position or b > Globals.robot.hand.max_position:
#		error += "Invalid b. Got " + str(b)
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

#export(float) var h
#export(float) var y
#export(float) var t
#export(float) var a
#export(float) var b
#export(float) var rw
#
#func _init(h=null, y=null, t=null, a=null, b=null, r=null):
#	self.h = h; self.y = y; self.t = t; self.a = a; self.b = b; self.r = r
#
#func _to_string():
#	return "("+str(h)+","+str(y)+","+str(t)+","+str(a)+","+str(b)+","+str(r)+")"
#
#func values():
#	return [h,y,t,a,b,r]
#
#func copy(coord):
#	self.h = coord.h; self.y = coord.y; self.t = coord.t;
#	self.a = coord.a; self.b = coord.b; self.r = coord.r
#	return self
#
#func set_value(i: int, val):
#	match i:
#		0:
#			h = val
#		1:
#			y = val
#		2:
#			t = val
#		3:
#			a = val
#		4:
#			b = val
#		5: 
#			r = val
#		_:
#			print("ERROR INVALID POLAR COORD SET_VALUE")
#
#func equals(coord):
#	self.values == coord.values
