extends Node

onready var core = get_node("/root/Simulation")
onready var robot : Robot = core.get_node("Robot")
onready var error_window = core.get_node("ErrorWindow")
