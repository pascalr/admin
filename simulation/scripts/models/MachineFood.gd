extends Model

class_name MachineFood

static func get_table():
	return Tables.MACHINE_FOODS
func get_class():
	return "MachineFood"
static func all():
	return get_table().all()
static func find(id):
	return get_table().find(id)
static func find_by_food(_food):
	for machine_food in get_table().all():
		if machine_food.food == _food:
			return machine_food
	return null

var grocery_threshold
var current_weight
var full_weight
var food

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
		"grocery_threshold" : grocery_threshold,
		"current_weight" : current_weight,
		"full_weight" : full_weight
	}
