extends Spatial

func _ready():
	$JarNode.get_node("Content").visible = true
	var mesh = $JarNode.get_node("Content").mesh
	$JarNode.get_node("Content").mesh.material.albedo_color = 255
	$JarNode.get_node("Content").mesh.bottom_radius = 10.0
	$JarNode.get_node("Content").mesh.top_radius = 10.0
	$JarNode.get_node("Lid").translation.y += 50.0
