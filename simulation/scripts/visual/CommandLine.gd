extends LineEdit

func _ready():
	var _a = self.connect("text_entered", self, "_on_text_entered")

func _is_pos_in(checkpos:Vector2):
	var gr=get_global_rect()
	return checkpos.x>=gr.position.x and checkpos.y>=gr.position.y and \
		   checkpos.x<gr.end.x and checkpos.y<gr.end.y
	
func _input(event):
	if event is InputEventMouseButton and not _is_pos_in(event.position) or \
	   event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_cancel"):
		release_focus()

func _on_text_entered(text):
	get_node(Heda.INTERPRETER).run(text)
	self.clear()
