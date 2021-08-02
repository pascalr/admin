extends Control

onready var collisions := {}

func _ready():
	self.visible = false

func _key_for_area_and_body(area, body):
	return str(area.name)+","+str(body.name)

func _update_collisions_info():
	$Margin/ColorRect/List/Label.text = ""
	for collision in collisions:
		$Margin/ColorRect/List/Label.text += collision+"\n"

func add_collision(area,body):
	collisions[_key_for_area_and_body(area,body)] = true
	_update_collisions_info()
	self.visible = true

func remove_collision(area,body):
	var _a = collisions.erase(_key_for_area_and_body(area,body))
	if collisions.empty():
		_update_collisions_info()
		self.visible = false
