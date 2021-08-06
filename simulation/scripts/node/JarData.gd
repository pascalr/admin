extends Node

class_name JarData

signal data_changed

var jar_id : int
var ingredients := []
var format : JarFormat

var pos_x := 0.0
var pos_y := 0.0
var pos_z := 0.0

var nodes := []

func get_class():
	return "JarData"

func connect_node(node):
	nodes.push_back(node)
	var _a = self.connect("data_changed", node, "on_data_changed")
	Datastore.emit_signal("jar_data_list_updated")

func deconnect_node(node):
	nodes.erase(node)
	Datastore.emit_signal("jar_data_list_updated")

func set_position(position : Vector3):
	pos_x = position.x; pos_y = position.y; pos_z = position.z

func get_position():
	return Vector3(pos_x, pos_y, pos_z)

func empty_ingredients():
	ingredients.clear()
	emit_signal("data_changed", self)

# The height of the jar when empty, or the height with the lid when present
func get_height():
	return format.height_with_lid

func get_diameter():
	return format.diameter

func content_volume():
	var volume := 0.0
	for ing in ingredients:
		volume += ing.volume()
	return volume

# 0 is empty, 1 is full
func ratio_filled():
	return content_volume()/format.volume

func get_weight():
	var weight := 0.0
	for ing in ingredients:
		weight += ing.weight
	return weight

func add_ingredient(ing):
	ingredients.push_back(ing)
	emit_signal("data_changed", self)

func foods_info():
	var info = ""
	for i in range(0, ingredients.size()):
		info += ingredients[i].food.name
		if i < ingredients.size()-1:
			info += ", "
	return info

func main_ingredient():
	if ingredients.size() == 1:
		return ingredients[0]
	return null

func clear():
	ingredients.clear()

func to_dict():
	var ings = []
	for ing in ingredients:
		ings.push_back(ing.to_dict())

	var save_dict = {
		"class" : get_class(),
		"pos_x" : pos_x,
		"pos_y" : pos_y,
		"pos_z" : pos_z,
		"jar_id" : jar_id,
		"ingredients" : ings
	}
	if format:
		save_dict["jar_format"] = format.name
	return save_dict

func load_data(data):
	
	for i in data.keys():
		if i == "created_at" or i == "updated_at":
			continue
		elif i == "container_format_id":
			for _format in Heda.get_node(Heda.JAR_FORMATS).get_children():
				if _format.format_id == data["container_format_id"]:
					self.format = _format; break
		elif i == "ingredients":
			for ing in data[i]:
				add_ingredient(Ingredient.new(ing["weight"], Heda.get_node(Heda.FOODS+"/"+ing["food"])))
		else:
			self.set(i, data[i])

	return self
