extends Node

class_name Food

export var id : int
export var density := 1.0
export var _name : String
export(Color, RGB) var color
export(Texture) var image

func _to_string():
	return name

static func all():
	return Heda.get_node(Heda.FOODS).get_children()
