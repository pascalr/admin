extends Motor

class_name MotorR

func _position_changed():
	$GripL.translation.x = position/2.0
	$GripR.translation.x = -position/2.0
