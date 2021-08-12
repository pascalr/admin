tool
extends Spatial

class_name JarInstance

onready var selection_box = $SelectionBox

var jar setget set_jar

func get_class():
	return "JarInstance"

func _enter_tree():
	
	var format = $Format
	
	$Lid.translation.y = format.height_with_lid - format.lid_height

	$Sticker.translation.y = format.height_with_lid + 1.0
	$Sticker.scale = Vector3(20.0, 1.0, 20.0)

	$Mesh.mesh = format.jar_obj
	$Lid.mesh = format.lid_obj

	$SelectionBox.mesh.size = Vector3(format.diameter, format.height_with_lid, format.diameter)
	$SelectionBox.translation.y = format.height_with_lid/2.0
	$SelectionBox.visible = false

	$Content.mesh.top_radius = format.diameter/2.0-5.0
	$Content.mesh.bottom_radius = format.diameter/2.0-5.0
	$Content.mesh.material = SpatialMaterial.new() # FIXME: WHY OH WHY???
	if jar == null or jar.ingredients.empty():
		$Content.visible = false
#
	$Body/CollisionShape.shape.radius = format.diameter/2.0
	$Body/CollisionShape.shape.height = format.height_with_lid
	$Body/CollisionShape.translation.y = format.height_with_lid/2.0

func _ready():
	var _c = $Body.connect("input_event", self, "_toggle_selection")

func _exit_tree():
	if jar:
		if jar.nodes.size() <= 1:
			jar.set_position(Vector3(0.0, 0.0, 0.0))
			jar.save()
		jar.deconnect_node(self)

func set_jar(_jar):
	jar = _jar
	jar.connect_node(self)
	on_data_changed()
	
func on_data_changed():
	print("JarNode on_data_changed")
	self.translation = jar.get_position()
	$Format.copy(jar.format)
	self.name = "Jar - %d" % jar.jar_id
	if jar.ingredients.size() > 0:
		print("There is one ingredient JarNode on_data_changed")
		$Content.mesh.material.albedo_color = jar.ingredients[0].food.color
		var h = jar.ratio_filled() * $Format.max_content_height
		$Content.mesh.height = h
		$Content.translation.y = h/2.0
		$Content.visible = true
	else:
		$Content.visible = false

func _toggle_selection(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		$SelectionBox.visible = !$SelectionBox.visible
		if $SelectionBox.visible:
			var _a = get_node(Heda.CORE)._obj_selected(self)
		else:
			var _b = get_node(Heda.CORE)._obj_deselected(self)
