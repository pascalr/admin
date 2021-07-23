extends PanelContainer

func show_details(obj):
	self.visible = true
	$VBox/ObjectName.text = obj.get_class() + " " + str(obj.get_obj_id())
	$VBox/X/Value.text = "%.2f" % obj.translation.x
	$VBox/Y/Value.text = "%.2f" % obj.translation.y
	$VBox/Z/Value.text = "%.2f" % obj.translation.z
	
	#if obj.get_class() == "Jar":

func hide_details():
	self.visible = false
