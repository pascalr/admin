extends Node

func move(args):
	var axis = Lib.extract_arg(args, 0, "string")
	var destination = Lib.extract_arg(args, 1, "float")
	print("Moving " + str(axis) + " to " + str(destination))
