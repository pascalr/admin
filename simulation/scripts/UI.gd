extends Control

var output
var text

func _ready():
	get_node("CommandLine").grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_CommandLine_text_entered(new_text):
	print("Command: " + new_text)
	Brain.execute_command(new_text)
	output = get_node("Panel/Output")
	get_node("CommandLine").clear() # FIXME: Should be self?
	text = output.text
	if !text.empty():
		text += "\n"
	text += "> " + new_text
	output.set_text(text)


func _on_CameraZone_focus_entered():
	get_tree().root.get_node("Simulation/Camera").has_focus = true

func _on_CameraZone_focus_exited():
	get_tree().root.get_node("Simulation/Camera").has_focus = false
