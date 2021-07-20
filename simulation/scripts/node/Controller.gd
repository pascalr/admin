extends Node

class_name Controller

# The controller simulates what the arduino receives and does.
# It receives input of the form:
# mh200y1000

var _stream := []
var only_simulating := true

func exec(cmd : String):
	print("Controller received: "+cmd)
	if cmd.begins_with("m"):
		yield(_move(cmd.substr(1)), "completed")
	yield(get_tree(), "idle_frame")

# y10.0x20a90.0
func _move(s):
	var robot = get_tree().root.get_node("Simulation/Robot")
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]\\-?\\d+")
	for result in regex.search_all(s):
		var r = result.get_string()
		var id = r[0]
		for motor in robot.motors:
			if motor.id == id:
				motor.destination = float(r.substr(1))
				yield(motor, "destination_reached")
	yield(get_tree(), "idle_frame")

func execute(cmd : String):
	print("Controller received: "+cmd)
	if cmd.begins_with("m"):
		_set_destination(cmd.substr(1))

func send(cmd: String):
	_stream.push_back(cmd)

func _ready():
	print("Simulating controller...")

#get_node("/root/Simulation/Robot/SupportTransversale").translation.y = destination

# y10.0x20a90.0
func _set_destination(s):
	var robot = get_tree().root.get_node("Simulation/Robot")
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]\\-?\\d+")
	for result in regex.search_all(s):
		var r = result.get_string()
		var id = r[0]
		for motor in robot.motors:
			if motor.id == id:
				motor.destination = float(r.substr(1))
	return self

func _execute_command(cmd: String):
	print("Controller received: "+cmd)
	if cmd.begins_with("m"):
		_set_destination(cmd.substr(1))
		#robot.destination = PolarCoord.new().init_from_string(cmd.substr(1))
	#elsif cmd.start_with? "m" or cmd.start_with? "g"
	#  dest = parse_destination(cmd)
	#  handle_move(brain, dest)
	#elsif cmd.start_with? "k"
	#  do_rotate_around_grip(brain, cmd[1..-1].to_f)
	#elsif cmd.start_with? "x"
	#  args = cmd[1..-1].split(',').map(&:to_f)
	#  do_rotate_around_center(brain, args[0], args[1], args[2])
	#else
	#  raise "Body: Unkown command #{cmd}"
	#end
  #end

func _process(_delta):
	if !_stream.empty():
		var cmd = _stream.pop_front()
		_execute_command(cmd)
