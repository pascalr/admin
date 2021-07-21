extends Control

signal save
signal load_store

func _on_Button_button_up():
	emit_signal("save")

func _on_Button2_button_up():
	emit_signal("load_store")

func _on_ItemList_item_selected(index):
	Settings.jar_format = $VBox/JarFormatList.get_item_text(index)
	print(Settings.jar_format)
