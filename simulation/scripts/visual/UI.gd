extends Control

onready var command_line = $BottomPanel/CommandLine
onready var output = $BottomPanel/Output

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
	
	$Interpreter.run(new_text)
	command_line.clear() # FIXME: Should be self?
	var text = output.text
	if !text.empty():
		text += "\n"
	text += "> " + new_text
	output.set_text(text)

func _on_CommandLine_focus_entered():
	get_tree().root.get_node("Simulation/Camera").has_focus = false

func _on_CommandLine_focus_exited():
	get_tree().root.get_node("Simulation/Camera").has_focus = true
