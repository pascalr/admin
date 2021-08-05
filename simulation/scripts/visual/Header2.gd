tool
extends Label

class_name Header2

func _enter_tree():
	self.valign = Label.VALIGN_BOTTOM
	self.rect_min_size.y = 35
