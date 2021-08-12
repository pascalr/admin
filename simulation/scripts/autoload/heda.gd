extends Node

var HOST := "http://localhost:3000/"
#var HOST := "https://aqueous-fortress-30634.herokuapp.com/"

# Simulation/Scene
var CORE := "/root/Main/HBox/HSplit/HSplit/VSplit/TabContainer/Simulation/Viewport/Scene"
var SCENE := CORE
var CUPBOARD := SCENE+"/Cupboard"
var WORKING_SPACE := SCENE+"/WorkingSpace"
var UI := SCENE+"/UI"
var ROBOT := SCENE+"/Robot"
var COLLISION_DETAILS := SCENE+"/CollisionDetails"

var CONFIG := SCENE+"/Config"
#var JAR_FORMATS := CONFIG+"/JarFormats"
var FOODS := CONFIG+"/Foods"

var SYNCHRONIZER := "/root/Main/Synchronizer"
var ERROR_DIALOG := "/root/Main/ErrorDialog"
var COMMAND_LINE := "/root/Main/HBox/HSplit/HSplit/VSplit/Console/VBox/CommandLine"
var INTERPRETER := "/root/Main/Interpreter"
var MENUS := "/root/Main/HBox/Menus"

#var RECIPES := "/root/Main/HBox/HSplit/HSplit/VSplit/TabContainer/Recipes"
var INVENTORY := "/root/Main/HBox/HSplit/HSplit/VSplit/TabContainer/Inventory"

var MAIN_PANEL := "/root/Main/HBox/HSplit/MainPanel"

var RECIPE_DETAILS := "/root/Main/HBox/HSplit/HSplit/DetailsPanel/VBox/RecipeDetails"
var SELECTION_PANEL := "/root/Main/HBox/HSplit/HSplit/DetailsPanel/VBox/Selection"

var CURRENT_JAR := "/root/Main/HBox/HSplit/HSplit/DetailsPanel/VBox/InsertToolDetails/VBox/JarId"

var REAR_SCENE_CAMERA := SCENE+"/Camera"
var FRONT_SCENE_CAMERA := SCENE+"/FrontCamera"
var ROBOT_CAMERA := ROBOT+"/SupportTransversale/Trolley/Humerus/Wrist/Hand/RobotCamera"

var current_action := 1
var current_selection

var simulation_speed := 1.0

func detect_jars():
	pass

var _jar_formats = null
func get_jar_formats():
	if _jar_formats == null:
		_jar_formats = preload("res://scenes/JarFormats.tscn").instance().get_children()
	return _jar_formats

func test_reach():
	var cupboard = get_node(Heda.CUPBOARD)
	var jars := []
	var shelves = cupboard.shelves
	shelves.erase(cupboard.working_shelf)
	for shelf in shelves:
		if not shelf.visible:
			continue
		Heda.jar_format = shelf.get_preferred_jar_format()
		var pos = Vector3(shelf.get_min_x(), shelf.get_height(), shelf.get_min_z())
		var jar = cupboard._check_add_jar(shelf, pos)
		if jar:
			jars.push_back(jar)
		pos = Vector3(shelf.get_max_x(), shelf.get_height(), shelf.get_min_z())
		jar = cupboard._check_add_jar(shelf, pos)
		if jar:
			jars.push_back(jar)
		else:
			push_error("A corner of the shelf is not valid.")
#	for jar in jars:
#		yield(get_node(Heda.ROBOT).grab(jar), "completed")
#		yield(get_node(Heda.ROBOT).store(jar), "completed")
#		print("Tested reach for shelf + "+shelf.name)

func fill_shelves():
	var cupboard = get_node(Heda.CUPBOARD)
	var shelves = cupboard.shelves
	shelves.erase(cupboard.working_shelf)
	for shelf in shelves:
		if not shelf.visible:
			continue
		Heda.jar_format = shelf.get_preferred_jar_format()
		while true:
			var pos = shelf.get_free_position(Heda.jar_format)
			if pos == null:
				break
			var jar = cupboard._check_add_jar(shelf, pos)
			if jar == null:
				break
			yield(get_tree(), "idle_frame")

func clear():
	for node in get_tree().get_nodes_in_group("save"):
		node.queue_free()

func save():
	pass
#	var store = File.new()
#	store.open("user://state.save", File.WRITE)
#
#	for node in get_tree().get_nodes_in_group("save"):
#		var node_data = node.to_dict()
#		store.store_line(to_json(node_data))
#	store.close()

func load():
	pass
#	var store = File.new()
#	if not store.file_exists("user://state.save"):
#		return
#
#	# Clear previous objects
#	for node in get_tree().get_nodes_in_group("save"):
#		node.queue_free()
#
#	store.open("user://state.save", File.READ)
#	while store.get_position() < store.get_len():
#
#		var node_data = parse_json(store.get_line())
#
#		if node_data["class"] == "Jar":
#			get_node(Heda.CUPBOARD).bodies.add_child(Jar.new().load_data(node_data))
#		else:
#			print("Unkown class " + node_data["class"] + " in store.")
#
#	store.close()

func get_node(path):
	return get_tree().root.get_node(path)

func error(msg):
	print("Error: "+str(msg))
	var window = get_node(ERROR_DIALOG)
	window.dialog_text = msg
	window.popup()
	yield(get_tree(), "idle_frame")
