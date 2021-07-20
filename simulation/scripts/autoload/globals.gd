extends Node

var machine_depth := 7.0*25.4
var working_shelf_depth := 12.0*25.4

var humerus_length := 6.25*25.4 # 158.75
var forearm_grip_length := (3.0 + 0.125 + 3.125 + 0.75 + 2.375)*25.4 # 238.125
var forearm_clear_length := (3.0 + 0.125 + 3.125 + 0.75 + 3.25)*25.4
var gripper_width := 6.0*25.4

var trolley_z := working_shelf_depth + machine_depth/2.0

var start_position_r := 30.0
var start_position_y := 889.0
var start_position_h := 275.0

var max_r := 138.0
var max_z := 304.8
