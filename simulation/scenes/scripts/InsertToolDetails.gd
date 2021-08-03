extends PanelContainer

func _ready():
	_on_InsertToolDetails_visibility_changed()

var foods := []

func _on_InsertToolDetails_visibility_changed():
	if visible:
		$VBox/Foods.clear()
		for food in get_node(Heda.FOODS).get_children():
			foods.push_back(food)
			$VBox/Foods.add_item(food._name)
		
		$VBox/JarFormats.clear()
		for format in get_node(Heda.JAR_FORMATS).get_children():
			$VBox/JarFormats.add_item(format.name)

func _on_Foods_item_selected(index):
	Heda.food = foods[index]
