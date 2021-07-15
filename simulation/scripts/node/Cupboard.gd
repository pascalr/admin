extends Spatial

export var max_angle = 150.0
export var opening_speed = 50.0

var min_dist_between_jars = 114.3

var opening = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
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

func check_add_jar(event, click_position):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		var jar = Jar.new()
		jar.translation = click_position
		var inventory = get_node("Inventory")
		
		for j in inventory.get_children():
			if (click_position.y - j.translation.y) < 0.2:
				if ((click_position - j.translation).length() < min_dist_between_jars):
					print("Collision!")
					return false
				
		inventory.add_child(jar)
		return true
		
	return false
	
func _on_LowerSmallShelf_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	check_add_jar(event, click_position)

func _on_BottomShelf_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	check_add_jar(event, click_position)

func _on_WorkingShelf_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	check_add_jar(event, click_position)
