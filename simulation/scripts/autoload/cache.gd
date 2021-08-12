extends Node

# The key is the model_name, the value is a dict of rows by id
var data := {}

# A list of modifications to the cache to be pushed to the server
var modifications := []

var loading := false
var loaded := false
signal loaded

signal table_modified(table_name)

func list(model_name):
	assert(loaded)
	return data[model_name].values() if data.has(model_name) else null

func save(obj):
	assert(loaded)
	_save(obj)
	emit_signal("table_modified", obj.get_class())

func _save(obj):
	if obj.id == -1:
		obj.id = _next_id(obj.get_class())
	if not data.has(obj.get_class()):
		data[obj.get_class()] = {}
	var table = data[obj.get_class()]
	table[int(obj.id)] = obj

func _next_id(model_name):
	if data.has(model_name):
		var ids = data[model_name].keys()
		if ids.size() > 0:
			return ids.max()+1
	return 1

func find(model_name, id):
	return data[model_name][int(id)]

func _ready():
	load_from_server()

func load_from_server():
	if not loading:
		loading = true
		var request := HTTPRequest.new()
		var _a = request.connect("request_completed",self,"_on_load_from_server", [request])
		add_child(request)
		var error = request.request(Heda.HOST+"sim/pull_machine")
		assert(error == OK)

func _on_load_from_server(_result, response_code, _headers, body, request):
	assert(response_code == 200)
	
	var json = JSON.parse(body.get_string_from_utf8())
	
	var foods = json.result["foods"]
	for raw_food in foods:
		var food = Food.new().load_data(raw_food)
		_save(food)
	
	emit_signal("table_modified", "Food")
	
	var jar_list = json.result["jars"]
	for jar_data in jar_list:
		var jar = Jar.new().load_data(jar_data)
		_save(jar)
	
	emit_signal("table_modified", "Jar")
	
	loaded = true
	emit_signal("loaded")
	request.queue_free()

func close():
	push_modifications_to_server()
	# TODO: Save locally and save as backup too

func push_modifications_to_server():

	var _data := []
	for jar_data in Jar.all():
		_data.push_back(jar_data.to_dict())
	var body = to_json({"jar_data_list": _data})
	
	var request := HTTPRequest.new()
	var _a = request.connect("request_completed",self,"_on_modifications_pushed_to_server", [request])
	add_child(request)
	var _err = request.request(Heda.HOST+"sim/push_machine", [], true, HTTPClient.METHOD_POST, body)

func _on_modifications_pushed_to_server(_result, response_code, _headers, _body, request):
	if response_code != 200:
		push_error("DATA WAS NOT SAVED. TODO: A PANEL THAT ASKS TO QUIT ANYWAY...")
	request.queue_free()
	get_tree().quit()
