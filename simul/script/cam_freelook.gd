extends ClippedCamera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#
export(float, 0.0, 1.0) var sensitivity = 0.25
#
#var has_focus = true
#
# Mouse state
var _mouse_position = Vector2(0.0, 0.0)
var _total_pitch = 0.0
#
## Movement state
var _direction = Vector3(0.0, 0.0, 0.0)
#var _velocity = Vector3(0.0, 0.0, 0.0)
#var _acceleration = 30
#var _deceleration = -10
#var _vel_multiplier = 500
#
## Keyboard state
var _shift_pressed = false

# Shift + Middle mouse button
var _moving_mode = false
var _move_start_position = Vector3(0.0, 0.0, 0.0)

func _input(event):
#	if get_node(Heda.COMMAND_LINE).has_focus() or !current:
#		return
	# Receives mouse motion
	if event is InputEventMouseMotion:
		_mouse_position = event.relative
#
	# Receives mouse button input
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_MIDDLE:
				_moving_mode = _shift_pressed
				if _moving_mode:
					_move_start_position = transform.origin
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if event.pressed else Input.MOUSE_MODE_VISIBLE)
			BUTTON_WHEEL_UP:
				translate(Vector3(0, 0, -20))
			BUTTON_WHEEL_DOWN:
				translate(Vector3(0, 0, 20))
#
#	# Receives key input
	if event is InputEventKey:
		match event.scancode:
			KEY_SHIFT:
				_shift_pressed = event.pressed

#
## Updates camera movement
#func _update_movement(delta):
#	# Computes desired direction from key states
#	_direction = Vector3(_d as float - _a as float, 
#						 _e as float - _q as float,
#						 _s as float - _w as float)
#
#	# Computes the change in velocity due to desired direction and "drag"
#	# The "drag" is a constant acceleration on the camera to bring it's velocity to 0
#	var offset = _direction.normalized() * _acceleration * _vel_multiplier * delta \
#		+ _velocity.normalized() * _deceleration * _vel_multiplier * delta
#
#	# Checks if we should bother translating the camera
#	if _direction == Vector3.ZERO and offset.length_squared() > _velocity.length_squared():
#		# Sets the velocity to 0 to prevent jittering due to imperfect deceleration
#		_velocity = Vector3.ZERO
#	else:
#		# Clamps speed to stay within maximum value (_vel_multiplier)
#		_velocity.x = clamp(_velocity.x + offset.x, -_vel_multiplier, _vel_multiplier)
#		_velocity.y = clamp(_velocity.y + offset.y, -_vel_multiplier, _vel_multiplier)
#		_velocity.z = clamp(_velocity.z + offset.z, -_vel_multiplier, _vel_multiplier)
#
#		translate(_velocity * delta)
#
func _process(delta):
	# Only rotates mouse if the mouse is captured
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if _moving_mode:
			translate(Vector3(-_mouse_position.x, _mouse_position.y, 0))
			_mouse_position = Vector3(0.0, 0.0, 0.0)
			#transform.origin = _move_start_position + _direction * 100

			#self.position = Vector3(_mouse_position.x * 10, _mouse_position.y * 10, 0)
			#translate(Vector3(_mouse_position.x * 10, _mouse_position.y * 10, 0))
		else:
			_mouse_position *= sensitivity
			var yaw = _mouse_position.x
			var pitch = _mouse_position.y
			_mouse_position = Vector2(0, 0)

			# Prevents looking up/down too far
			pitch = clamp(pitch, -90 - _total_pitch, 90 - _total_pitch)
			_total_pitch += pitch

			rotate_y(deg2rad(-yaw))
			rotate_object_local(Vector3(1,0,0), deg2rad(-pitch))
#
#func get_object_under_mouse():
#	var mouse_pos = get_viewport().get_mouse_position()
#	var ray_from = self.project_ray_origin(mouse_pos)
#	var RAY_LENGTH=20000
#	var ray_to = ray_from + self.project_ray_normal(mouse_pos) * RAY_LENGTH
#	var space_state = get_world().direct_space_state
#	var selection = space_state.intersect_ray(ray_from, ray_to, [], 2147483647, true, true)
#	if(selection.size()!=0):
#		print(selection)
#	return selection
