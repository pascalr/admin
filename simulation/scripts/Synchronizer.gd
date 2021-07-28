extends Node

var host = "http://localhost:3000/"

class_name Synchronizer

func _ready():
	var _a = $PullStateRequest.connect("request_completed",self,"_on_get_state")
	pull_state()

func _on_get_state(_result, _response_code, _headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	for recipe in json.result["recipes"]:
		print("Recipe: " + recipe["name"])

func pull_state():
	$PullStateRequest.request(host+"sim/get_state")

func push_state():
	pass

#func _send_done():
#	print("Destination reached!")
#	$DoneRequest.request("http://localhost:4567/done")
#
#var url = "http://localhost:4567/execute?cmd=grab+"+str(current_selection.get_obj_id())
#var _err = $CommandRequest.request(url)

#var url = "http://localhost:4567/execute?cmd="+new_text.replace(" ","+")
	#var _err = command_request.request(url)
	#Brain.execute_command(new_text)
