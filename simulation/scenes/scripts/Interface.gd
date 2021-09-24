extends Control

func _ready():
	Globals.emit_signal("scene_loaded")
	pass
	#$HBox/HSplit/HSplit/VSplit/TabContainer.current_tab = 3
