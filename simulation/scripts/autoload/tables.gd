extends Node

class Table:
	
	var name : String
	
	signal modified
	
	func _init(_name):
		name = _name
	
	func all():
		return Cache.list(self)
	
	func find(id):
		return Cache.find(self, id)

var JARS := Table.new("jars")
var FOODS := Table.new("foods")
var WEIGHINGS := Table.new("weighings")

var ALL := [JARS, FOODS, WEIGHINGS]
