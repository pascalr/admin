extends Motor

class_name MotorY

# This returns the value used to adjust the zero of the axis.
func get_start_position():
	return Globals.start_position_y

func _position_changed():
	self.translation.y = position
