extends Spatial

var motors := []

func _ready():
	motors = [get_node("SupportTransversale"),
			  get_node("SupportTransversale/Trolley"),
			  get_node("SupportTransversale/Trolley/Humerus"),
			  get_node("SupportTransversale/Trolley/Humerus/Wrist"),
			  get_node("SupportTransversale/Trolley/Humerus/Wrist/Hand"),
			  get_node("SupportTransversale/Trolley/Humerus/Wrist/Hand/GripL"),
			  get_node("SupportTransversale/Trolley/Humerus/Wrist/Hand/GripR")]

# y10.0x20a90.0
func set_destination(s):
	var regex = RegEx.new()
	regex.compile("[a-zA-Z]\\-?\\d+")
	for result in regex.search_all(s):
		var r = result.get_string()
		var id = r[0]
		for motor in motors:
			if motor.id == id:
				motor.destination = float(r.substr(1))
	return self

#export var(PolarCoord) destination

#var motor_y := Motor.new("Y")
#var motor_h := Motor.new("H")

#var position = PolarCoord.new(0.0, 1000.0, 0.0, 0.0, 0.0, 0.0)
#var destination = PolarCoord.new().copy(position)
#var h0
#var y0

#export var speed := 200.0

#func _ready():
	#y0 = get_node("SupportTransversale").translation.y
	#h0 = get_node("SupportTransversale/Trolley").translation.x
	#_update_mesh()

#func _update_mesh():
	#get_node("SupportTransversale").translation.y = y0 + self.position.y
	#get_node("SupportTransversale/Trolley").translation.x = h0 - self.position.h

#func _update_position(delta : float):
	#for i in len(position.values()):
		#var pos = position.values()[i]
		#var dest = destination.values()[i]
		#if dest == null:
			#pass
		#elif dest > pos:
			#position.set_value(i, min(pos+delta*speed, dest))
		#elif dest < pos:
			#position.set_value(i, max(pos-delta*speed, dest))
	#_update_mesh()


#func _process(delta):
#	_update_position(delta)
