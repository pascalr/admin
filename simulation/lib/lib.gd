extends Node

static func map(function: FuncRef, i_array: Array)->Array:
	var o_array := []
	for value in i_array:
		o_array.append(function.call_func(value))
	return o_array

func extract_arg(args: Array, i: int, type: String):
	var cmd = "TODO"
	if i >= args.size():
		print("Command "+cmd+": Missing arg "+str(i))
	elif type == "string":
		return args[i]
	elif type == "float":
		if str(float(args[i])) != args[i] and str(int(args[i])) != args[i]:
			print(str(float(args[i])))
			print(str(int(args[i])))
			print(args[i])
			print("Command "+cmd+": Arg "+str(i)+": "+args[i]+": Expected float, but was not.")
		else:
			return float(args[i])
	else:
		print("Command "+cmd+": Invalid type "+type)
	return null
