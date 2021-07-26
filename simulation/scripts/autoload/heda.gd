extends Node

onready var core = get_node("/root/Simulation")
onready var robot = core.get_node("Robot")
onready var config = core.get_node("Config")
onready var cupboard = core.get_node("Cupboard")
onready var UI = core.get_node("UI")

onready var jar_format = config.get_node("JarFormats/Big")
onready var food = config.get_node("Foods/farine")

var current_action : int
var current_selection

func _ready():
	# Ugly fix to max sure everything is loaded.
	yield(get_tree().create_timer(0.2), "timeout")
	assert(abs(robot.translation.z - Globals.trolley_z) < 0.01)
	assert(abs(robot.support.translation.y - robot.support.position) < 0.01)
	assert(abs(robot.trolley.translation.x - robot.trolley.position) < 0.01)
	assert(abs(robot.wrist.translation.z - Globals.humerus_length) < 0.01)
	assert(abs(robot.hand.translation.z + Globals.forearm_grip_length) < 0.01)
	#assert(abs(robot.humerus.))
	var test = MeshInstance.new()
	var test_mesh = CylinderMesh.new()
	test_mesh.top_radius = 15.0
	test_mesh.bottom_radius = 15.0
	test_mesh.height = 50.0
	#content.translation.y = content_mesh.height/2.0+5.0
	var test_mat = SpatialMaterial.new()
	test_mat.albedo_color = Color8(255,0,0,255)
	test_mesh.material = test_mat
	test.set_mesh(test_mesh)
	test.translation.x = robot.trolley.translation.x
	test.translation.z = Globals.trolley_z - Globals.humerus_length + Globals.forearm_grip_length
	test.translation.y = robot.support.position + test_mesh.height/2.0
	core.add_child(test)

func error(msg):
	print("Error: "+str(msg))
	var window = UI.get_node("ErrorDialog")
	window.dialog_text = msg
	window.popup()
	yield(get_tree(), "idle_frame")
