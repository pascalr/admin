extends Control

signal save
signal load_store

func _ready():
	$VBox/ActionList.select(0)
	$VBox/JarFormatList.select(0)

func _on_Button_button_up():
	emit_signal("save")

func _on_Button2_button_up():
	emit_signal("load_store")

func _on_ItemList_item_selected(index):
	var name = $VBox/JarFormatList.get_item_text(index)
	if get_node_or_null("/root/Simulation/Config/"+name) != null:
		Heda.jar_format = Heda.config.get_node(name)
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
