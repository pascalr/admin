extends Control

onready var command_line = $BottomPanel/CommandLine
onready var output = $BottomPanel/Output
onready var selection_panel = $ToolPanel/VBox/Selection

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

func _on_Store_pressed():
	get_node(Heda.ROBOT).store(Heda.current_selection)

func _on_Weigh_pressed():
	get_node(Heda.ROBOT).weigh(Heda.current_selection)

func _on_StoreAll_pressed():
	for jar in get_node(Heda.CUPBOARD).working_shelf.get_jars():
		yield(get_node(Heda.ROBOT).store(jar),"completed")

func _on_Grab_pressed():
	get_node(Heda.ROBOT).grab(Heda.current_selection)

func _on_CheckInventory_pressed():
	pass # TODO: Heda goes around and detects where every jar is
	# If a new jar is found, it asks what is inside, and weigh it.
