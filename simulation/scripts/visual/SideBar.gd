extends Control

signal save
signal load_store

func _on_Button_button_up():
	emit_signal("save")


func _on_Button2_button_up():
	emit_signal("load_store")
