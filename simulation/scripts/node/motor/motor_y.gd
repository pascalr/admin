extends Motor

class_name MotorY

func _position_changed():
	self.translation.y = position
	$WeightStack1.translation.y = -2*position
	$WeightStack2.translation.y = -2*position
