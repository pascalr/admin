extends Body

class_name Jar

var jar_id : int
var grab_above : bool
var weight : float
var shelf : Shelf
var format : JarFormat

var lid : MeshInstance
var shape : CollisionShape
var area : Area
var selection_box : MeshInstance
var content : MeshInstance

func get_class():
	return "Jar"

func get_obj_id():
	return jar_id

# The height of the jar when empty, or the height with the lid when present
func get_height():
	return format.height_with_lid

func get_diameter():
	return format.diameter

# Called when the node enters the scene tree for the first time.
func _ready():
	var _a = self.connect("selected", get_tree().root.get_node("Simulation"), "_obj_selected")
	var _b = self.connect("deselected", get_tree().root.get_node("Simulation"), "_obj_deselected")
	
	mesh = MeshInstance.new()
	mesh.set_mesh(format.jar_obj)
	mesh.material_override = load('res://resources/glass.material')
	add_child(mesh)
	
	lid = MeshInstance.new()
	lid.set_mesh(format.lid_obj)
	lid.translation.y = format.height_with_lid - format.lid_height
	lid.material_override = load('res://resources/lid_steel.material')
	add_child(lid)
	
	selection_box = MeshInstance.new()
	var selection_box_mesh = CubeMesh.new()
	selection_box_mesh.size = Vector3(format.diameter, format.height_with_lid, format.diameter)
	var selection_mat = SpatialMaterial.new()
	selection_mat.albedo_color = Color8(0,0,255,80)
	selection_mat.flags_transparent = true
	selection_box_mesh.material = selection_mat
	selection_box.set_mesh(selection_box_mesh)
	selection_box.translation.y = format.height_with_lid/2.0
	selection_box.visible = false
	add_child(selection_box)
	
	content = MeshInstance.new()
	var content_mesh = CylinderMesh.new()
	content_mesh.top_radius = format.diameter/2.0-5.0
	content_mesh.bottom_radius = format.diameter/2.0-5.0
	content_mesh.height = format.height_with_lid/2.0
	var content_mat = SpatialMaterial.new()
	content_mat.albedo_color = Color8(255,255,255,255)
	content_mesh.material = content_mat
	content.set_mesh(content_mesh)
	content.translation.y = content_mesh.height/2.0+5.0
	add_child(content)
	
	shape = CollisionShape.new()
	var cylinder = CylinderShape.new()
	cylinder.radius = format.diameter/2.0
	cylinder.height = format.height_with_lid
	shape.translation.y = format.height_with_lid/2.0
	shape.shape = cylinder
	#shape.shape = load('res://resources/jar_big.shape')
	
	area = Area.new()
	area.add_child(shape)
	var _c = area.connect("input_event", self, "_toggle_selection")
	add_child(area)
	
	self.add_to_group("save")
	self.add_to_group("jars")


func _toggle_selection(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		selection_box.visible = !selection_box.visible
		if selection_box.visible:
			emit_signal("selected", self)
		else:
			emit_signal("deselected", self)

func save():
	var save_dict = {
		"class" : get_class(),
		"pos_x" : translation.x,
		"pos_y" : translation.y,
		"pos_z" : translation.z,
		"jar_format" : format.name,
		"jar_id" : jar_id,
		"weight" : weight,
		"grab_above" : grab_above
	}
	return save_dict

func load_key(key, value):
	match key:
		"jar_format":
			self.format = Heda.config.get_node("JarFormats/"+value)
		_:
			self.set(key, value)

func load_data(data):
	self.translation = Vector3(data["pos_x"],data["pos_y"],data["pos_z"])
	self.format = Heda.config.get_node("JarFormats/"+data["jar_format"])
	
	for i in data.keys():
		if i == "pos_x" or i == "pos_y" or i == "pos_z" or i == "jar_format":
			continue
		self.set(i, data[i])
	
	return self
