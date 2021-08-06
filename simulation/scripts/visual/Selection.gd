extends PanelContainer

onready var food_list = $VBox/JarDetails/IngredientFood

func _ready():
	self.visible = false
	var _a = Datastore.connect("food_list_updated", self, "update_food_list")

func update_food_list():
	food_list.clear()
	for food in Datastore.food_list:
		if food.in_pantry:
			food_list.add_item(food.name)
			food_list.set_item_metadata(food_list.get_item_count()-1, food)

func show_details(obj):
	self.visible = true
	$VBox/ObjectName.text = obj.name
	$VBox/X/Value.text = "%.2f" % obj.translation.x
	$VBox/Y/Value.text = "%.2f" % obj.translation.y
	$VBox/Z/Value.text = "%.2f" % obj.translation.z
	
	if obj.get_class() == "JarNode":
		$VBox/JarDetails.visible = true
		for child in $VBox/JarDetails/MarginContainer/Ingredients.get_children():
			child.queue_free()
		for ing in obj.jar_data.ingredients:
			var label = Label.new()
			label.text = str(ing)
			$VBox/JarDetails/MarginContainer/Ingredients.add_child(label)
	else:
		$VBox/JarDetails.visible = false

func hide_details():
	self.visible = false

func _on_Grab_pressed():
	get_node(Heda.ROBOT).grab(Heda.current_selection)

func _on_Weigh_pressed():
	get_node(Heda.ROBOT).weigh(Heda.current_selection)

func _on_Store_pressed():
	get_node(Heda.ROBOT).store(Heda.current_selection)

func _on_Empty_pressed():
	Heda.current_selection.empty_ingredients()

func _on_AddIngredient_pressed():
	var qty = $VBox/JarDetails/IngredientQuantity.value
	var food = Lib.get_item_list_selected_meta_data(food_list)
	Heda.current_selection.get_data().add_ingredient(Ingredient.new(qty, food))
	pass
