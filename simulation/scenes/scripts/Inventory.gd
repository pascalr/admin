extends Node

onready var jar_list = $Jars/VBox/ScrollContainer/Items

onready var food_in_inventory_list = $Foods/VBox/InInventoryList
onready var food_other_list = $Foods/VBox/OtherFoodList

func _ready():
	var _a = Datastore.connect("jar_data_list_updated", self, "update_jar_info")

func update_jar_info():
	Lib.remove_all_children(jar_list)
	for jar_data in Datastore.jar_data_list:
		var item = preload("res://scenes/JarItem.tscn").instance()
		item.get_node("HBox/Id").text = str(jar_data.jar_id)
		item.get_node("HBox/Format").text = str(jar_data.format.name)
#		item.get_node("HBox/Format").add_item("")
#		for f in Heda.get_node(Heda.JAR_FORMATS).get_children():
#			item.get_node("HBox/Format").add_item(f.name)
#		item.get_node("HBox/Format").connect("item_selected", self, "on_jar_info_jar_format_selected", [jar_data])
		#item.get_node("HBox/Weight").text = str(jar.get_weight())
		item.get_node("HBox/Content").text = "TODO"#jar.foods_info()
		item.get_node("HBox/Filled").text = "FIXME"#""%.2f" % (jar.ratio_filled()*100.0) + "%"
		#item.get_node("HBox/Position").text = str(jar.get_weight())
		jar_list.add_child(item)

func on_jar_info_jar_format_selected(_jar_data):
	pass

func update_food_list_info():
	var in_inventory := {}
	for jar in get_tree().get_nodes_in_group("jars"):
		var ing = jar.main_ingredient().food
		if ing:
			in_inventory[ing.id] = true
	
	Lib.remove_all_children([food_in_inventory_list, food_other_list])
	
	for food in Food.all():
		var label = Label.new()
		label.text = food._name
		if in_inventory.has(food.id):
			food_in_inventory_list.add_child(label)
		else:
			food_other_list.add_child(label)

#	for jar in get_tree().get_nodes_in_group("jars"):
#		var ing = jar.main_ingredient()
#		if ing:
#

func jar_ready(jar):
	assert(true)
	assert(false)
	var l = Label.new()
	l.text = str(jar.jar_id)
	$Jars/VBox.add_child(l)

func _on_Jars_visibility_changed():
	if $Jars.visible:
		update_jar_info()

func _on_Foods_visibility_changed():
	if $Foods.visible:
		update_food_list_info()

func _on_AddJar_pressed():
	Datastore.add_new_jar_data()
