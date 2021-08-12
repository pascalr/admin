extends Node

# /machines/1/jars.json
# /machines/1/jar/10.json
# ...

class_name Model

static func get_model_name():
	assert(false)

static func all():
	if Cache.get_list(get_model_name()):
		pass
	return [1,2,3]
