extends Panel

onready var simulation_menu = $HBox/SimulationMenu
onready var debug_menu = $HBox/DebugMenu

func _ready():
	simulation_menu.get_popup().connect("id_pressed", self, "_simulation_id_pressed")
	debug_menu.get_popup().connect("id_pressed", self, "_debug_id_pressed")

func _simulation_id_pressed(id):
	match id:
		0:
			Heda.save()
		1:
			Heda.load()
		2:
			Heda.clear()
		3:
			get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func _debug_id_pressed(id):
	match id:
		0:
			Heda.test_reach()
		1:
			Heda.fill_shelves()
		2:
			Heda.fill_rear_shelves()
		3:
			Heda.remove_all_jars()
		4:
			Heda.fill_jars()

