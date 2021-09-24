extends Node

func anim_robot_retrieve_robot_view():
	var jar = Jar.find_by_jar_id(71)
	jar.pos_x = 270; jar.pos_y = 317.5; jar.pos_z = 60.33
	jar.save()
	Heda.get_scene().change_camera(0)
	var robot = Heda.get_robot()
	robot.retrieve(jar)

func anim_open_doors_robot_retrieve():
	var jar = Jar.find_by_jar_id(71)
	jar.pos_x = 270; jar.pos_y = 317.5; jar.pos_z = 60.33
	jar.save()
	Heda.get_scene().change_camera(1)
	var robot = Heda.get_robot()
	robot.retrieve(jar)
	Heda.get_cupboard().open_doors()
	var camera = Heda.get_scene_viewport().get_camera()
	camera._vel_multiplier = 250
	yield(get_tree().create_timer(2.0), "timeout")
	camera._w = true
	yield(get_tree().create_timer(5.0), "timeout")
	camera._w = false

func _ready():
	yield(Globals, "scene_loaded")
	print("***************** START ANIMATION ******************")
	#anim_open_doors_robot_retrieve()
	anim_robot_retrieve_robot_view()
	print("***************** END ANIMATION ******************")
