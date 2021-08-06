tool
extends Spatial

onready var selection_box = $SelectionBox

var jar_data setget set_jar_data

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

	print("Changing content size for " + name)
	$Content.mesh.top_radius = format.diameter/2.0-5.0
	$Content.mesh.bottom_radius = format.diameter/2.0-5.0
#
	$Body/CollisionShape.shape.radius = format.diameter/2.0
	$Body/CollisionShape.shape.height = format.height_with_lid
	$Body/CollisionShape.translation.y = format.height_with_lid/2.0
	
	var _c = $Body.connect("input_event", self, "_toggle_selection")

func _exit_tree():
	if jar_data:
		if jar_data.nodes.size() <= 1:
			jar_data.set_position(Vector3(0.0, 0.0, 0.0))
		jar_data.deconnect_node(self)

func set_jar_data(_jar_data):
	jar_data = _jar_data
	jar_data.connect_node(self)
	on_data_changed()
	
func on_data_changed():
	print("JarNode on_data_changed")
	self.translation = jar_data.get_position()
	$Format.copy(jar_data.format)
	self.name = "Jar - %d" % jar_data.jar_id
	if jar_data.ingredients.size() > 0:
		$Content.mesh.material.albedo_color = jar_data.ingredients[0].food.color
		$Content.mesh.height = jar_data.ratio_filled() * $Format.max_content_height

func _toggle_selection(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		$SelectionBox.visible = !$SelectionBox.visible
		if $SelectionBox.visible:
			var _a = get_node(Heda.CORE)._obj_selected(self)
		else:
			var _b = get_node(Heda.CORE)._obj_deselected(self)
