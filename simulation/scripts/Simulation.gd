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
					$Cupboard/Inventory.remove_child(current_selection)
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




