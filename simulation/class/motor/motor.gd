extends MeshInstance

class_name Motor

export var id : String
export var min_position := 0.0
export var max_position := 0.0
export var speed := 200.0

var position := 0.0
var destination := 0.0
var offset := 0.0

func update_position(delta : float):
	if destination > position:
		position = min(position+delta*speed, destination)
	elif destination < position:
		position = max(position-delta*speed, destination)
