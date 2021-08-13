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

func _init(_weight = 0.0, _food = null):
	weight = _weight; food = _food

func load_data(data):
	
	for i in data.keys():
		if i == "created_at" or i == "updated_at":
			continue
		elif i == "food_id":
			self.food = Food.find(data[i])
		else:
			self.set(i, data[i])

	return self

func to_dict():
	return {
		"weight" : weight,
		"food_id" : food.id,
	}
	
static func new_weighing(_food):
	var total = 0.0
	for jar in Jar.all():
		var ing = jar.main_ingredient()
		if ing and ing.food == _food:
			total += ing.weight
	
	return load("res://scripts/models/Weighing.gd").new(total, _food).save()
