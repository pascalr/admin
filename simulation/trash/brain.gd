extends Node

# The brain interacts between the user and Heda.

func parse_command(raw: String):
	var i = raw.find(" ")
	var cmd = raw.substr(0, i)
	var raw_args = "" if i == -1 else raw.substr(i+1)
	var args = Lib.filter_blank(Lib.strip_edges(raw_args.split(",")))
	return [cmd, args]

func execute_command(raw_command: String):
	var parsed = parse_command(raw_command)
	var cmd = parsed[0]
	var args = parsed[1]
	if cmd == "exit" || cmd == "quit":
		get_tree().quit()
	elif cmd == "move":
		Body.move(args)
	elif cmd == "goto":
		Body.goto(args)
