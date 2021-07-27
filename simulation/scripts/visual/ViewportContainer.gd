extends ViewportContainer

onready var viewport = get_node("Viewport")

func _ready():
	pass
	#set_process_input(true)

func _input_event(event):
	print("input event!")
	viewport.input(event)
