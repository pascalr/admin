extends Node

class_name Interpreter

func run(raw):
	var split = Lib.strip_edges(raw.split(' ', true, 1))
	var cmd = split[0]
	var args = []
	if split.size() > 1:
		args = Lib.strip_edges(split[1].split(','))
	print("cmd: "+cmd)
	print("args: "+str(args))
	var robot = get_node("/root/Simulation/Robot")
	match cmd:
		"move":
			robot.move(args[0], float(args[1]))
		"quit":
			get_tree().quit()
