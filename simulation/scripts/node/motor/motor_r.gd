extends Motor

class_name MotorR

func get_start_position():
	return Globals.start_position_r

func _position_changed():
	$GripL.translation.x = position/2.0
	$GripR.translation.x = -position/2.0
