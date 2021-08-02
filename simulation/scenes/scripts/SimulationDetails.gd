extends PanelContainer

func _on_Speed_value_changed(value):
	Heda.simulation_speed = value

func _on_Stop_pressed():
	get_tree().paused = !get_tree().paused
