extends Node

class_name Food

export var id : int
export var density := 1.0
export var _name : String
export(Color, RGB) var color
export(Texture) var image
var in_pantry : bool

func _to_string():
	return name

func load_data(data):
	
	for i in data.keys():
		if i == "created_at" or i == "updated_at":
			continue
		else:
			self.set(i, data[i])

	return self

static func all():
	return Heda.get_node(Heda.FOODS).get_children()
