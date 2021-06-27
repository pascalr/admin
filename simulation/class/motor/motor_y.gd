extends Motor

func _ready():
	offset = self.translation.y
	_update_mesh()

func _update_mesh():
	self.translation.y = offset + position

func _process(delta):
	update_position(delta)
	_update_mesh()
