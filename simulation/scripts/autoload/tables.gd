extends Node

class Table:
	
	var name : String
	var klass
	
	signal modified
	
	func _init(_name, _klass):
		name = _name; klass = _klass
	
	func all():
		return Cache.list(self)
	
	func find(id):
		return Cache.find(self, id)
	
	func first():
		return Cache.first(self)

var JARS := Table.new("jars", Jar)
var FOODS := Table.new("foods", Food)
var WEIGHINGS := Table.new("weighings", Weighing)
var MACHINE_FOODS := Table.new("machine_foods", MachineFood)

# Warning: Order is important. Dependant tables must be last.
var ALL := [FOODS, JARS, MACHINE_FOODS, WEIGHINGS]
