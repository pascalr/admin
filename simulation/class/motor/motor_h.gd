extends Motor

func _ready():
	setup(self.translation.x)

func _update_mesh():
	self.translation.x = start_offset - position

func _process(delta):
	update_position(delta)
	_update_mesh()
