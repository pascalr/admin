extends Spatial

var current_selection

func _ready():
	OS.set_low_processor_usage_mode(true)
	OS.set_low_processor_usage_mode_sleep_usec(50000)

func _input(event):

	if event is InputEventKey and event.is_pressed():
		match event.scancode:
			KEY_I:
				if !$UI/CommandLine.has_focus():
					$Cupboard.close_doors()
			KEY_O:
				if !$UI/CommandLine.has_focus():
					$Cupboard.open_doors()
			KEY_G:
				if current_selection != null:
					$Robot.grab(current_selection)
			KEY_ENTER:
				$UI/CommandLine.grab_focus()
			KEY_ESCAPE:
				for obj in $Cupboard/Inventory.get_children():
					if obj is Jar:
						obj.selected = false
			KEY_DELETE:
				if current_selection != null:
					current_selection.queue_free()
					_obj_deselected(current_selection)

func _obj_deselected(_obj):
	if current_selection != null:
		current_selection.selection_box.visible = false
	current_selection = null
	$SideBar/VBox/ObjIdLabel.text = "Obj id: "

func _obj_selected(obj):
	if current_selection != null:
		current_selection.selection_box.visible = false
	$SideBar/VBox/ObjIdLabel.text = "Obj id: "+str(obj.get_obj_id())
	current_selection = obj

func _on_save():
	
	var store = File.new()
	store.open("user://state.save", File.WRITE)
	var objs = $Cupboard/Inventory.get_children()
	for node in objs:
		var node_data = node.call("save")
		store.store_line(to_json(node_data))
	store.close()

func _on_load():
	
	var store = File.new()
	if not store.file_exists("user://state.save"):
		return
	
	# Clear previous objects
	var objs = $Cupboard/Inventory.get_children()
	for node in objs:
		node.queue_free()

	store.open("user://state.save", File.READ)
	while store.get_position() < store.get_len():

		var node_data = parse_json(store.get_line())
		
		if node_data["class"] == "Jar":
			$Cupboard/Inventory.add_child(Jar.new().load_data(get_tree().root, node_data))
		else:
			print("Unkown class " + node_data["class"] + " in store.")

	store.close()
