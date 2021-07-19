extends Motor

class_name MotorB

func get_start_position():
	return 0.0

func _position_changed():
	self.rotation.z = deg2rad(position)

func _process(delta):
	process_motor2(delta)

#func _ready():
#	setup(rad2deg(self.rotation.z))
#
#func _update_mesh():
#	self.rotation.z = deg2rad(start_offset + position)
#
#func _process(delta):
#	update_position(delta)
#	_update_mesh()
