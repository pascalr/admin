extends Motor

class_name MotorH

func get_start_position():
	return Globals.start_position_h

func _position_changed():
	self.translation.x = position
