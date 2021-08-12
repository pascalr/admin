extends Node

var id := -1

# /machines/1/jars.json
# /machines/1/jar/10.json
# ...

class_name Model

func save():
	Cache.save(self)
