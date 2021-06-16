extends Control

func _ready():
	print("1")
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().change_scene("res://nav/main.tscn")
	print("2")
