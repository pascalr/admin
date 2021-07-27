extends Node

var CORE := "/root/Main/HBox/HSplit/HSplit/VSplit/TabContainer/Simulation/Viewport/Simulation"
var SCENE := CORE
var CONFIG := SCENE+"/Config"
var CUPBOARD := SCENE+"/Cupboard"
var UI := SCENE+"/UI"
var ROBOT := SCENE+"/Robot"
var SYNCHRONIZER := SCENE+"/Synchronizer"

var jar_format
var food

var current_action := 1
var current_selection

func _ready():
	# Ugly fix to max sure everything is loaded.
	yield(get_tree().create_timer(0.2), "timeout")

	jar_format = get_node(CONFIG+"/JarFormats/Big")
	food = get_node(CONFIG+"/Foods/farine")

func get_node(path):
	return get_tree().root.get_node(path)

func error(msg):
	print("Error: "+str(msg))
	var window = get_node(UI+"/ErrorDialog")
	window.dialog_text = msg
	window.popup()
	yield(get_tree(), "idle_frame")
