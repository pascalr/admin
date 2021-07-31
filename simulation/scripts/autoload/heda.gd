extends Node

var CORE := "/root/Main/HBox/HSplit/HSplit/VSplit/TabContainer/Simulation/Viewport/Simulation"
var SCENE := CORE
var CONFIG := SCENE+"/Config"
var CUPBOARD := SCENE+"/Cupboard"
var WORKING_SPACE := SCENE+"/WorkingSpace"
var UI := SCENE+"/UI"
var ROBOT := SCENE+"/Robot"
var SYNCHRONIZER := "/root/Main/Synchronizer"
var ERROR_DIALOG := "/root/Main/ErrorDialog"
var COMMAND_LINE := "/root/Main/HBox/HSplit/HSplit/VSplit/Console/VBox/CommandLine"
var INTERPRETER := "/root/Main/Interpreter"

#var RECIPES := "/root/Main/HBox/HSplit/HSplit/VSplit/TabContainer/Recipes"
var INVENTORY := "/root/Main/HBox/HSplit/HSplit/VSplit/TabContainer/Inventory"

var MAIN_PANEL := "/root/Main/HBox/HSplit/MainPanel"

var RECIPE_DETAILS := "/root/Main/HBox/HSplit/HSplit/DetailsPanel/VBox/RecipeDetails"
var SELECTION_PANEL := "/root/Main/HBox/HSplit/HSplit/DetailsPanel/VBox/Selection"

var SCENE_CAMERA := SCENE+"/Camera"
var ROBOT_CAMERA := ROBOT+"/SupportTransversale/Trolley/Humerus/Wrist/Hand/RobotCamera"

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
	var window = get_node(ERROR_DIALOG)
	window.dialog_text = msg
	window.popup()
	yield(get_tree(), "idle_frame")
