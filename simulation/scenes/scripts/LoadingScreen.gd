extends Panel

func _ready():
	yield(Cache, "loaded")
	get_tree().change_scene("res://scenes/Interface.tscn")
