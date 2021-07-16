extends Spatial

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
				for obj in $Cupboard/Inventory.get_children():
					if obj is Jar and obj.selected:
						$Robot.grab(obj)
			KEY_ENTER:
				$UI/CommandLine.grab_focus()
			KEY_DELETE:
				for obj in $Cupboard/Inventory.get_children():
					if obj is Jar and obj.selected:
						$Cupboard/Inventory.remove_child(obj)
