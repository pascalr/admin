extends Node

onready var core = get_node("/root/Simulation")
onready var robot : Robot = core.get_node("Robot")
onready var config = core.get_node("Config")
onready var cupboard = core.get_node("Cupboard")
onready var UI = core.get_node("UI")

onready var jar_format = config.get_node("JarFormats/BigJar")
var current_action : int
var current_selection

func error(msg):
	print("Error: "+str(msg))
	var window = UI.get_node("ErrorDialog")
	window.dialog_text = msg
	window.popup()
