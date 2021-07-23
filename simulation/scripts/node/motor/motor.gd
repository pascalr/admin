extends Spatial

class_name Motor

signal destination_reached

export var id : String
export var min_position := 0.0
export var max_position := 0.0
# The value used to adjust the zero of the axis.
export var start_position := 0.0
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

func _ready():
	position = start_position
	destination = start_position

func is_moving():
	return position == destination

func _position_changed():
	pass

func test_position(pos):
	if pos == null:
		return null
	elif pos < min_position:
		return "Invalid position " + id + ". Got " + str(pos) + ". Expected above " + str(min_position)
	elif pos > max_position:
		return "Invalid position " + id + ". Got " + str(pos) + ". Expected below " + str(max_position)
	return null

# Returns whether the motor still needs to move.
func _move(delta : float):
	if position < destination:
		position = min(position+delta*speed, destination)
	elif position > destination:
		position = max(position-delta*speed, destination)
	return position != destination

func _process(delta : float):
	if _moving:
		if !_move(delta):
			_moving = false
			emit_signal("destination_reached")
		_position_changed()
