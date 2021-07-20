extends Spatial

class_name Jar

signal selected(obj)
signal deselected(obj)

var body : MeshInstance
var lid : MeshInstance
var shape : CollisionShape
var area : Area
var selection_box : MeshInstance

var lid_bottom_height := 155.8
var total_height := 169.0
var diameter := 112.0

var jar_id : int

var shelf : Shelf

var grab_above : bool

func get_obj_id():
	return jar_id

# The height of the jar when empty, or the height with the lid when present
func get_height():
	return total_height

# Called when the node enters the scene tree for the first time.
func _init():
	body = MeshInstance.new()
	var body_mesh : Mesh = load('res://models/jar_big.obj')
	body.set_mesh(body_mesh)
	# FIXME NOT WORKING...
	body.material_override = load('res://resources/glass.material')
	add_child(body)
	
	lid = MeshInstance.new()
	var lid_mesh : Mesh = load('res://models/lid_big.obj')
	lid.set_mesh(lid_mesh)
	lid.translation.y = lid_bottom_height
	# FIXME NOT WORKING...
	lid.material_override = load('res://resources/lid_steel.material')
	add_child(lid)
	
	selection_box = MeshInstance.new()
	var selection_box_mesh = CubeMesh.new()
	selection_box_mesh.size = Vector3(diameter, total_height, diameter)
	var selection_mat = SpatialMaterial.new()
	selection_mat.albedo_color = Color8(0,0,255,80)
	selection_mat.flags_transparent = true
	selection_box_mesh.material = selection_mat
	selection_box.set_mesh(selection_box_mesh)
	selection_box.translation.y = total_height/2.0
	selection_box.visible = false
	add_child(selection_box)
	
	shape = CollisionShape.new()
	shape.shape = load('res://resources/jar_big.shape')
	
	area = Area.new()
	area.add_child(shape)
	var _foo = area.connect("input_event", self, "_toggle_selection")
	add_child(area)

func _ready():
	var _foo = self.connect("selected", get_tree().root.get_node("Simulation"), "_obj_selected")
	var _bar = self.connect("deselected", get_tree().root.get_node("Simulation"), "_obj_deselected")

func _toggle_selection(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		selection_box.visible = !selection_box.visible
		if selection_box.visible:
			emit_signal("selected", self)
		else:
			emit_signal("deselected", self)
