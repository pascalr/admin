extends Node

#const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
#var db
#
#var db_name := "res://data/test"
#
#func _ready():
#
#	var table_name = "foods"
#
#	db = SQLite.new()
#	db.path = db_name
#	db.verbose_mode = true
#	db.open_db()
#
#	# Select the id and age of the employees that are older than 30
#	var selected_array : Array = db.select_rows(table_name, "", ["id", "name"])
#	print("++++++++++++++++++++++++++++++++++++++++++++++++")
#	print(selected_array)
#
#	db.close_db()
