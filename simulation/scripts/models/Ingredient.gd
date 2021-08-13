extends Model

class_name Ingredient

var weight : float setget set_weight
var food : Food

func set_weight(_weight):
	weight = 0.0 if _weight <= 0.0 else _weight

func _init(_weight = 0.0, _food = null):
	weight = _weight
	food = _food

func volume():
	return weight / food.density

func to_dict():
	return {
		"weight" : weight,
		"food_id" : str(food.id)
	}

func _to_string():
	return "%.2f g %s" % [weight, food]
