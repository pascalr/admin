extends Node

# The body executes command of the form:
# move y,1000

func move(args):
	var axis = Lib.extract_arg(args, 0, "string")
	var destination = Lib.extract_arg(args, 1, "float")
	print("Moving " + axis + " to " + str(destination))
	Controller.send("m"+axis+str(destination))
