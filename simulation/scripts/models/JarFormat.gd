extends Model

class_name JarFormat

# NOTE: ALSO MODIFY THE COPY FUNCTION!!!
export var format_id : int
export var diameter : float
export var height_with_lid : float
export var lid_height : float
export var max_content_height : float
export var body_weight : float
export var lid_weight : float
export var volume : float

# NOTE: ALSO MODIFY THE COPY FUNCTION!!!
export(Mesh) var jar_obj
export(Mesh) var lid_obj

func copy(format):
	self.format_id = format.format_id
	self.diameter = format.diameter
	self.height_with_lid = format.height_with_lid
	self.lid_height = format.lid_height
	self.max_content_height = format.max_content_height
	self.body_weight = format.body_weight
	self.lid_weight = format.lid_weight
	self.volume = format.volume
	self.jar_obj = format.jar_obj
	self.lid_obj = format.lid_obj
