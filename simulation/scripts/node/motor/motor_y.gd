extends Motor

class_name MotorY

export var reverse = false

func _ready():
	#self.translation.y = Globals.start_position_y
	setup(self.translation.y)
	self.position = Globals.start_position_y
	self.destination = Globals.start_position_y

func _update_mesh():
	if reverse:
		self.translation.y = position
	else:
		self.translation.y = position

func _process(delta):
	update_position(delta)
	_update_mesh()
