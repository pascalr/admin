extends Spatial

signal shelf_click

class_name Shelf

export var grab_above := true

func _ready():
	for child in get_children():
		if child is CollisionObject:
			var _b = child.connect("input_event", self, "_on_input_event")
	
	var _a = self.connect("shelf_click", get_node("/root/Simulation/Cupboard"), "_on_shelf_click")

func _on_input_event(_camera, event, click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		emit_signal("shelf_click", self, click_position)
