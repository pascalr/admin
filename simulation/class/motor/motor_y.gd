extends Motor

func _ready():
	setup(self.translation.y)
	_update_mesh()

func _update_mesh():
	self.translation.y = start_offset + position

func _process(delta):
	update_position(delta)
	_update_mesh()
