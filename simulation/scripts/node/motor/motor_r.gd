extends Motor

class_name MotorR

export var is_left := true

func get_start_position():
	return 0.0

func _position_changed():
	self.translation.x = -position if is_left else position
