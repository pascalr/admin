extends Panel

onready var list = $TabContainer/Recipes/VBox/List

var recipes

func load_recipes(_recipes):
	recipes = _recipes
	for recipe in recipes:
		list.add_item(recipe["name"])

func _on_List_item_selected(index):
	get_node(Heda.RECIPE_DETAILS).show_details(recipes[index])

func _ready():
	#search_field.minimum_spaces = 8
	pass
