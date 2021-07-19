extends Control

var output
var text

var command_request : HTTPRequest

func _ready():
	command_request = HTTPRequest.new()
	add_child(command_request)
	#get_node("CommandLine").grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_CommandLine_text_entered(new_text):
	print("Command: " + new_text)
	var url = "http://localhost:4567/execute?cmd="+new_text.replace(" ","+")
	var _err = command_request.request(url)
	#Brain.execute_command(new_text)
	output = get_node("Panel/Output")
	get_node("CommandLine").clear() # FIXME: Should be self?
	text = output.text
	if !text.empty():
		text += "\n"
	text += "> " + new_text
	output.set_text(text)

func _on_CommandLine_focus_entered():
	get_tree().root.get_node("Simulation/Camera").has_focus = false

func _on_CommandLine_focus_exited():
	get_tree().root.get_node("Simulation/Camera").has_focus = true
