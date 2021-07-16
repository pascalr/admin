class_name PolarCoord

#export(float) var h
#export(float) var y
#export(float) var t
#export(float) var a
#export(float) var b
#export(float) var r
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
