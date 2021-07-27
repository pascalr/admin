extends Panel

onready var simulation_menu = $SimulationMenu

func _ready():
	simulation_menu.get_popup().connect("id_pressed", self, "_simulation_id_pressed")

func _simulation_id_pressed(id):
	match id:
		0:
			_save()
		1:
			_load()
		2:
			get_tree().quit()

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
