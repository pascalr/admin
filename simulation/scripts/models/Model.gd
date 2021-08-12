extends Node

var id := -1

class_name Model

func save():
	Cache.save(self)
