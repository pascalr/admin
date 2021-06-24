class_name PolarCoord

export(float) var h
export(float) var y
export(float) var t
export(float) var a
export(float) var b
export(float) var r

func _init(h=0.0, y=0.0, t=0.0, a=0.0, b=0.0, r=0.0):
	self.h = h; self.y = y; self.t = t; self.a = a; self.b = b; self.r = r

func _to_string():
	return "("+str(h)+","+str(y)+","+str(t)+","+str(a)+","+str(b)+","+str(r)+")"

func values():
	return [h,y,t,a,b,r]

func set_value(i: int, val):
	match i:
		0:
			h = val
		1:
			y = val
		2:
			t = val
		3:
			a = val
		4:
			b = val
		5: 
			r = val
		_:
			print("ERROR INVALID POLAR COORD SET_VALUE")

func equals(coord):
	self.values == coord.values
	
# y10.0x20a90.0
func init_from_string(s):
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]\\d+")
	for result in regex.search_all(s):
		var r = result.get_string()
		set(r[0], float(r.substr(1)))
	return self
