extends Spatial

class_name Robot

signal grabbed_changed

onready var support = $SupportTransversale
onready var humerus = $SupportTransversale/Trolley/Humerus
onready var wrist = $SupportTransversale/Trolley/Humerus/Wrist
onready var trolley = $SupportTransversale/Trolley
onready var hand = $SupportTransversale/Trolley/Humerus/Wrist/Hand
onready var grip = $SupportTransversale/Trolley/Humerus/Wrist/Hand/Grip
onready var motors = [support, trolley, humerus, wrist, hand, grip]

var grabbed : Spatial
var grabbed_above : bool
var grabbed_height : float

func get_motor(id : String):
	for motor in motors:
		if motor.id == id:
			return motor

func _wait_done_moving():
	pass

func get_angle():
	return humerus.position + wrist.position

func get_a():
	return wrist.position
func get_t():
	return humerus.position
func get_h():
	return trolley.position

func move(axis, destination):
	yield($Controller.exec("m"+axis+str(destination)), "completed")

func get_to(polar):
	print("Getting to "+str(polar))
	yield(move("y", polar.y), "completed")
	yield(move("b", polar.b), "completed")
	yield(move("h", polar.h), "completed")
	yield(move("t", polar.t), "completed")
	yield(move("a", polar.a), "completed")

func goto(user_coord):
	print("Goto "+str(user_coord))
	var polar = PolarCoord.new().set_from_user_coord(user_coord)
	yield(get_to(polar), "completed")

func _move_straigth(vect):
	var user_coord = UserCoord.new().set_from_vector(vect, get_angle())
	var polar = PolarCoord.new().set_from_user_coord(user_coord)
	yield($Controller.exec("t"+str(polar.t)), "completed")

func _grab_above(obj):
	grabbed_height = obj.get_height()-20.0
	var above = obj.translation+Vector3(0.0,obj.get_height()+10.0,0.0)
	yield(goto(UserCoord.new().set_from_vector(above, 180.0)), "completed")
	var dest = obj.translation+Vector3(0.0,grabbed_height,0.0)
	yield(move("r", Globals.max_r), "completed")
	yield(goto(UserCoord.new().set_from_vector(dest, 180.0)), "completed")
	yield(move("r", obj.get_diameter()), "completed")
	grabbed_above = true

func _grab_in_front(obj):
	grabbed_height = 60.0
	var angle = 180.0 if obj.translation.z < Globals.max_z else 0.0
	var in_front = obj.translation
	# FIXME: TODO in_front.x 
	in_front.y += grabbed_height
	in_front.z += obj.get_diameter()/2.0 * -cos(angle*PI/180.0)
	yield(goto(UserCoord.new().set_from_vector(in_front, angle)), "completed")
	var dest = obj.translation+Vector3(0.0,60.0,0.0)
	yield(move("r", Globals.max_r), "completed")
	yield(_move_straigth(dest), "completed")
	yield(move("r", obj.get_diameter()), "completed")
	grabbed_above = false

func grab(obj):
	if grabbed:
		Heda.error("Robot can't grab. It is already grabbing.")
		return
	print("Grabing")
	if obj.grab_above:
		yield(_grab_above(obj),"completed")
	else:
		yield(_grab_in_front(obj),"completed")
	grabbed = obj
	emit_signal("grabbed_changed")
	Lib.parent_adopt_child(hand, obj)
	get_node("/root/Simulation/SideBar/VBox/Grabbed").text = "Grabbed: "+str(obj.get_obj_id())

func _put_down_above(position):
#	if !grabbed_above:
#		Heda.error("Robot can't put down above. The object was grabbed in front.")
#		return
	#var above = position+Vector3(0.0,grabbed.get_height()+10.0,0.0)
	#yield(goto(UserCoord.new().set_from_vector(above, 180.0)), "completed")
	var dest = position+Vector3(0.0,grabbed_height,0.0)
	yield(goto(UserCoord.new().set_from_vector(dest, 180.0)), "completed")
	yield(move("r", Globals.max_r), "completed")

func _put_down_in_front(_shelf, _position):
	if grabbed_above:
		Heda.error("Robot can't put down in front. The object was grabbed above.")
		return
	pass

func put_down(shelf, position):
	if !grabbed:
		Heda.error("Robot can't put down. It is not holding any object.")
		return
	print("Put down " + str(position))
	if shelf.grab_above:
		yield(_put_down_above(position),"completed")
	else:
		yield(_put_down_in_front(shelf, position),"completed")
		
	Lib.parent_adopt_child(Heda.cupboard.inventory, grabbed)
	grabbed = null
	emit_signal("grabbed_changed")
	

func test_limits():
	for motor in motors:
		motor.position = motor.min_position
		motor.destination = motor.min_position
		yield(get_tree().create_timer(4.0), "timeout")
		motor.position = motor.max_position
		motor.destination = motor.max_position
		yield(get_tree().create_timer(4.0), "timeout")
