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

var grabbed
var grabbed_instance
var grabbed_above : bool
var grabbed_height : float

func _ready():
	assert(abs(self.translation.z - Globals.trolley_z) < 0.01)
	assert(abs(wrist.translation.z - Globals.humerus_length) < 0.01)
	assert(abs(hand.translation.z + Globals.forearm_grip_length) < 0.01)
	
	assert(abs(support.translation.y - support.position) < 0.01)
	assert(abs(trolley.translation.x - trolley.position) < 0.01)
	assert(abs(humerus.rotation.y - humerus.position) < 0.01)
	assert(abs(wrist.rotation.y - wrist.position) < 0.01)
	assert(abs(hand.rotation.z - hand.position) < 0.01)
	
	# Test reach is enough for far corners
	var dr = 114/2.0 # The jar radius
	var farthest = Globals.trolley_z - dr
	var x1 = trolley.min_position-dr
	var min_reach_1 = sqrt(pow(x1,2)+pow(farthest,2))
	var x2 = Globals.max_x-trolley.max_position-dr
	var min_reach_2 = sqrt(pow(x2,2)+pow(farthest,2))
	var min_reach = max(min_reach_1, min_reach_2)
	var reach = Globals.reach()
	assert(reach > min_reach)

func get_motor(id : String):
	for motor in motors:
		if motor.id == id:
			return motor

#func _physics_process(_delta):
#	for motor in motors:
#		var col = motor.get_body().move_and_collide(Vector3(0.0,0.0,0.0))
#		if col != null:
#			get_node(Heda.COLLISION_SIGN).visible = true
#			return
#	get_node(Heda.COLLISION_SIGN).visible = false
#
#func _wait_done_moving():
#	pass

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

func rotate(t, a):
	yield($Controller.exec("mt%.2fa%.2f"%[t,a]), "completed")

func move(axis, destination):
	yield($Controller.exec("m"+axis+str(destination)), "completed")

func _move_at(polar):
	if abs(polar.a) > 60.0:
		print("Careful: Forearm could collide. Moving humerus first.")
		yield(move("t", polar.t), "completed")
		yield(move("a", polar.a), "completed")
	else:
		yield(move("a", polar.a), "completed")
		yield(move("t", polar.t), "completed")

func get_to(polar):
	print("Getting to "+str(polar)+" coord == "+(str(UserCoord.new().set_from_polar(polar))))
	yield(move("y", polar.y), "completed")
	yield(move("b", polar.b), "completed")
	
	# Check if moving h first is safer or more risky for collisions
	if abs(polar.h-trolley.middle_position()) > abs(polar.h-trolley.position):
		_move_at(polar)
		yield(move("h", polar.h), "completed")
	else:
		yield(move("h", polar.h), "completed")
		_move_at(polar)
	
	#yield(rotate(polar.t, polar.a), "completed")
	if abs(polar.a) > 60.0:
		print("Careful: Forearm could collide. Moving humerus first.")
		yield(move("t", polar.t), "completed")
		yield(move("a", polar.a), "completed")
	else:
		yield(move("a", polar.a), "completed")
		yield(move("t", polar.t), "completed")

func goto(user_coord):
	print("Goto "+str(user_coord))
	var working_shelf = get_node(Heda.CUPBOARD).working_shelf
	var currently_above = support.position > working_shelf.get_height()
	var going_above = user_coord.y > working_shelf.get_height()
	if currently_above != going_above:
		var h = trolley.middle_position()
		var safe = PolarCoord.new().set_from_units(h,support.position,90.0,0.0)
		yield(get_to(safe), "completed")
		yield(move("y", user_coord.y), "completed")
	var polar = PolarCoord.new().set_from_user_coord(user_coord)
	yield(get_to(polar), "completed")

func _move_straigth(vect):
	var user_coord = UserCoord.new().set_from_vector(vect, get_angle())
	var polar = PolarCoord.new().set_from_user_coord(user_coord)
	yield($Controller.exec("t"+str(polar.t)), "completed")

func _grab_under_shelf(obj):
	print("Grab under shelf")
	grabbed_height = obj.get_height()-Globals.grab_above_grip_length
	var angle = 180.0 if obj.get_position().z < Globals.max_z/2.0 else 0.0
	var above_height = obj.get_height()+Globals.jar_clearance
	var dest = obj.get_position()+Vector3(0.0,above_height,0.0)
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
	dest.y = obj.get_position().y+grabbed_height
	yield(move("r", Globals.max_r), "completed")
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
	yield(move("r", obj.get_diameter()), "completed")
	var safe_y = obj.get_position().y+Globals.safe_height+grabbed_height
	var in_front = obj.get_position()
	_grabbing(obj)
	grabbed_above = true
	in_front.y += grabbed_height
	in_front.z = Globals.trolley_z - Globals.forearm_grip_length#obj.get_diameter()/2.0
	yield(_move_straigth(in_front), "completed")
	yield(move("y", safe_y), "completed")

func _grab_above(obj):
	grabbed_height = Globals.grab_height_above(obj)
	var angle = Lib.best_angle_for_vect(obj.get_position())
	var above = obj.get_position()+Vector3(0.0,obj.get_height()+10.0,0.0)
	yield(goto(UserCoord.new().set_from_vector(above, angle)), "completed")
	var dest = obj.get_position()+Vector3(0.0,grabbed_height,0.0)
	yield(move("r", Globals.max_r), "completed")
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
	yield(move("r", obj.get_diameter()), "completed")
	grabbed_above = true
	var safe_y = obj.get_position().y+Globals.safe_height+grabbed_height
	_grabbing(obj)
	# When grabbing above, move up enough to clear the other jars
	yield(move("y", safe_y), "completed")

func _grab_in_front(obj):
	grabbed_height = Globals.grab_height_in_front(obj)
	var angle = 180.0 if obj.get_position().z < Globals.max_z else 0.0
	var in_front = obj.get_position()
	# FIXME: TODO in_front.x 
	in_front.y += grabbed_height
	in_front.z += obj.get_diameter()/2.0 * -cos(angle*PI/180.0)
	yield(goto(UserCoord.new().set_from_vector(in_front, angle)), "completed")
	var dest = obj.get_position()+Vector3(0.0,60.0,0.0)
	yield(move("r", Globals.max_r), "completed")
	yield(_move_straigth(dest), "completed")
	yield(move("r", obj.get_diameter()), "completed")
	grabbed_above = false
	var safe_y = obj.get_position().y+Globals.fence_safe_height+grabbed_height
	_grabbing(obj)
	yield(move("y", safe_y), "completed")
	yield(_move_straigth(in_front), "completed")

func _grabbing(obj):
	grabbed = obj
	grabbed_instance = obj.get_main_instance()
	Lib.parent_adopt_child(hand, grabbed_instance)
	emit_signal("grabbed_changed")

func _releasing():
	if grabbed: # FIXME: Yield executed twice
		Lib.parent_adopt_child(get_node(Heda.CUPBOARD).bodies, grabbed_instance)
		grabbed.set_position(grabbed_instance.translation)
		grabbed = null
		grabbed_instance = null
		emit_signal("grabbed_changed")

func change_grab_height(new_height):
	if not grabbed:
		return Heda.error("Robot can't change grab height, it is not grabbing.")
	var working_space = get_node(Heda.WORKING_SPACE)
	var dest = working_space.get_position()+Vector3(0.0,grabbed_height,0.0)
	var angle = Lib.best_angle_for_vect(working_space.get_position())
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
	yield(move("r", Globals.max_r), "completed")
	var obj = grabbed
	_releasing()
	yield(move("y", working_space.get_position().y+new_height), "completed")
	yield(move("r", obj.get_diameter()), "completed")
	_grabbing(obj)
	grabbed_height = new_height
	
func grab(obj):
	if obj == null:
		return Heda.error("Robot can't grab. Obj is null.")
	elif grabbed and obj == grabbed:
		return yield(get_tree(), "idle_frame")
	elif grabbed:
		return Heda.error("Robot can't grab. It is already grabbing.")
	print("Grabing")
	if obj.get_shelf().grab_above and obj.get_position().z < Globals.under_shelf:
		yield(_grab_under_shelf(obj),"completed")
	elif obj.get_shelf().grab_above:
		yield(_grab_above(obj),"completed")
	else:
		yield(_grab_in_front(obj),"completed")

func _put_down_above(position):
	if !grabbed_above:
		yield(change_grab_height(Globals.grab_height_above(grabbed)), "completed")
		#return Heda.error("Robot can't put down above. The object was grabbed in front.")
	var angle = Lib.best_angle_for_vect(position)
	var dest = position+Vector3(0.0,position.y+Globals.safe_height+grabbed_height,0.0)
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
	yield(move("y", position.y+grabbed_height), "completed")
	yield(move("r", Globals.max_r), "completed")
	_releasing()
	yield(move("y", position.y+Globals.safe_height), "completed")

func _put_down_under_shelf(shelf, position):
	print("Put down under shelf")
	if !grabbed_above:
		yield(change_grab_height(Globals.grab_height_above(grabbed)), "completed")
	var angle = 180.0 if position.z < Globals.max_z/2.0 else 0.0
	
	var in_front = position
	in_front.y = shelf.get_height() + Globals.safe_height + grabbed_height
	in_front.z = Globals.trolley_z - Globals.forearm_grip_length
	yield(goto(UserCoord.new().set_from_vector(in_front, angle)), "completed")
	yield(move("y", position.y+grabbed_height), "completed")
	
	var dest = position+Vector3(0.0,grabbed_height,0.0)
	yield(_move_straigth(dest), "completed")
	yield(move("r", Globals.max_r), "completed")
	_releasing()
	yield(move("y", position.y+Globals.safe_height), "completed")
#	grabbed_height = obj.get_height()-Globals.grab_above_grip_length
#	var angle = 180.0 if obj.translation.z < Globals.max_z/2.0 else 0.0
#	var above_height = obj.get_height()+Globals.jar_clearance
#	var dest = obj.translation+Vector3(0.0,above_height,0.0)
#	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
#	dest.y = obj.translation.y+grabbed_height
#	yield(move("r", Globals.max_r), "completed")
#	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
#	yield(move("r", obj.get_diameter()), "completed")
#	var safe_y = obj.translation.y+Globals.safe_height+grabbed_height
#	var in_front = obj.translation
#	_grabbing(obj)
#	grabbed_above = true
#	in_front.y += grabbed_height
#	in_front.z = Globals.trolley_z - Globals.forearm_grip_length#obj.get_diameter()/2.0
#	yield(_move_straigth(in_front), "completed")
#	yield(move("y", safe_y), "completed")

func _put_down_in_front(_shelf, position):
	if grabbed_above:
		yield(change_grab_height(Globals.grab_height_in_front(grabbed)), "completed")
		#return Heda.error("Robot can't put down in front. The object was grabbed above.")
	var angle = 180.0 if position.z < Globals.max_z else 0.0
	var dest = position+Vector3(0.0,grabbed_height,0.0)
	yield(goto(UserCoord.new().set_from_vector(dest, angle)), "completed")
	yield(move("r", Globals.max_r), "completed")
	_releasing()

func put_down(shelf, position):
	if position == null:
		return Heda.error("Robot can't put down. Invalid position null.")
	if grabbed == null:
		return Heda.error("Robot can't put down. It is not holding any object.")
	print("Put down " + str(position))
	if shelf.grab_above and position.z < Globals.under_shelf:
		yield(_put_down_under_shelf(shelf, position),"completed")
	elif shelf.grab_above:
		yield(_put_down_above(position),"completed")
	else:
		yield(_put_down_in_front(shelf, position),"completed")

func weigh(obj):
	assert(obj.ingredients.size() == 1)
	var food = obj.ingredients[0].food
	var full_weight = obj.format.volume * food.density
	var simulated = full_weight/2.0 + full_weight/2.0*randf()
	#var weight = simulated + Heda.jar_format.body_weight + Heda.jar_format.lid_weight
	obj.clear()
	var ing = Ingredient.new(simulated, food)
	obj.add_ingredient(ing)
	obj.emit_signal("data_changed")
	Weighing.add_to_datastore(ing)
	print("Weight: "+str(simulated)+"g")
	get_node(Heda.SELECTION_PANEL).show_details(obj)

func store(obj):
	if obj == null:
		return Heda.error("Robot can't store. Invalid obj null.")
	for shelf in get_node(Heda.CUPBOARD).shelves:
		if shelf.preferred_jar_format == obj.format.name:
			var pos = shelf.get_free_position(obj.format)
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
