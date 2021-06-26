extends Spatial

#export var(PolarCoord) destination

var position = PolarCoord.new(0.0, 1000.0, 0.0, 0.0, 0.0, 0.0)
var destination = PolarCoord.new().copy(position)
var start_offset : PolarCoord
var h0
var y0

export var speed := 200.0

func _ready():
	y0 = get_node("SupportTransversale").translation.y
	h0 = get_node("SupportTransversale/Trolley").translation.x
	_update_mesh()

func _update_mesh():
	get_node("SupportTransversale").translation.y = self.position.y + y0
	get_node("SupportTransversale/Trolley").translation.x = self.position.h + h0

func _process(delta):
	for i in len(position.values()):
		var pos = position.values()[i]
		var dest = destination.values()[i]
		if dest == null:
			pass
		elif dest > pos:
			position.set_value(i, min(pos+delta*speed, dest))
		elif dest < pos:
			position.set_value(i, max(pos-delta*speed, dest))
	_update_mesh()
