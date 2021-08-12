extends Node

class Parent:
	static func get_name():
		return "Parent"
	static func print_name():
		print(get_name())

class Child extends Parent:
	static func get_name():
		return "Child"

static func testing():
	pass

func _ready():
	pass
#	testing()
	print("***************** START TEST ******************")
	Child.print_name()
#	print("Waiting for cache to be loaded")
#	yield(Cache, "loaded")
#	print("Cache loaded")
#	var food := Food.new()
#	food.name = "farine"
#	food.save()
#	print("id: "+str(food.id))
#	print(Food.all())
#	print(Jar.all())
	print("***************** END TEST ******************")
