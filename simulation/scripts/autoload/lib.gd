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

#func calc_x(t,a):
	#var x = 
	
