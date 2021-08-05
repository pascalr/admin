tool
extends Spatial

func _enter_tree():
	
	var format = $Format
	
	$Lid.translation.y = format.height_with_lid - format.lid_height
	
#	var _a = self.connect("selected", get_node(Heda.CORE), "_obj_selected")
#	var _b = self.connect("deselected", get_node(Heda.CORE), "_obj_deselected")

	$Sticker.translation.y = format.height_with_lid + 1.0
	$Sticker.scale = Vector3(20.0, 1.0, 20.0)

	$Mesh.mesh = format.jar_obj

	$SelectionBox.mesh.size = Vector3(format.diameter, format.height_with_lid, format.diameter)
	$SelectionBox.translation.y = format.height_with_lid/2.0
	$SelectionBox.visible = false

	$Content.mesh.top_radius = format.diameter/2.0-5.0
	$Content.mesh.bottom_radius = format.diameter/2.0-5.0
#
	$Body/CollisionShape.shape.radius = format.diameter/2.0
	$Body/CollisionShape.shape.height = format.height_with_lid
	$Body/CollisionShape.translation.y = format.height_with_lid/2.0
	
#	var _c = body.connect("input_event", self, "_toggle_selection")
#
#	self.add_to_group("save")
#	self.add_to_group("jars")

func on_content_change(jar_data):
	$Content.mesh.material.color = Color8(255,255,255,255)
	$Content.mesh.height = jar_data.ratio_filled() * $Format.max_content_height
