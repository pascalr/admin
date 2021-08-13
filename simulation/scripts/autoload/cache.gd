extends Node

# The key is the model_name, the value is a dict of rows by id
var data := {}

enum {MOD_INSERT, MOD_UPDATE, MOD_DELETE}

class Modification:
	var type : int
	var record

# A list of modifications to the cache to be pushed to the server
var modifications := []

var loading := false
var loaded := false
signal loaded

func list(table):
	return data[table.name].values() if data.has(table.name) else null

func _ensure_table_exists(table_name):
	if not data.has(table_name):
		data[table_name] = {}
	return data[table_name]

func save(obj):
	var table_name = obj.get_table().name
	if obj.id == -1:
		obj.id = _next_id(table_name)
	var table = _ensure_table_exists(table_name)
	table[int(obj.id)] = obj
	obj.get_table().emit_signal("modified")

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
	
	for table in Tables.ALL:
		if json.result.has(table.name):
			_ensure_table_exists(table.name)
			var records = json.result[table.name]
			for record_dict in records:
				var record = table.klass.new().load_data(record_dict)
				data[table.name][int(record.id)] = record
	
	loaded = true
	emit_signal("loaded")
	request.queue_free()

func close():
	push_modifications_to_server()
	# TODO: Save locally and save as backup too

func push_modifications_to_server():

#	for table in [Tables.JARS, Tables.WEIGHINGS]:
#		var _records := []
#		for record in table.all():
#			_records.push_back(record.to_dict())
#		_data[table.name] = _records
#	var body = to_json(_data)
	
	var _data := []
	for jar_data in Jar.all():
		_data.push_back(jar_data.to_dict())
	var body = to_json({"jars": _data})
	
	var request := HTTPRequest.new()
	var _a = request.connect("request_completed",self,"_on_modifications_pushed_to_server", [request])
	add_child(request)
	var _err = request.request(Heda.HOST+"sim/push_machine", [], true, HTTPClient.METHOD_POST, body)

func _on_modifications_pushed_to_server(_result, response_code, _headers, _body, request):
	if response_code != 200:
		push_error("DATA WAS NOT SAVED. TODO: A PANEL THAT ASKS TO QUIT ANYWAY...")
	request.queue_free()
	get_tree().quit()
