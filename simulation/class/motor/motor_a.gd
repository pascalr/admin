extends Motor

func _ready():
	setup(rad2deg(self.rotation.y))
	_update_mesh()

func _update_mesh():
	self.rotation.y = deg2rad(start_offset + position)

func _process(delta):
	update_position(delta)
	_update_mesh()
