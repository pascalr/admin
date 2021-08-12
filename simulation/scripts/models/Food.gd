extends Model

class_name Food

func get_class():
	return "Food"
static func get_model_name():
	return "Food"
static func all():
	return Cache.list(get_model_name())
static func find(id):
	return Cache.find(get_model_name(), id)
#	return Heda.get_node(Heda.FOODS).get_children()

export var density := 1.0
export var _name : String
export(Color, RGB) var color setget set_color
export(Texture) var image
var in_pantry : bool

func _to_string():
	return name

func set_color(_color):
	if typeof(_color) == TYPE_INT or typeof(_color) == TYPE_STRING:
		color = Color(_color)
	elif typeof(_color) == TYPE_REAL:
		color = Color(int(_color))
	elif _color is Color:
		color = _color
	else:
		assert(false)

func load_data(data):
	
	for i in data.keys():
		if i == "created_at" or i == "updated_at":
			continue
		else:
			self.set(i, data[i])

	return self


