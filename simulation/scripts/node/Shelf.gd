extends Spatial

signal shelf_click

class_name Shelf

export var grab_above := true
export var single_row := true

export(String, "Big", "Medium", "Small", "Spice", "Bottle") var preferred_jar_format = "Big"

func get_preferred_jar_format():
	return get_node(Heda.CONFIG+"/JarFormats/"+preferred_jar_format)

func get_middle_x():
	return $Area/CollisionShape.global_transform.origin.x
func get_min_x():
	return get_middle_x()-$Area/CollisionShape.shape.extents.x+Globals.min_jar_to_border_dist()
func get_max_x():
	return get_middle_x()+$Area/CollisionShape.shape.extents.x-Globals.min_jar_to_border_dist()

func get_middle_z():
	return $Area/CollisionShape.global_transform.origin.z
func get_min_z():
	return get_middle_z()-$Area/CollisionShape.shape.extents.z+Globals.min_jar_to_border_dist()
func get_max_z():
	return get_middle_z()+$Area/CollisionShape.shape.extents.z-Globals.min_jar_to_border_dist()

func get_height():
	return $Area/CollisionShape.global_transform.origin.y + $Area/CollisionShape.shape.extents.y	

func get_jars():
	var jars = []
	for j in get_tree().get_nodes_in_group("jars"):
		if j.shelf == self:
			jars.push_back(j)
	#for c in get_children():
	#	if c is Jar:
	#		jars << c
	return jars

func get_free_positition(jar):
	if single_row:
		for x in range(get_min_x(), get_max_x(), 5):
			var pos = Vector3(x, get_height(), get_middle_z())
			if Lib.is_valid_jar_position(jar,pos):
				print("free: "+str(pos))
				return pos
	else:
		for x in range(get_min_x(), get_max_x(), 5):
			for z in range(get_min_z(), get_max_z(), 5):
				var pos = Vector3(x, get_height(), z)
				if Lib.is_valid_jar_position(jar,pos):
					print("free: "+str(pos))
					return pos

func _ready():
	for child in get_children():
		if child is CollisionObject:
			print("Connecting input_event")
			var _b = child.connect("input_event", self, "_on_input_event")
	
	var _a = self.connect("shelf_click", get_node(Heda.CUPBOARD), "_on_shelf_click")

func _on_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		emit_signal("shelf_click", self, click_position)
