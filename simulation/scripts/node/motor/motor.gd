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

func _init():
	destination = get_position()
	print("INIT!")

func setup(_start_offset):
	self.start_offset = _start_offset
	self.position = 0.0
	self.destination = 0.0

# This returns the value used to adjust the zero of the axis.
func get_start_position():
	assert(false)

func get_position():
	return 0.0
	assert(false)

func set_position(pos):
	return null
	assert(false)

func process_motor(delta: float):
	var pos = get_position()
	if destination > pos:
		self.set_position(min(pos+delta*speed, destination))
	elif destination < pos:
		self.set_position(max(pos-delta*speed, destination))

func update_position(delta : float):
	if destination > position:
		position = min(position+delta*speed, destination)
	elif destination < position:
		position = max(position-delta*speed, destination)
