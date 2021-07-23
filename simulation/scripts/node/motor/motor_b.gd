extends Motor

class_name MotorB

func _position_changed():
	self.rotation.z = deg2rad(position)
