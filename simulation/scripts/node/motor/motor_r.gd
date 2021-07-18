extends Motor

class_name MotorR

export var is_left := true

func _ready():
	setup(self.translation.x)

func _update_mesh():
	if is_left:
		self.translation.x = start_offset + position
	else:
		self.translation.x = start_offset - position

func _process(delta):
	update_position(delta)
	_update_mesh()
