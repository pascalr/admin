extends Motor

class_name MotorH

func _ready():
	setup(self.translation.x)
	self.position = Globals.start_position_h
	self.destination = Globals.start_position_h

func _update_mesh():
	self.translation.x = start_offset + Globals.start_position_h - position

func _process(delta):
	update_position(delta)
	_update_mesh()
