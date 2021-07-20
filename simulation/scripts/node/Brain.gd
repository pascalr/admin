extends Node

func _ready():
		
	var _a = $PollRequest.connect("request_completed", self, "_poll")
	$PollRequest.request("http://localhost:4567/poll")
	
	var _b = $StatusRequest.connect("request_completed", self, "_status")
	
	_on_StatusTimer_timeout()

func _status(result, _response_code, _headers, _body):
	if result == HTTPRequest.RESULT_SUCCESS:
		get_node("../SideBar/VBox/ConnectionStatusLabel").text = "Connection status: OK"
	else:
		get_node("../SideBar/VBox/ConnectionStatusLabel").text = "Connection status: Disconected"

func _on_StatusTimer_timeout():
	$StatusRequest.request("http://localhost:4567/status")
	
func _poll(_result, _response_code, _headers, _body):
	var s = _body.get_string_from_utf8()
	if !s.empty():
		print("Poll received: " + s)
		Controller.send(s)
	#yield(get_tree().create_timer(0.02), "timeout")
	$PollRequest.request("http://localhost:4567/poll")
