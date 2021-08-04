extends Node

onready var jar_list = $Jars/VBox/ScrollContainer/Items

func update_jar_info():
	for c in jar_list.get_children():
		c.queue_free()
	for jar in get_tree().get_nodes_in_group("jars"):
		var item = preload("res://scenes/JarItem.tscn").instance()
		item.get_node("HBox/Id").text = str(jar.jar_id)
		#item.get_node("HBox/Weight").text = str(jar.get_weight())
		item.get_node("HBox/Food").text = jar.foods_info()
		item.get_node("HBox/Filled").text = "%.2f" % (jar.ratio_filled()*100.0) + "%"
		#item.get_node("HBox/Position").text = str(jar.get_weight())
		jar_list.add_child(item)

func jar_ready(jar):
	assert(true)
	assert(false)
	var l = Label.new()
	l.text = str(jar.jar_id)
	$Jars/VBox.add_child(l)

func _on_Jars_visibility_changed():
	if $Jars.visible:
		update_jar_info()
