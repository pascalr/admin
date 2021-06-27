extends Motor

func _ready():
	setup(self.translation.y)

func _update_mesh():
	self.translation.y = start_offset + position

func _process(delta):
	update_position(delta)
	_update_mesh()
