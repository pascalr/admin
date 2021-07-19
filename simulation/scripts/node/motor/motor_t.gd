extends Motor

class_name MotorT

func get_start_position():
	return 0.0

func _position_changed():
	self.rotation.y = -deg2rad(position)
