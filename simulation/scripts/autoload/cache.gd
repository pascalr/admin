extends Node

# The key is the model_name, the value is a dict of rows by id
var data := {}

enum {MOD_INSERT, MOD_UPDATE, MOD_DELETE}

class Modification:
	var type : int
	var record
	
	func _init(_type, _record):
		type = _type; record = _record

# A list of modifications to the cache to be pushed to the server
var modifications := []
var batch_size := 10
var batch := []

var loading := false
var loaded := false
signal loaded

var push_modifications_timer := Timer.new()

func list(table):
	return data[table.name].values() if data.has(table.name) else null

func first(table):
	if (data.has(table.name) and data[table.name].size() >= 1):
		return data[table.name].values()[0]
	return null

func _ensure_table_exists(table_name):
	if not data.has(table_name):
		data[table_name] = {}
	return data[table_name]

func save(obj):
	var table_name = obj.get_table().name
	if obj.id == -1:
		obj.id = _next_id(table_name)
		modifications.push_back(Modification.new(MOD_INSERT, obj))
	else:
		modifications.push_back(Modification.new(MOD_UPDATE, obj))
	var table = _ensure_table_exists(table_name)
	table[int(obj.id)] = obj
	obj.get_table().emit_signal("modified")

func _next_id(model_name):
	assert(data.has(model_name))
	var ids = data[model_name].keys()
	if ids.size() > 0:
		return ids.max()+1
	return 1

func find(table, id):
	return data[table.name][int(id)]

func _ready():
	load_from_server()
	
	var _a = push_modifications_timer.connect("timeout",self,"push_modifications_to_server") 
	push_modifications_timer.wait_time = 10.0
	add_child(push_modifications_timer)
	push_modifications_timer.start()

func load_from_server():
	if not loading:
		loading = true
		var request := HTTPRequest.new()
		var _a = request.connect("request_completed",self,"_on_load_from_server", [request])
		add_child(request)
		var error = request.request(Heda.HOST+"pull_machine")
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
	# TODO: Save locally and save as backup too
	yield(push_modifications_to_server(), "completed")
	get_tree().quit()

var _push_mod_request : HTTPRequest
func push_modifications_to_server():
	
	if modifications.empty():
		yield(get_tree(), "idle_frame")
		print("No modifications to push to the server.")
		return
	
	while !modifications.empty():
		yield(push_batch(), "completed")

func push_batch():
	#assert(_push_mod_request == null) FIXME......................
	if !batch.empty():
		yield(get_tree(), "idle_frame")
		push_error("FIXMEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
		return null
	#assert(batch.empty()) # I don't know how to handle when there was an error pushing mods...
	var n = min(modifications.size(), batch_size)
	for i in n:
		batch.push_back(modifications.pop_front())

	print("Pushing modidications to server...")	
	var mods := []
	for mod in batch:
		mods.push_back({"type": mod.type, "class": mod.record.get_class(), "id": mod.record.id, "record": mod.record.to_dict()})
	print(mods)
	var body = to_json(mods)
#
	_push_mod_request = HTTPRequest.new()
	var _a = _push_mod_request.connect("request_completed",self,"_on_modifications_pushed_to_server")
	add_child(_push_mod_request)
	var _err = _push_mod_request.request(Heda.HOST+"push_modifications", [], true, HTTPClient.METHOD_POST, body)
	print("1")
	yield(_push_mod_request, "request_completed")
	print("3")
	_push_mod_request.queue_free()
	_push_mod_request = null

func _on_modifications_pushed_to_server(_result, response_code, _headers, _body):
	if response_code != 200:
		push_error("DATA WAS NOT SAVED. TODO: A PANEL THAT ASKS TO QUIT ANYWAY...")
	else:
		batch.clear()
	print("2")
