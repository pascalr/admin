extends Node

class_name Ingredient

var weight : float
var food : Food

func _init(_weight = 0.0, _food = null):
	weight = _weight
	food = _food

func volume():
	return weight / food.density
