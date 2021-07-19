extends Motor

class_name Counterweight

func get_start_position():
	return Globals.start_position_y

func _position_changed():
	self.translation.y = -position

func _process(delta):
	process_motor2(delta)
	#update_position(delta)
	#_update_mesh()
