extends PanelContainer

func _ready():
	_on_InsertToolDetails_visibility_changed()
	var _a = Datastore.connect("jar_data_list_updated", self, "_update")

var foods := []

func _update():
	$VBox/Foods.clear()
	for food in get_node(Heda.FOODS).get_children():
		foods.push_back(food)
		$VBox/Foods.add_item(food._name)
	
	$VBox/JarFormats.clear()
	for format in get_node(Heda.JAR_FORMATS).get_children():
		$VBox/JarFormats.add_item(format.name)
	
	$VBox/JarId.clear()
	for jar in Datastore.jar_data_list:
		if jar.pos_x == 0.0:
			$VBox/JarId.add_item(str(jar.jar_id)+" - "+jar.format.name+" - Empty", jar.jar_id)
	if $VBox/JarId.get_item_count() > 0:
		$VBox/JarId.select(0)

func _on_InsertToolDetails_visibility_changed():
	if visible:
		_update()

func _on_Foods_item_selected(index):
	Heda.food = foods[index]
