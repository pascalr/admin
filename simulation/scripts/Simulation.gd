extends Spatial

var current_selection
var poll_received = true

func _ready():
	OS.set_low_processor_usage_mode(true)
	OS.set_low_processor_usage_mode_sleep_usec(50000)
	
	var _a = $PollRequest.connect("request_completed", self, "_poll")
	var _b = $StatusRequest.connect("request_completed", self, "_status")
	$StatusRequest.timeout = 2
	#var _v = command_request.connect("request_completed", self, "_jar_added")

func _input(event):

	if event is InputEventKey and event.is_pressed():
		match event.scancode:
			KEY_I:
				if !$UI/CommandLine.has_focus():
					$Cupboard.close_doors()
			KEY_O:
				if !$UI/CommandLine.has_focus():
					$Cupboard.open_doors()
			KEY_G:
				if current_selection != null:
					var url = "http://localhost:4567/execute?cmd=grab+"+str(current_selection.get_obj_id())
					var _err = $CommandRequest.request(url)
			KEY_ENTER:
				$UI/CommandLine.grab_focus()
			KEY_ESCAPE:
				for obj in $Cupboard/Inventory.get_children():
					if obj is Jar:
						obj.selected = false
			KEY_DELETE:
				if current_selection != null:
					$Cupboard/Inventory.remove_child(current_selection)
					_obj_deselected(current_selection)

func _obj_deselected(_obj):
	if current_selection != null:
		current_selection.selection_box.visible = false
	current_selection = null
	$SideBar/VBox/ObjIdLabel.text = "Obj id: "

func _obj_selected(obj):
	if current_selection != null:
		current_selection.selection_box.visible = false
	$SideBar/VBox/ObjIdLabel.text = "Obj id: "+str(obj.get_obj_id())
	current_selection = obj

func _poll(_result, _response_code, _headers, _body):
	poll_received = true
	var s = _body.get_string_from_utf8()
	if !s.empty():
		print("Poll received: " + s)
		Controller.send(s)

func _on_PollTimer_timeout():
	if poll_received:
		poll_received = false
		$PollRequest.request("http://localhost:4567/poll")

func _send_done():
	print("Destination reached!")
	$DoneRequest.request("http://localhost:4567/done")

func _status(result, _response_code, _headers, _body):
	if result == HTTPRequest.RESULT_SUCCESS:
		$SideBar/VBox/ConnectionStatusLabel.text = "Connection status: OK"
	else:
		$SideBar/VBox/ConnectionStatusLabel.text = "Connection status: Disconected"
	

func _on_StatusTimer_timeout():
	$StatusRequest.request("http://localhost:4567/status")
