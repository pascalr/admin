extends Node

# The key is the model_name, the value is a dict of rows by id
var data := {}

# A list of modifications to the cache to be pushed to the server
var modifications := []

var loading := false
var loaded := false
signal loaded

func list(table):
	return data[table.name].values() if data.has(table.name) else null

func save(obj):
	_save(obj)
	obj.get_table().emit_signal("modified")

func _save(obj):
	var table_name = obj.get_table().name
	if obj.id == -1:
		obj.id = _next_id(table_name)
	if not data.has(table_name):
		data[table_name] = {}
	var table = data[table_name]
	table[int(obj.id)] = obj

func _next_id(model_name):
	if data.has(model_name):
		var ids = data[model_name].keys()
		if ids.size() > 0:
			return ids.max()+1
	return 1

func find(table, id):
	return data[table.name][int(id)]

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
	Tables.FOODS.emit_signal("modified")
	
	var jar_list = json.result["jars"]
	for jar_data in jar_list:
		var jar = Jar.new().load_data(jar_data)
		_save(jar)
	Tables.JARS.emit_signal("modified")
	
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
