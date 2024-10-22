extends Node

class_name Controller

export var move_straight_inc_deg = 1.0

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
	
	var t = get_parent().get_t()
	
	# FIXME: This only works for straight Z...
	# When going straight in Z, wrist X == gripper X
	# Only the humerus matters.
	# Keep X the same as this value
	var x0 = -sin(t*PI/180.0)*Globals.humerus_length
	var h0 = get_parent().trolley.position
	
	while t != dest_t:

		var tf = Lib.inc(t,move_straight_inc_deg, dest_t)
		var dt = tf-t
		get_parent().humerus.destination += dt
		get_parent().wrist.destination -= dt
		#var xf = Lib.calc_x(get_parent().humerus.destination, get_parent().wrist.destination)
		var x = -sin(tf*PI/180.0)*Globals.humerus_length
		get_parent().trolley.destination = h0 + x - x0
		
		yield(get_parent().humerus, "destination_reached")
		yield(get_parent().wrist, "destination_reached")
		#yield(get_parent().trolley, "destination_reached")
		t = tf
		
	yield(get_tree(), "idle_frame")

# y10.0x20a90.0
func _move(s):
	var robot = get_node(Heda.ROBOT)
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

