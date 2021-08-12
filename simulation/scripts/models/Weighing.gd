extends Model

class_name Weighing

static func get_model_name():
	return "Weighing"

var weight : float
var food

func _init(_weight = null, _food = null):
	weight = _weight; food = _food
