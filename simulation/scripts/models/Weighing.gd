extends Model

class_name Weighing

static func get_table():
	return Tables.WEIGHINGS
func get_class():
	return "Weighing"
static func all():
	return get_table().all()

var weight : float
var food

func _init(_weight = null, _food = null):
	weight = _weight; food = _food
