extends KinematicBody

class_name Motor

signal destination_reached

export var id : String
export var min_position := 0.0
export var max_position := 0.0
export var speed := 200.0
export var reverse_direction = false

var position := 0.0
var destination := 0.0 setget set_destination
var start_offset := 0.0 # The object translation of rotation equal to start_position

var _moving := false

func set_destination(dest):
	destination = dest
	_moving = true

#func _physics_process(delta):

func _init():
	position = get_start_position()
	destination = get_start_position()

func _ready():
	var _a = self.connect("destination_reached", get_tree().root.get_node("Simulation"), "_send_done")

# This returns the value used to adjust the zero of the axis.
func get_start_position():
	assert(false)

func is_moving():
	return position == destination

func _position_changed():
	pass

# Returns whether the motor still needs to move.
func _move(delta : float):
	if position < destination:
		position = min(position+delta*speed, destination)
	elif position > destination:
		position = max(position-delta*speed, destination)
	return position != destination

func _process(delta : float):
	if _moving && !_move(delta):
		_moving = false
		emit_signal("destination_reached")
	else:
		_position_changed()
