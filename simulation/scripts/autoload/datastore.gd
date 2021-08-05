extends Node

signal jar_data_list_updated

var jar_data_list := []

var pull_request

func _enter_tree():
	pull_request = HTTPRequest.new()
	pull_request.connect("request_completed",self,"_on_pull")
	add_child(pull_request)

func push_state():
	pass

func _ready():
	pull()

func save():
	pass
#	var store = File.new()
#	store.open("user://datastore.save", File.WRITE)
#
#	for jar_data in jar_data_list:
#		store.store_line(to_json(jar_data.to_dict()))
#
#	store.close()

#func load():
#
#	var store = File.new()
#	if not store.file_exists("user://datastore.save"):
#		return
#	store.open("user://datastore.save", File.READ)
#
#	jar_data_list.clear()
#
#	while store.get_position() < store.get_len():
#
#		var node_data = parse_json(store.get_line())
#
#		if node_data["class"] == "JarData":
#			jar_data_list.push_back(JarData.new().load_data(node_data))
#		else:
#			print("Unkown class " + node_data["class"] + " in store.")
#
#	store.close()
#
#	emit_signal("jar_data_list_updated")

func clear():
	jar_data_list.clear()

func push():
	pass

func pull():
	pull_request.request(Heda.HOST+"sim/pull_machine")

func _on_pull(_result, response_code, _headers, body):
	if response_code == 200:
		clear()
		var json = JSON.parse(body.get_string_from_utf8())
		var jars = json.result["jars"]
		for jar in jars:
			jar_data_list.push_back(JarData.new().load_data(jar))
		emit_signal("jar_data_list_updated")

func next_jar_id():
	var ids_taken := {}
	for jar_data in jar_data_list:
		ids_taken[jar_data.jar_id] = true
	var i = 1
	while true:
		if !ids_taken.has(i):
			return i
		i += 1

func add_new_jar_data():
	var j = JarData.new()
	j.jar_id = next_jar_id()
	jar_data_list.push_back(j)
	emit_signal("jar_data_list_updated")

func find_jar(id):
	for jar in jar_data_list:
		if jar.jar_id == id:
			return jar
	return null
