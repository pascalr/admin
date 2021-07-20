extends Motor

class_name MotorR

func get_start_position():
	return 0.0

func _position_changed():
	$GripL.translation.x = -position
	$GripR.translation.x = position
