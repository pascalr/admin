extends Node

class_name Controller

export var move_straight_inc_deg = 0.5

# The controller simulates what the arduino receives and does.
# It receives input of the form:
# mh200y1000

func exec(cmd : String):
	print("Controller received: "+cmd)
	if cmd.begins_with("m"):
		yield(_move(cmd.substr(1)), "completed")
	if cmd.begins_with("t"):
		yield(_move_straight(float(cmd.substr(1))), "completed")
	else:
		yield(get_tree(), "idle_frame")

func _move_straight(dest_t):
	
	var t0
	var t
	
	while true:
		t0 = get_parent().get_t()
		if t0 == dest_t:
			yield(get_tree(), "idle_frame")
			return
		if t0 < dest_t:
			t = min(t0+move_straight_inc_deg, dest_t)
		elif t0 > dest_t:
			t = max(t0-move_straight_inc_deg, dest_t)
		var dt = t-t0
		get_parent().humerus.destination += dt
		get_parent().wrist.destination -= dt
		# TODO h
		yield(get_parent().humerus, "destination_reached")

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

