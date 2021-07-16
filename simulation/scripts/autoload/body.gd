extends Node

# The body executes command of the form:
# move y,1000

func _extract_arg(args: Array, i: int, type: String):
	var trace = "In function "+get_stack()[1].function+", "
	if i >= args.size():
		print(trace + "missing arg "+str(i))
	elif type == "string":
		return args[i]
	elif type == "int" && args[i].is_valid_integer():
		return int(args[i])
	elif type == "float" && args[i].is_valid_float():
		return float(args[i])
	else:
		print(trace + "invalid type "+type)
	return null

func move(args):
	var axis = _extract_arg(args, 0, "string")
	var destination = _extract_arg(args, 1, "float")
	print("Moving " + axis + " to " + str(destination))
	Controller.send("m"+axis+str(destination))
