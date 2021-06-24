extends Spatial

#export var(PolarCoord) destination

var position = PolarCoord.new(0.0, 1000.0, 0.0, 0.0, 0.0, 0.0)
var destination = PolarCoord.new().copy(position)

export var speed := 200.0

func _ready():
	_update_mesh()

func _update_mesh():
	get_node("SupportTransversale").translation.y = self.position.y

func _process(delta):
	for i in len(position.values()):
		var pos = position.values()[i]
		var dest = destination.values()[i]
		if dest > pos:
			position.set_value(i, min(pos+delta*speed, dest))
		elif dest < pos:
			position.set_value(i, max(pos-delta*speed, dest))
	_update_mesh()
