extends Node

signal saved

var id := -1

class_name Model

func save():
	Cache.save(self)
	emit_signal("saved")
