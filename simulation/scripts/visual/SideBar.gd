extends Control

signal save
signal load_store

var rng = RandomNumberGenerator.new()

func _ready():
	$VBox/ActionList.select(0)
	$VBox/JarFormatList.select(0)
	rng.randomize()

func _on_Button_button_up():
	emit_signal("save")

func _on_Button2_button_up():
	emit_signal("load_store")

func _on_ItemList_item_selected(index):
	var name = $VBox/JarFormatList.get_item_text(index)
	if Heda.config.get_node_or_null("JarFormats/"+name) != null:
		Heda.jar_format = Heda.config.get_node("JarFormats/"+name)
		print(Heda.jar_format)


func _on_Button3_button_up():
	get_parent().get_node("Robot").test_limits()

func _on_ActionList_item_selected(index):
	Heda.current_action = index
	match index:
		Globals.ACTION_SELECT:
			print("Selecting")
		Globals.ACTION_ADD_JAR:
			print("Adding jar")
		Globals.ACTION_PUT_DOWN:
			print("Putting down")


func _on_Button4_button_up():
	
	# Try 10 times
	for _i in range(0,10):
		var x = rng.randf_range(Globals.min_x, Globals.max_x)
		var z = rng.randf_range(Globals.min_z, Globals.max_z)
		var pos = Vector3(x,Heda.cupboard.working_shelf.get_height(),z)
		if Heda.cupboard._check_add_jar(Heda.cupboard.working_shelf, pos):
			break
	pass
