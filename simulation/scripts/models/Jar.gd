extends Model

class_name Jar

var jar_id : int
var ingredients := []
var format : JarFormat

var pos_x := 0.0
var pos_y := 0.0
var pos_z := 0.0

var container_format_id : int

var nodes := []

func get_name():
	return "Jar - %d" % jar_id

func get_main_instance():
	if nodes.size() != 1:
		return null
	return nodes[0]

static func get_table():
	return Tables.JARS
func get_class():
	return "Jar"
static func all():
	return get_table().all()
static func find_by_jar_id(_jar_id):
	for jar in all():
		if jar.jar_id == _jar_id:
			return jar
	return null
static func first_with_no_position_and_format(_format):
	for jar in all():
		if jar.format == _format and (jar.pos_x == 0.0 or jar.pos_x == null):
			return jar
	return null

func get_shelf():
	for shelf in Heda.get_node(Heda.CUPBOARD).shelves:
		var x_ok = pos_x >= shelf.get_min_x() and pos_x <= shelf.get_max_x()
		var y_ok = abs(pos_y - shelf.get_height()) < 200
		var z_ok = pos_z >= shelf.get_min_z() and pos_z <= shelf.get_max_z()
		if x_ok and y_ok and z_ok:
			return shelf
	assert(false)

func connect_node(node):
	nodes.push_back(node)
	var _a = self.connect("saved", node, "on_record_saved")

func deconnect_node(node):
	nodes.erase(node)

func set_position(position : Vector3):
	pos_x = position.x; pos_y = position.y; pos_z = position.z

func get_position():
	return Vector3(pos_x, pos_y, pos_z)

func empty_ingredients():
	ingredients.clear()

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
		"pos_x" : pos_x,
		"pos_y" : pos_y,
		"pos_z" : pos_z,
		"jar_id" : jar_id,
		"container_format_id" : container_format_id,
		"ingredients" : ings
	}
	return save_dict

func load_data(data):
	
	print(data)
	for i in data.keys():
		if i == "created_at" or i == "updated_at":
			continue
		elif i == "container_format_id":
			for _format in Heda.get_jar_formats():
				if _format.format_id == data["container_format_id"]:
					self.format = _format; break
		elif i == "ingredients":
			for ing in data[i]:
				add_ingredient(Ingredient.new(ing["weight"], Food.find(ing["food_id"])))
		else:
			self.set(i, data[i])

	return self
