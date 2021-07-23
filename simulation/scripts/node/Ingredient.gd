extends Node

class_name Ingredient

var weight : float
var food : Food

func volume():
	return weight / food.density
