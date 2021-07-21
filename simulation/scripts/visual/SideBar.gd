extends Control

signal save
signal load_store

func _on_Button_button_up():
	emit_signal("save")

func _on_Button2_button_up():
	emit_signal("load_store")

func _on_ItemList_item_selected(index):
	var name = $VBox/JarFormatList.get_item_text(index)
	if get_node_or_null("/root/Simulation/Config/"+name) != null:
		Settings.jar_format = get_node("/root/Simulation/Config/"+name)
		print(Settings.jar_format)
