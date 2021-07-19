extends Motor

class_name Counterweight

func get_position():
	return self.translation.y

func set_position(pos : float):
	self.translation.y = -abs(pos)

func _ready():
	#self.translation.y = Globals.start_position_y
	setup(self.translation.y)
	self.position = -Globals.start_position_y
	self.destination = -Globals.start_position_y

func _process(delta):
	process_motor(delta)
	#update_position(delta)
	#_update_mesh()
