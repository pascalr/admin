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
