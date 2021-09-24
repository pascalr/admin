extends Node

# Globals are shared constants
# Settings are shared variables

enum {ACTION_SELECT, ACTION_ADD_JAR, ACTION_PUT_DOWN}

var show_collision_warning = false

var working_shelf_depth := 12.0*25.4
var trolley_z := working_shelf_depth + 4.438*25.4

var humerus_length := 220.0 #194.0 #6.25*25.4 # 158.75
var forearm_grip_length := 205.0 #214.0
var gripper_width := 6.0*25.4

var under_shelf := 6.0*25.4
var grab_above_grip_length := 20.0
var jar_clearance := 10.0 # To be safe move this distance above jars

# The safe height to move above
# (The tallest jars mesure 168.275)
var safe_height := 178.0
var fence_height := 2*25.4
var fence_safe_height := fence_height + 0.25*25.4

#var max_h := 850
#var max_y := 1380
var max_r := 138.0
var min_x := 0.0
var max_x := 40*25.4
var min_y := 0.0
var min_z := 0.0
var max_z := 24*25.4#22.375*25.4

var min_dist_between_jars = 6.25

func grab_height_above(obj):
	return obj.get_height()-20.0

func grab_height_in_front(_obj):
	return 60.0

func min_jar_to_border_dist():
	return Heda.jar_format.diameter/2.0 + min_dist_between_jars/2.0

func reach():
	return humerus_length+forearm_grip_length
