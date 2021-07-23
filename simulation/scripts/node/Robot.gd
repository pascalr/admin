extends Spatial

class_name Robot

signal grabbed_changed
signal jar_stored

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

func set_polar(polar):
	support.position = polar.y
	support.position = polar.y
	trolley.position = polar.h
	trolley.position = polar.h
	humerus.position = polar.t
	humerus.position = polar.t
	wrist.position = polar.a
	wrist.position = polar.a
	hand.position = polar.b
	hand.position = polar.b

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
	var angle = Lib.best_angle_for_vect(obj.translation)
	var above = obj.translation+Vector3(0.0,obj.get_height()+10.0,0.0)
	yield(goto(UserCoord.new().set_from_vector(above, angle)), "completed")
	var dest = obj.translation+Vector3(0.0,grabbed_height,0.0)
	yield(move("r", Globals.max_r), "completed")
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
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
	if grabbed and obj == grabbed:
		return yield(get_tree(), "idle_frame")
	elif grabbed:
		return Heda.error("Robot can't grab. It is already grabbing.")
	print("Grabing")
	if obj.grab_above:
		yield(_grab_above(obj),"completed")
	else:
		yield(_grab_in_front(obj),"completed")
	grabbed = obj
	emit_signal("grabbed_changed")
	Lib.parent_adopt_child(hand, obj)

func _put_down_above(position):
	var angle = Lib.best_angle_for_vect(position)
	var dest = position+Vector3(0.0,grabbed_height,0.0)
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
	yield(move("r", Globals.max_r), "completed")

func _put_down_in_front(_shelf, position):
	if grabbed_above:
		return Heda.error("Robot can't put down in front. The object was grabbed above.")
	var angle = 180.0 if position.z < Globals.max_z else 0.0
	var dest = position+Vector3(0.0,grabbed_height,0.0)
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
	yield(move("r", Globals.max_r), "completed")

func put_down(shelf, position):
	if position == null:
		return Heda.error("Robot can't put down. Invalid position null.")
	if !grabbed:
		return Heda.error("Robot can't put down. It is not holding any object.")
	print("Put down " + str(position))
	if shelf.grab_above:
		yield(_put_down_above(position),"completed")
	else:
		yield(_put_down_in_front(shelf, position),"completed")
		
	Lib.parent_adopt_child(shelf, grabbed)
	grabbed = null
	emit_signal("grabbed_changed")

func weigh(obj):
	obj.weight = randf()*1000.0
	print("Weight: "+str(obj.weight)+"g")

func store(obj):
	for shelf in Heda.cupboard.shelves:
		if shelf.preferred_jar_format == obj.format.name:
			var pos = shelf.get_free_positition(obj)
			yield(grab(obj),"completed")
			yield(put_down(shelf, pos),"completed")
			emit_signal("jar_stored")
			print("Store")
			return
	yield(get_tree(),"idle_frame")

func test_limits():
	for motor in motors:
		motor.position = motor.min_position
		motor.destination = motor.min_position
		yield(get_tree().create_timer(4.0), "timeout")
		motor.position = motor.max_position
		motor.destination = motor.max_position
		yield(get_tree().create_timer(4.0), "timeout")
