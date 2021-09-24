extends Node

func _ready():
	yield(Globals, "scene_loaded")
	print("***************** START ANIMATION ******************")
	var jar = Jar.find_by_jar_id(71)
	jar.pos_x = 270; jar.pos_y = 317.5; jar.pos_z = 60.33
	jar.save()
	Heda.get_scene().change_camera(1)
	var robot = Heda.get_robot()
	robot.retrieve(jar)
	print("***************** END ANIMATION ******************")
