extends Motor

class_name MotorB

func _ready():
	setup(rad2deg(self.rotation.x))

func _update_mesh():
	self.rotation.x = deg2rad(start_offset + position)

func _process(delta):
	update_position(delta)
	_update_mesh()
