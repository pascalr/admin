extends Motor

func _ready():
	offset = self.translation.x
	_update_mesh()

func _update_mesh():
	self.translation.x = offset - position

func _process(delta):
	update_position(delta)
	_update_mesh()
