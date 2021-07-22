extends Node

onready var core = get_node("/root/Simulation")
onready var robot : Robot = core.get_node("Robot")
onready var config = core.get_node("Config")
onready var cupboard = core.get_node("Cupboard")
onready var error_window = core.get_node("ErrorWindow")

onready var jar_format := get_node("/root/Simulation/Config/BigJar")
onready var current_action : int

func error(msg):
	print("Error: "+str(msg))
	error_window.message.text = msg
	error_window.popup()
