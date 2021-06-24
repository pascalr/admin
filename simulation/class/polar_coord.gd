class_name PolarCoord

export var h = 0.0
export var y = 0.0
export var t = 0.0
export var a = 0.0
export var b = 0.0
export var r = 0.0

func _init():
	pass

func _to_string():
	return "("+str(h)+","+str(y)+","+str(t)+","+str(a)+","+str(b)+","+str(r)+")"
	
# y10.0x20a90.0
func init_from_string(s):
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]\\d+")
	for result in regex.search_all(s):
		var r = result.get_string()
		set(r[0], float(r.substr(1)))
	print(self)
	return 1
