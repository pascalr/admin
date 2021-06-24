extends Node

var _stream := []
var only_simulating := true

func send(cmd: String):
	_stream.push_back(cmd)

func _ready():
	print("Simulating controller...")

#get_node("/root/Simulation/Robot/SupportTransversale").translation.y = destination

func _execute_command(cmd: String):
	print("Controller received: "+cmd)
	if cmd.begins_with("m"):
		var robot = get_tree().root.get_node("Simulation/Robot")
		robot.destination = PolarCoord.new().init_from_string(cmd.substr(1))
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

func _process(delta):
	if !_stream.empty():
		var cmd = _stream.pop_front()
		_execute_command(cmd)
