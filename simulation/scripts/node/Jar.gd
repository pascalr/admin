extends Spatial

class_name Jar

var body : MeshInstance
var lid : MeshInstance
var shape : CollisionShape
var area : Area
var lid_bottom_height = 155

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
	
	shape = CollisionShape.new()
	shape.shape = load('res://resources/jar_big.shape')
	
	area = Area.new()
	area.add_child(shape)
	self.add_child(area)
