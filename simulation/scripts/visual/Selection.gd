extends PanelContainer

func _ready():
	self.visible = false

func show_details(obj):
	self.visible = true
	$VBox/ObjectName.text = obj.get_class() + " " + str(obj.get_obj_id())
	$VBox/X/Value.text = "%.2f" % obj.translation.x
	$VBox/Y/Value.text = "%.2f" % obj.translation.y
	$VBox/Z/Value.text = "%.2f" % obj.translation.z
	
	if obj.get_class() == "Jar":
		$VBox/JarDetails.visible = true
		$VBox/JarDetails/Weight/Value.text = "%.2f" % obj.get_weight()
	else:
		$VBox/JarDetails.visible = false

func hide_details():
	self.visible = false

func _on_Grab_pressed():
	get_node(Heda.ROBOT).grab(Heda.current_selection)

func _on_Weigh_pressed():
	get_node(Heda.ROBOT).weigh(Heda.current_selection)

func _on_Store_pressed():
	get_node(Heda.ROBOT).store(Heda.current_selection)
