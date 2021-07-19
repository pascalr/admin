extends Motor

class_name MotorH

func get_position():
	return self.translation.x

func set_position(pos : float):
	self.translation.x = pos

func _ready():
	#self.translation.x = Globals.start_position_h
	setup(self.translation.x)
	self.position = Globals.start_position_h
	self.destination = Globals.start_position_h

func _update_mesh():
	self.translation.x = Globals.start_position_h

func _process(delta):
	update_position(delta)
	_update_mesh()
