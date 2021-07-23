extends Motor

class_name MotorH

func _position_changed():
	self.translation.x = position
