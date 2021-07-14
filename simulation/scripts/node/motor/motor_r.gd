extends Motor

export var is_left := true

func _ready():
	setup(self.translation.z)

func _update_mesh():
	if is_left:
		self.translation.z = start_offset - position
	else:
		self.translation.z = start_offset + position

func _process(delta):
	update_position(delta)
	_update_mesh()
