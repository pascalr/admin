extends Node

class Command:
	var function = ""
	var args = []

func parse_command(raw: String):
	var command = Command.new()
	var i = raw.find(" ")
	command.function = raw.substr(0, i)
	var raw_args = "" if i == -1 else raw.substr(i+1)
	var args = raw_args.split(",")
	for arg in args:
		command.args.push_back(arg.strip_edges())
	print(command)
	return command

func execute_command(raw_command: String):
	var cmd = parse_command(raw_command)
	if raw_command == "exit" || raw_command == "quit":
		get_tree().quit()
	elif cmd.function == "move":
		Body.move(cmd.args)
	elif cmd.begins_with("m"):
		get_node("/root/Spatial/hand").translation.y = float(cmd.substr(1))
		print("Moving!")
