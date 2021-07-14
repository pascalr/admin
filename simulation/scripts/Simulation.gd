extends Spatial

func _ready():
	OS.set_low_processor_usage_mode(true)
	OS.set_low_processor_usage_mode_sleep_usec(50000)

func _input(event):

	if event is InputEventKey:
		match event.scancode:
			KEY_I:
				print("Closing doors")
				get_tree().root.get_node("Simulation/Cupboard").close_doors()
			KEY_O:
				print("Opening doors")
				get_tree().root.get_node("Simulation/Cupboard").open_doors()
