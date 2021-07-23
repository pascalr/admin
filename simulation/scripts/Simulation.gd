extends Spatial

func _ready():
	OS.set_low_processor_usage_mode(true)
	OS.set_low_processor_usage_mode_sleep_usec(50000)

func _input(event):

	if event is InputEventKey and event.is_pressed():
		match event.scancode:
			KEY_I:
				if !$UI.command_line.has_focus():
					$Cupboard.close_doors()
			KEY_O:
				if !$UI.command_line.has_focus():
					$Cupboard.open_doors()
			KEY_G:
				if Heda.current_selection != null:
					$Robot.grab(Heda.current_selection)
			KEY_ENTER:
				$UI.command_line.grab_focus()
			KEY_ESCAPE:
				for obj in get_tree().get_nodes_in_group("jars"):
					if obj is Jar:
						obj.selected = false
			KEY_DELETE:
				if Heda.current_selection != null:
					Heda.current_selection.queue_free()
					_obj_deselected(Heda.current_selection)

func _obj_deselected(_obj):
	if Heda.current_selection != null:
		Heda.current_selection.selection_box.visible = false
	Heda.current_selection = null
	$UI/SideBar/VBox/ObjIdLabel.text = "Selected: "

func _obj_selected(obj):
	if Heda.current_selection != null:
		Heda.current_selection.selection_box.visible = false
	$UI/SideBar/VBox/ObjIdLabel.text = "Selected: "+str(obj.get_obj_id())
	Heda.current_selection = obj

func _on_save():
	
	var store = File.new()
	store.open("user://state.save", File.WRITE)
	
	for node in get_tree().get_nodes_in_group("save"):
		var node_data = node.call("save")
		store.store_line(to_json(node_data))
	store.close()

func _on_load():
	
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
			Heda.cupboard.bodies.add_child(Jar.new().load_data(node_data))
		else:
			print("Unkown class " + node_data["class"] + " in store.")

	store.close()
