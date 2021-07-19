extends KinematicBody

class_name Motor

export var id : String
export var min_position := 0.0
export var max_position := 0.0
export var speed := 20.0
export var reverse_direction = false

var position := 0.0
var destination := 0.0
var start_offset := 0.0 # The object translation of rotation equal to start_position

#func _physics_process(delta):

func _init():
	position = get_start_position()
	destination = get_start_position()

# This returns the value used to adjust the zero of the axis.
func get_start_position():
	assert(false)

func is_moving():
	return position == destination

func _position_changed():
	pass

func _process(delta: float):
	if destination > position:
		position = min(position+delta*speed, destination)
	elif destination < position:
		position = max(position-delta*speed, destination)
	_position_changed()
