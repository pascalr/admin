extends Motor

class_name MotorA

func _position_changed():
	self.rotation.y = -deg2rad(position)
