extends Motor

class_name MotorB

func get_start_position():
	return 0.0

func _position_changed():
	self.rotation.z = deg2rad(position)
