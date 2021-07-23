extends Node

func filter_blank(in_array: Array) -> Array:
	var out_array := []
	for e in in_array:
		if !e.empty():
			out_array.push_back(e.strip_edges())
	return out_array

func strip_edges(in_array: Array) -> Array:
	var out_array := []
	for e in in_array:
		out_array.push_back(e.strip_edges())
	return out_array

func inc(current, increment, maximum):
	if current < maximum:
		return min(current+increment, maximum)
	elif current > maximum:
		return max(current-increment, maximum)

func calc_x(t,a):
	var t_x = -sin(t*PI/180.0)*Globals.humerus_length
	var a_x = sin(a*PI/180.0)*Globals.forearm_grip_length
	return t_x + a_x

# reparent with transform
func parent_adopt_child(parent, child : Spatial):
	if child == null:
		return
	var t = child.global_transform
	child.get_parent().remove_child(child)
	parent.add_child(child)
	child.global_transform = t

func best_angle_for_vect(vect):
	#if vect.z < Globals.trolley_z-Globals.forearm_grip_length:
	#	return 180.0
	#elif vect.z > Globals.trolley_z-Globals.humerus_length+Globals.forearm_grip_length:
	#	return 0.0
	var l = Globals.humerus_length+Globals.forearm_grip_length
	var angle = asin((Globals.trolley_z-vect.z)/l)*180.0/PI
	return -90.0 - angle if vect.x > Globals.max_x/2.0 else 90 + angle

func is_valid_jar_position(jar, position):

	if position.x + jar.format.diameter/2.0 > Globals.max_x:
		#print("Add jar out of bounds max x!")
		return false
	elif position.x - jar.format.diameter/2.0 < Globals.min_x:
		#print("Add jar out of bounds min x!")
		return false
	elif position.z + jar.format.diameter/2.0 > Globals.max_z:
		#print("Add jar out of bounds max z!")
		return false
	elif position.z - jar.format.diameter/2.0 < Globals.min_z:
		#print("Add jar out of bounds min z!")
		return false
	
	for j in get_tree().get_nodes_in_group("jars"):
		if (position.y - j.translation.y) < 0.2:
			var min_dist = j.format.diameter/2.0 + jar.format.diameter/2.0 + Globals.min_dist_between_jars
			if ((position - j.translation).length() < min_dist):
				print("Collision!")
				return false
	
	return true
