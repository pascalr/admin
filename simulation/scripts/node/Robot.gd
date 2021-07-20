extends Spatial

var motors := []

func _ready():
	motors = [$SupportTransversale,
			  $SupportTransversale/Trolley,
			  $SupportTransversale/Trolley/Humerus,
			  $SupportTransversale/Trolley/Humerus/Wrist,
			  $SupportTransversale/Trolley/Humerus/Wrist/Hand,
			  $SupportTransversale/Trolley/Humerus/Wrist/Hand/GripL,
			  $SupportTransversale/Trolley/Humerus/Wrist/Hand/GripR,
			  $WeightStack1,
			  $WeightStack2]

func get_motor(id : String):
	for motor in motors:
		if motor.id == id:
			return motor

func _wait_done_moving():
	pass

func move(axis, destination):
	yield($Controller.exec("m"+axis+str(destination)), "completed")

func goto(user_coord):
	print("Goto "+str(user_coord))
	var polar = PolarCoord.new().set_from_user_coord(user_coord)
	print("Going to "+str(polar))
	yield(move("b", polar.b), "completed")
	yield(move("h", polar.h), "completed")
	yield(move("y", polar.y), "completed")
	yield(move("t", polar.t), "completed")
	yield(move("a", polar.a), "completed")
	yield(move("r", Globals.max_r), "completed")

func grab(obj):
	print("Grabing")
	var dest = obj.translation+Vector3(0.0,obj.get_height()-20.0,0.0)
	goto(UserCoord.new().set_from_vector(dest, 180.0))
	move("r", obj.diameter)
