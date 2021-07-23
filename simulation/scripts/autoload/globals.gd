extends Node

# Globals are shared constants
# Settings are shared variables

enum {ACTION_SELECT, ACTION_ADD_JAR, ACTION_PUT_DOWN}

var machine_depth := 7.0*25.4
var working_shelf_depth := 12.0*25.4

var humerus_length := 6.25*25.4 # 158.75
var forearm_grip_length := (3.0 + 0.125 + 3.125 + 0.75 + 2.375)*25.4 # 238.125
var forearm_clear_length := (3.0 + 0.125 + 3.125 + 0.75 + 3.25)*25.4
var gripper_width := 6.0*25.4

var trolley_z := working_shelf_depth + machine_depth/2.0

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
var max_z := 22.375*25.4

var min_dist_between_jars = 6.25
