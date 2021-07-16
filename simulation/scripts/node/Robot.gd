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

func grab(jar : Jar):
	print("Grabing")
	goto(UserCoord.new().set_from_vector(jar.translation, 180.0))

# y10.0x20a90.0
func set_destination(s):
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]\\-?\\d+")
	for result in regex.search_all(s):
		var r = result.get_string()
		var id = r[0]
		for motor in motors:
			if motor.id == id:
				motor.destination = float(r.substr(1))
	return self
