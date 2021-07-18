extends KinematicBody

class_name Motor

export var id : String
export var min_position := 0.0
export var max_position := 0.0
export var speed := 200.0

var position := 0.0
var destination := 0.0
var start_offset := 0.0 # The object translation of rotation equal to start_position

#func _physics_process(delta):

func setup(_start_offset):
	self.start_offset = _start_offset
	self.position = 0.0
	self.destination = 0.0

func update_position(delta : float):
	if destination > position:
		position = min(position+delta*speed, destination)
	elif destination < position:
		position = max(position-delta*speed, destination)
