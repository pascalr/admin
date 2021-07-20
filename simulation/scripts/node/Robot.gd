extends Spatial

var motors := []

onready var humerus = $SupportTransversale/Trolley/Humerus
onready var wrist = $SupportTransversale/Trolley/Humerus/Wrist

func _ready():
	motors = [$SupportTransversale,
			  $SupportTransversale/Trolley,
			  humerus,
			  wrist,
			  $SupportTransversale/Trolley/Humerus/Wrist/Hand,
			  $SupportTransversale/Trolley/Humerus/Wrist/Hand/Grip]

func get_motor(id : String):
	for motor in motors:
		if motor.id == id:
			return motor

func _wait_done_moving():
	pass

func get_angle():
	return humerus.position + wrist.position

func move(axis, destination):
	yield($Controller.exec("m"+axis+str(destination)), "completed")

func goto(user_coord):
	print("Goto "+str(user_coord))
	var polar = PolarCoord.new().set_from_user_coord(user_coord)
	print("Going to "+str(polar))
	yield(move("y", polar.y), "completed")
	yield(move("b", polar.b), "completed")
	yield(move("h", polar.h), "completed")
	yield(move("t", polar.t), "completed")
	yield(move("a", polar.a), "completed")

func _move_straigth(vect):
	yield(goto(UserCoord.new().set_from_vector(vect, get_angle())), "completed")

func _grab_above(obj):
	var above = obj.translation+Vector3(0.0,obj.get_height()+10.0,0.0)
	yield(goto(UserCoord.new().set_from_vector(above, 180.0)), "completed")
	var dest = obj.translation+Vector3(0.0,obj.get_height()-20.0,0.0)
	yield(move("r", Globals.max_r), "completed")
	yield(goto(UserCoord.new().set_from_vector(dest, 180.0)), "completed")
	yield(move("r", obj.diameter), "completed")

func _grab_in_front(obj):
	var angle = 180.0 if obj.translation.z < Globals.max_z else 0.0
	var in_front = obj.translation
	# FIXME: TODO in_front.x 
	in_front.y += obj.get_height()-50.0
	in_front.z += obj.diameter * -cos(angle*PI/180.0)
	yield(goto(UserCoord.new().set_from_vector(in_front, angle)), "completed")
	var dest = obj.translation+Vector3(0.0,obj.get_height()-50.0,0.0)
	yield(move("r", Globals.max_r), "completed")
	yield(_move_straigth(dest), "completed")
	yield(move("r", obj.diameter), "completed")

func grab(obj):
	print("Grabing")
	if obj.grab_above:
		_grab_above(obj)
	else:
		_grab_in_front(obj)
