extends Node

func update_jar_info():
	pass

func jar_ready(jar):
	var l = Label.new()
	l.text = str(jar.jar_id)
	$Jars/VBox.add_child(l)

func _on_Jars_visibility_changed():
	if $Jars.visible:
		update_jar_info()
