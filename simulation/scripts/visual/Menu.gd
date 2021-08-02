extends Panel

onready var simulation_menu = $HBox/SimulationMenu
onready var debug_menu = $HBox/DebugMenu

func _ready():
	simulation_menu.get_popup().connect("id_pressed", self, "_simulation_id_pressed")
	debug_menu.get_popup().connect("id_pressed", self, "_debug_id_pressed")

func _simulation_id_pressed(id):
	match id:
		0:
			_save()
		1:
			_load()
		2:
			_clear()
		3:
			get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func _debug_id_pressed(id):
	match id:
		0:
			_test_reach()
		1:
			_fill_shelves()

func _test_reach():
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

func _fill_shelves():
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

func _clear():
	for node in get_tree().get_nodes_in_group("save"):
		node.queue_free()

func _save():
	
	var store = File.new()
	store.open("user://state.save", File.WRITE)
	
	for node in get_tree().get_nodes_in_group("save"):
		var node_data = node.call("save")
		store.store_line(to_json(node_data))
	store.close()

func _load():
	
	var store = File.new()
	if not store.file_exists("user://state.save"):
		return
	
	# Clear previous objects
	for node in get_tree().get_nodes_in_group("save"):
		node.queue_free()

	store.open("user://state.save", File.READ)
	while store.get_position() < store.get_len():

		var node_data = parse_json(store.get_line())
		
		if node_data["class"] == "Jar":
			get_node(Heda.CUPBOARD).bodies.add_child(Jar.new().load_data(node_data))
		else:
			print("Unkown class " + node_data["class"] + " in store.")

	store.close()
