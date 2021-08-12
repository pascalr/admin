extends Node

# Everything that goes through the web goes through this class maybe

func add_weighing(weighing):
	
	var body = to_json({"weighing": weighing.to_dict()})
	
	var request = HTTPRequest.new()
	var _a = request.connect("request_completed",self,"_on_add_weighing", request)
	add_child(request)
	var error = request.request(Heda.HOST+"sim/add_weighing", [], true, HTTPClient.METHOD_POST, body)
	if error != OK:
		push_error("An error occurred in the add_weighing HTTP request.")
		request.queue_free()

func _on_add_weighing(_result, response_code, _headers, _body, request):
	if response_code != 200:
		push_error("_on_add_weighing HTTP request server did not return 200")
	request.queue_free()
