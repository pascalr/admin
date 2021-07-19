extends Spatial

var command_request : HTTPRequest

var current_selection

func _ready():
	OS.set_low_processor_usage_mode(true)
	OS.set_low_processor_usage_mode_sleep_usec(50000)
	
	command_request = HTTPRequest.new()
	add_child(command_request)
	#var _v = command_request.connect("request_completed", self, "_jar_added")

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
				for obj in $Cupboard/Inventory.get_children():
					if obj is Jar and obj.selected:
						#$Robot.grab(obj)
						var url = "http://localhost:4567/grab/"+str(obj.get_instance_id())
						var _err = command_request.request(url)
			KEY_ENTER:
				$UI/CommandLine.grab_focus()
			KEY_ESCAPE:
				for obj in $Cupboard/Inventory.get_children():
					if obj is Jar:
						obj.selected = false
			KEY_DELETE:
				for obj in $Cupboard/Inventory.get_children():
					if obj is Jar and obj.selected:
						$Cupboard/Inventory.remove_child(obj)

func _obj_deselected(_obj):
	if current_selection != null:
		current_selection.selection_box.visible = false
	current_selection = null
	$SideBar/Label.text = "Obj id: "

func _obj_selected(obj):
	if current_selection != null:
		current_selection.selection_box.visible = false
	$SideBar/Label.text = "Obj id: "+str(obj.get_instance_id())
	current_selection = obj
