extends Spatial

export var max_angle = 150.0
export var opening_speed = 50.0

# TODO: Rename this to accessible shelf
onready var working_shelf = $Shelves/WorkingShelf
#onready var bottom_shelf = $Shelves/BottomShelf

onready var door_shelves = $door_l/Shelves.get_children() + $door_r/Shelves.get_children()
onready var rear_shelves = $Shelves.get_children()
onready var shelves = rear_shelves + door_shelves

onready var rear = $frame/frame_rear

# Bodies that are not attached to the hand
onready var bodies = $Bodies

var opening = false

var jar_added_request : HTTPRequest

var jar_id_counter = 1

func _ready():
	jar_added_request = HTTPRequest.new()
	add_child(jar_added_request)
	var _v = jar_added_request.connect("request_completed", self, "_jar_added")
	
	var _c = $frame.connect("body_entered", self, "_collision_detected", [$frame])
	var _d = $frame.connect("body_exited", self, "_collision_gone", [$frame])
	
	for shelf in shelves:
		var area = shelf.get_area()
		var _a = area.connect("body_entered", self, "_collision_detected", [area])
		var _b = area.connect("body_exited", self, "_collision_gone", [area])

func _process(delta):
	#var dest = max_angle if opening else 0
	var dl=0
	var dr=0
	
	if opening:
		dl = max(rad2deg(get_node("door_l").rotation.y) - opening_speed*delta, -max_angle)	
		dr = min(rad2deg(get_node("door_r").rotation.y) + opening_speed*delta, max_angle)
	else:
		dl = min(rad2deg(get_node("door_l").rotation.y) + opening_speed*delta, 0)	
		dr = max(rad2deg(get_node("door_r").rotation.y) - opening_speed*delta, 0)
	
	get_node("door_l").rotation.y = deg2rad(dl)
	get_node("door_r").rotation.y = deg2rad(dr)

func open_doors():
	self.opening = true
	
func close_doors():
	self.opening = false

func _jar_added(_result, _response_code, _headers, _body):
	# TODO: Read id of jar added and set to visible
	pass

func _add_jar(jar):
	jar.jar_id = jar_id_counter
	jar_id_counter += 1
	
	bodies.add_child(jar)
	jar.visible = true # TODO: Set to visible only when the request is confirmed
	
#	var params = "jar_id="+str(jar.jar_id)+"&x="+str(jar.translation.x)
#	params += "&y="+str(jar.translation.y)+"&z="+str(jar.translation.z)
#	var _err = jar_added_request.request("http://localhost:4567/add_jar?"+params)

func _check_add_jar(jar, click_position):
	if jar:
		if Lib.is_valid_jar_position(jar.format, click_position):
			jar.set_position(click_position)
			jar.save()
			var node = preload("res://scenes/JarInstance.tscn").instance()
			node.jar = jar
			bodies.add_child(node)
			return true
	return false
	
#	var jar = Jar.new()
#	jar.translation = click_position
#	jar.shelf = shelf
#	jar.grab_above = shelf.grab_above
#	jar.format = Heda.jar_format
#
#	var ing = Ingredient.new()
#	var full_weight = Heda.jar_format.volume * Heda.food.density
#	ing.food = Heda.food
#	ing.weight = full_weight/2.0 + full_weight/2.0*randf()
#	jar.ingredients = [ing]
#
#	var is_valid = Lib.is_valid_jar_position(jar.format, click_position)
#	if is_valid:
#		_add_jar(jar)
#		return jar

func _on_shelf_click(shelf, click_position):
	match Heda.current_action:
		Globals.ACTION_ADD_JAR:
			_check_add_jar(Heda.get_selected_jar(),click_position)
		Globals.ACTION_PUT_DOWN:
			get_node(Heda.ROBOT).put_down_at(shelf, click_position)

func _collision_detected(body, area):
	get_node(Heda.COLLISION_DETAILS).add_collision(area, body)

func _collision_gone(body, area):
	get_node(Heda.COLLISION_DETAILS).remove_collision(area, body)
