extends Motor

class_name MotorT

func _position_changed():
	self.rotation.y = -deg2rad(position)
