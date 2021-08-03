extends PanelContainer

func _ready():
	self.visible = false

func show_details(obj):
	self.visible = true
	$VBox/ObjectName.text = obj.get_class() + " " + str(obj.get_obj_id())
	$VBox/X/Value.text = "%.2f" % obj.translation.x
	$VBox/Y/Value.text = "%.2f" % obj.translation.y
	$VBox/Z/Value.text = "%.2f" % obj.translation.z
	
	if obj.get_class() == "Jar":
		$VBox/JarDetails.visible = true
		for child in $VBox/JarDetails/MarginContainer/Ingredients.get_children():
			child.queue_free()
		for ing in obj.ingredients:
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
