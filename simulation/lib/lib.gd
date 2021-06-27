extends Node

func extract_arg(args: Array, i: int, type: String):
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
