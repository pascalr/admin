extends Node

onready var core = get_node("/root/Simulation")
onready var robot = core.get_node("Robot")
onready var config = core.get_node("Config")
onready var cupboard = core.get_node("Cupboard")
onready var UI = core.get_node("UI")

onready var jar_format = config.get_node("JarFormats/Big")
var current_action : int
var current_selection

func error(msg):
	print("Error: "+str(msg))
	var window = UI.get_node("ErrorDialog")
	window.dialog_text = msg
	window.popup()
	yield(get_tree(), "idle_frame")

func show_invalid_polar(polar, coord, t):
	while(true):
		robot.set_polar(polar.set_from_user_coord_and_t(coord, -t))
		yield(get_tree().create_timer(5.0),"timeout")
		robot.set_polar(polar.set_from_user_coord_and_t(coord, t))
		yield(get_tree().create_timer(5.0),"timeout")
		pass
