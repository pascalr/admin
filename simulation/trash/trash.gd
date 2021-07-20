extends Node

func _send_done():
	print("Destination reached!")
	$DoneRequest.request("http://localhost:4567/done")
	
var url = "http://localhost:4567/execute?cmd=grab+"+str(current_selection.get_obj_id())
var _err = $CommandRequest.request(url)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
