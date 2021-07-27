extends Node

var CORE := "/root/Simulation/"
var ROBOT := "/root/Simulation/Robot/"
var CONFIG := "/root/Simulation/Config/"
var CUPBOARD := "/root/Simulation/Cupboard/"
var UI := "/root/Simulation/UI/"

#var core
#var robot
#var config
#var cupboard
#var UI

var jar_format
var food

var current_action : int
var current_selection

func _ready():
	# Ugly fix to max sure everything is loaded.
	yield(get_tree().create_timer(0.2), "timeout")
	
#	core = get_node("/root/Simulation")
#	robot = core.get_node("Robot")
#	config = core.get_node("Config")
#	cupboard = core.get_node("Cupboard")
#	UI = core.get_node("UI")

	jar_format = get_node(CONFIG).get_node("JarFormats/Big")
	food = get_node(CONFIG).get_node("Foods/farine")

func get_node(path):
	return get_tree().root.get_node(path)

func error(msg):
	print("Error: "+str(msg))
	var window = get_node(UI).get_node("ErrorDialog")
	window.dialog_text = msg
	window.popup()
	yield(get_tree(), "idle_frame")
