extends Spatial

func _ready():
	$Cupboard.get_node("door_l").rotation.y = 180.0
	$Cupboard.get_node("door_r").rotation.y = 180.0
