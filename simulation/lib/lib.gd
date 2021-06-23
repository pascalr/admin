extends Node

static func map(function: FuncRef, i_array: Array)->Array:
	var o_array := []
	for value in i_array:
		o_array.append(function.call_func(value))
	return o_array

func extract_arg(args: Array, i: int, type: String):
	var trace = "In function "+get_stack()[1].function+", "
	if i >= args.size():
		print(trace + "missing arg "+str(i))
	elif type == "string":
		return args[i]
	elif type == "float":
		if str(float(args[i])) != args[i] and str(int(args[i])) != args[i]:
			print(trace + "expected float for arg "+str(i)+", but was "+args[i])
		else:
			return float(args[i])
	else:
		print(trace + "invalid type "+type)
	return null
