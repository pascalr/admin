extends Motor

class_name MotorA

func get_start_position():
	return 0.0

func get_position():
	return rad2deg(self.rotation.y)

func set_position(pos : float):
	self.rotation.y = deg2rad(pos)

func _process(delta):
	process_motor(delta)

#func _ready():
#	setup(rad2deg(self.rotation.y))
#
#func _update_mesh():
#	self.rotation.y = deg2rad(start_offset - position)
#
#func _process(delta):
#	update_position(delta)
#	_update_mesh()
