extends Camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var velocity = Vector3(0,0,0)
#var speed = 800.0
#var mouse_sensitivity = 0.3

 #var changev=-event.relative.y*mouse_sens
		#if camera_anglev+changev>-50 and camera_anglev+changev<50:
		#	camera_anglev+=changev
		#	$Camera.rotate_x(deg2rad(changev))

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.

#func _input(event):
   # Mouse in viewport coordinates.
   #if event is InputEventMouseButton:
	#   print("Mouse Click/Unclick at: ", event.position)
 #  if Input.is_mouse_button_pressed(BUTTON_LEFT) and event is InputEventMouseMotion:
	#   self.rotate_y(deg2rad(-event.relative.x*mouse_sensitivity))
	   #print("Mouse Motion at: ", event.position)
	   #print("Mouse relative: ", event.relative)

   # Print the size of the viewport.
   #print("Viewport Resolution is: ", get_viewport().size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if Input.is_action_pressed("ui_right"):
#		self.translation.x -= speed * delta
#	elif Input.is_action_pressed("ui_left"):
#		self.translation.x += speed * delta
#	elif Input.is_action_pressed("ui_up"):
#		self.translation.y += speed * delta
#	elif Input.is_action_pressed("ui_down"):
#		self.translation.y -= speed * delta
#		
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		print("Button left")
