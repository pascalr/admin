extends Panel

func _ready():
	yield(Cache, "loaded")
	var _a = get_tree().change_scene("res://scenes/Interface.tscn")
