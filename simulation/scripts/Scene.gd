extends Spatial

var mouse_clicked = false
var click_event

onready var view_options = $MarginContainer/ViewOption

func _ready():
	OS.set_low_processor_usage_mode(true)
	OS.set_low_processor_usage_mode_sleep_usec(50000)
	OS.min_window_size = Vector2(400, 400)
	
	get_tree().set_auto_accept_quit(false)
	
	for jar in Jar.all():
		if jar.get_position().x != 0.0:
			var node = preload("res://scenes/JarInstance.tscn").instance()
			node.jar = jar
			Heda.get_node(Heda.CUPBOARD).bodies.add_child(node)
	
	Heda.load()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		print("QUITTING!")
		Cache.close()
		Heda.save()

func _physics_process(_delta):
	if mouse_clicked:
		var result = $Camera.get_object_under_mouse()
		if(result.size()!=0):
			result["collider"].emit_signal("input_event", $Camera, click_event, result["position"], null, null)
		mouse_clicked = false

#func _input(event):
#	print("Scene input")

func _input(event):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		mouse_clicked = true
		click_event = event
	elif event is InputEventKey and event.is_pressed():
		if get_node(Heda.COMMAND_LINE).has_focus():
			return
		match event.scancode:
			KEY_I:
				$Cupboard.close_doors()
			KEY_O:
				$Cupboard.open_doors()
			KEY_G:
				if Heda.current_selection != null:
					$Robot.grab(Heda.current_selection)
			KEY_ENTER:
				get_node(Heda.COMMAND_LINE).grab_focus()
			KEY_C:
				var index = (view_options.selected+1) % view_options.get_item_count()
				view_options.select(index)
				view_options.emit_signal("item_selected", index)
			KEY_P:
				print("Pause/Unpause")
				get_tree().paused = !get_tree().paused
			KEY_DELETE:
				if Heda.current_selection != null:
					Heda.current_selection.queue_free()
					_obj_deselected(Heda.current_selection)

func _obj_deselected(_obj):
	if Heda.current_selection != null:
		Heda.current_selection.selection_box.visible = false
	Heda.current_selection = null
	get_node(Heda.SELECTION_PANEL).hide_details()

func _obj_selected(obj):
	if Heda.current_selection != null:
		Heda.current_selection.selection_box.visible = false
	Heda.current_selection = obj
	get_node(Heda.SELECTION_PANEL).show_details(obj.jar)

func _on_ViewOption_item_selected(index):
	print("On view option item selected")
	if index == 0:
		get_node(Heda.ROBOT_CAMERA).make_current()
		get_node(Heda.CUPBOARD).rear.visible = true
	elif index == 1:
		get_node(Heda.FRONT_SCENE_CAMERA).make_current()
		get_node(Heda.CUPBOARD).rear.visible = true
	else:
		get_node(Heda.REAR_SCENE_CAMERA).make_current()
		get_node(Heda.CUPBOARD).rear.visible = false
