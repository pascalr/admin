extends Panel

onready var list = $VBox/List

var recipes

func load_recipes(_recipes):
	recipes = _recipes
	for recipe in recipes:
		list.add_item(recipe["name"])
