extends Motor

func _ready():
	offset = self.rotation.y
	_update_mesh()

func _update_mesh():
	self.rotation.y = offset + deg2rad(position)

func _process(delta):
	update_position(delta)
	_update_mesh()
