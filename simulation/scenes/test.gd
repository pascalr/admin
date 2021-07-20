extends Spatial

signal did_something


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func do_something():
	var i = 0
	while i < 10:
		i += 1
		print("frame")
		yield(get_tree(), "idle_frame")
	emit_signal("did_something")

func nested():
	var i = 0
	while i < 10:
		i += 1
		print("frame")
		yield(get_tree(), "idle_frame")

func blah():
	yield(get_tree(), "idle_frame")
	return 10

# Called when the node enters the scene tree for the first time.
func _ready():
	print("before")
	print(blah())
	#yield(self, "did_something")
	print("after")
	
	#var peer = NetworkedMultiplayerENet.new()
	#peer.create_client("localhost", 9999)
	#get_tree().network_peer = peer
	#rpc("greet")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
