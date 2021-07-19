extends Motor

class_name MotorT

func get_start_position():
	return 0.0

func _position_changed():
	self.rotation.y = deg2rad(position)

func _process(delta):
	process_motor2(delta)

#func _process(delta):
#	process_motor(delta)
#
#func _ready():
#	setup(rad2deg(self.rotation.y))
#
#func _update_mesh():
#	self.rotation.y = deg2rad(start_offset - position)
#
#func _process(delta):
#	update_position(delta)
#	_update_mesh()
