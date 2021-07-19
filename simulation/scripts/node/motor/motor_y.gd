extends Motor

class_name MotorY

# This returns the value used to adjust the zero of the axis.
func get_start_position():
	return Globals.start_position_y

func get_position():
	return self.translation.y

func set_position(pos : float):
	self.translation.y = pos

func _process(delta):
	process_motor(delta)
