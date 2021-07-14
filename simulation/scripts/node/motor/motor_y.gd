extends Motor

export var reverse = false

func _ready():
	setup(self.translation.y)

func _update_mesh():
	if reverse:
		self.translation.y = start_offset - position
	else:
		self.translation.y = start_offset + position

func _process(delta):
	update_position(delta)
	_update_mesh()
