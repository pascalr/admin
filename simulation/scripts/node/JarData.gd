extends Node

class_name JarData

signal content_updated

var jar_id : int
var ingredients := []
var format : JarFormat
var position : Vector3

func get_class():
	return "JarData"

func empty_ingredients():
	ingredients.clear()
	emit_signal("content_updated", self)

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
	emit_signal("content_updated", self)

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
		"pos_x" : position.x,
		"pos_y" : position.y,
		"pos_z" : position.z,
		"jar_id" : jar_id,
		"ingredients" : ings
	}
	if format:
		save_dict["jar_format"] = format.name
	return save_dict

func load_data(data):
	self.position = Vector3(data["pos_x"],data["pos_y"],data["pos_z"])

	for i in data.keys():
		if i == "pos_x" or i == "pos_y" or i == "pos_z" or i == "jar_format":
			continue
		elif i == "jar_format":
			self.format = Heda.get_node(Heda.CONFIG).get_node("JarFormats/"+data["jar_format"])
		elif i == "ingredients":
			for ing in data[i]:
				add_ingredient(Ingredient.new(ing["weight"], Heda.get_node(Heda.FOODS+"/"+ing["food"])))
		else:
			self.set(i, data[i])

	return self
