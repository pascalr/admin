extends PanelContainer

func _ready():
	_on_InsertToolDetails_visibility_changed()
	var _a = Datastore.connect("jars_updated", self, "_update")

func _update():
	$VBox/JarId.clear()
	if not Cache.loaded:
		yield(Cache, "loaded")
	for jar in Jar.all():
		if jar.pos_x == 0.0:
			var content = jar.foods_info()
			if content.empty():
				content = "Empty"
			$VBox/JarId.add_item(str(jar.jar_id)+" - "+jar.format.name+" - "+content, jar.jar_id)
	if $VBox/JarId.get_item_count() > 0:
		$VBox/JarId.select(0)

func _on_InsertToolDetails_visibility_changed():
	if visible:
		_update()
