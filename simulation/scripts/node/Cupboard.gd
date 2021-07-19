extends Spatial

export var max_angle = 150.0
export var opening_speed = 50.0

var min_dist_between_jars = 114.3

var opening = true

var jar_added_request : HTTPRequest

var jar_id_counter = 1

func _ready():
	jar_added_request = HTTPRequest.new()
	add_child(jar_added_request)
	var _v = jar_added_request.connect("request_completed", self, "_jar_added")

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
	
	$Inventory.add_child(jar)
	jar.visible = true # TODO: Set to visible only when the request is confirmed
	
	var params = "x="+str(jar.translation.x)+"&y="+str(jar.translation.y)
	params += "&z="+str(jar.translation.z)+"&jar_id="+str(jar.jar_id)
	var _err = jar_added_request.request("http://localhost:4567/add_jar?"+params)

func _check_add_jar(event, click_position):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		var jar = Jar.new()
		jar.translation = click_position
		
		for j in $Inventory.get_children():
			if (click_position.y - j.translation.y) < 0.2:
				if ((click_position - j.translation).length() < min_dist_between_jars):
					print("Collision!")
					return false
		
		_add_jar(jar)
		return true
		
	return false
	
func _on_LowerSmallShelf_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	_check_add_jar(event, click_position)

func _on_BottomShelf_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	_check_add_jar(event, click_position)

func _on_WorkingShelf_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	_check_add_jar(event, click_position)

func _on_UpperShelf1_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	_check_add_jar(event, click_position)
