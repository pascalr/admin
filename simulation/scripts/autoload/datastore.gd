extends Node

signal jar_data_list_updated
signal food_list_updated

var jar_data_list := []
var food_list := []

var login_request : HTTPRequest
var pull_request : HTTPRequest
var push_request : HTTPRequest

func _enter_tree():
	
	pull_request = HTTPRequest.new()
	var _a = pull_request.connect("request_completed",self,"_on_pull")
	add_child(pull_request)
	
	push_request = HTTPRequest.new()
	var _b = push_request.connect("request_completed",self,"_on_push")
	add_child(push_request)
	
	login_request = HTTPRequest.new()
	var _c = login_request.connect("request_completed",self,"_on_login")
	add_child(login_request)

func push():
	var data := []
	for jar_data in jar_data_list:
		data.push_back(jar_data.to_dict())
	var body = to_json({"jar_data_list": data})
#	$.ajax({
#    //  type: "POST",
#    //  url: "/users/select_unit_system",
#    //  data: {
#    //    authenticity_token: $('[name="csrf-token"]')[0].content,
#    //    unit_system_id: ,
#    //    recipe_id: el.data('id')
#    //  }
#    //});
#    //location.reload();

	var _err = push_request.request(Heda.HOST+"sim/push_machine", [], true, HTTPClient.METHOD_POST, body)

func pull():
	var _err2 = login_request.request(Heda.HOST+"sim/pull_machine")
	var _err = pull_request.request(Heda.HOST+"sim/pull_machine")

func _ready():
	pull()

func save():
	push()
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

func _on_login(_result, _response_code, _headers, _body):
	pass

func _on_pull(_result, response_code, _headers, body):
	if response_code == 200:
		if Heda.get_node(Heda.SCENE) == null:
			push_warning("Skipping Datastore pull because main scene is not loaded.")
		else:
			clear()
			var json = JSON.parse(body.get_string_from_utf8())
			
			var foods = json.result["foods"]
			for raw_food in foods:
				var food = Food.new().load_data(raw_food)
				food_list.push_back(food)
			emit_signal("food_list_updated")
			
			var jars = json.result["jars"]
			for jar in jars:
				var jar_data = Jar.new().load_data(jar)
				jar_data_list.push_back(jar_data)
				if jar_data.get_position().x != 0.0:
					var node = preload("res://scenes/JarInstance.tscn").instance()
					node.jar = jar_data
					Heda.get_node(Heda.CUPBOARD).bodies.add_child(node)
			emit_signal("jar_data_list_updated")
			
				#var jar_data = JarData.new().load_data(jar)
				#jar_data_list.push_back(jar_data)
				#if jar_data.get_position().x != 0.0:
				#	var node = preload("res://scenes/JarNode.tscn").instance()
				#	node.set_jar_data(jar_data)
			#		Heda.get_node(Heda.CUPBOARD).bodies.add_child(node)

func _on_push(_result, response_code, _headers, _body):
	if response_code != 200:
		push_error("DATA WAS NOT SAVED. TODO: A PANEL THAT ASKS TO QUIT ANYWAY...")
	get_tree().quit()

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
	var j = Jar.new()
	j.jar_id = next_jar_id()
	jar_data_list.push_back(j)
	emit_signal("jar_data_list_updated")

func find_jar(id):
	for jar in jar_data_list:
		if jar.jar_id == id:
			return jar
	return null

func find_food(_id):
	for food in food_list:
		if food.id == _id:
			return food
	return null
