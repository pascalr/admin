extends Spatial

var mouse_clicked = false
var click_event

func _ready():
	OS.set_low_processor_usage_mode(true)
	OS.set_low_processor_usage_mode_sleep_usec(50000)

func _physics_process(_delta):
	if mouse_clicked:
		var result = $Camera.get_object_under_mouse()
		if(result.size()!=0):
			result["collider"].emit_signal("input_event", $Camera, click_event, result["position"], null, null)
		mouse_clicked = false

func _input(event):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		mouse_clicked = true
		click_event = event
	elif event is InputEventKey and event.is_pressed():
		match event.scancode:
			KEY_I:
				if !get_node(Heda.COMMAND_LINE).has_focus():
					$Cupboard.close_doors()
			KEY_O:
				if !get_node(Heda.COMMAND_LINE).has_focus():
					$Cupboard.open_doors()
			KEY_G:
				if Heda.current_selection != null:
					$Robot.grab(Heda.current_selection)
			KEY_ENTER:
				get_node(Heda.COMMAND_LINE).grab_focus()
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
	get_node(Heda.SELECTION_PANEL).hide_details()

func _obj_selected(obj):
	if Heda.current_selection != null:
		Heda.current_selection.selection_box.visible = false
	Heda.current_selection = obj
	get_node(Heda.SELECTION_PANEL).show_details(obj)


