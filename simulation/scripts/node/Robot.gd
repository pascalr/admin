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

func move(axis, destination):
	Controller.send("m"+axis+str(destination))

func goto(user_coord):
	print("Goto "+str(user_coord))
	var polar = PolarCoord.new().set_from_user_coord(user_coord)
	print("Going to "+str(polar))
	move("b", polar.b)
	move("h", polar.h)
	move("y", polar.y)
	move("t", polar.t)
	move("a", polar.a)
	move("r", Globals.max_r)

func grab(jar : Jar):
	print("Grabing")
	var dest = jar.translation+Vector3(0.0,jar.lid_bottom_height,0.0)
	goto(UserCoord.new().set_from_vector(dest, 180.0))
