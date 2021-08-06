extends PanelContainer

func _ready():
	self.visible = false
	Datastore.connect("food_list_updated", self, "update_food_list")

func update_food_list():
	$VBox/JarDetails/IngredientFood.clear()
	for food in Datastore.food_list:
		if food.in_pantry:
			$VBox/JarDetails/IngredientFood.add_item(food.name)

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
	var food = $VBox/JarDetails/IngredientFood.get_selected_items()
	pass # Replace with function body.
