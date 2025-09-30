extends CharacterBody3D


@onready var ray_camera = $crouch/head/Camera3D/RayCamera
@onready var head = $crouch/head
#________________________
@export var walk_speed := 8.0
@export var run_speed := 20.0
@export var step_height :float = 0.6
#________________________
var SPEED = 10.0
const JUMP_VELOCITY = 10.0
var direction :Vector3
#________________________
var mouse_look_up := 60.0
var mouse_look_down := 60.0
var is_sprinting := false


func _ready() ->void:
	GameManager.player3d = self
	if !GameManager.MOBILE_PLATFORM:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	ray_camera.add_exception(self)


func _input(event) ->void:
	var mouse_sen :float = GameManager.joystick_sensitivity
		
	if !GameManager.MOBILE_PLATFORM:
		if event is InputEventMouseMotion:
			self.rotate_y(deg_to_rad(-event.relative.x * mouse_sen))
			head.rotate_x(deg_to_rad(-event.relative.y * mouse_sen))
			
			var camara_head = head.rotation_degrees
			camara_head.x = clamp(camara_head.x, -mouse_look_down, mouse_look_up)
			head.rotation_degrees = camara_head


func _physics_process(delta:float) ->void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 3 * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	ClimbStep()
	

func _process(_delta:float) ->void:
	# mouse capture ________________________________________
	if !GameManager.MOBILE_PLATFORM:
		if Input.is_action_just_pressed("ui_cancel"):
			if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# RUN____________________________________________________
	if is_on_floor():
		if Input.is_action_pressed("sprinting"):
			is_sprinting = true
		else:
			is_sprinting = false
		
	if is_sprinting:
		SPEED = run_speed
	else:
		SPEED = walk_speed


func ClimbStep() ->void:
	var collision_data = get_last_slide_collision()
	if collision_data:
		var collision_point = collision_data.get_position()
		if get_floor_normal() == Vector3.UP and is_on_floor():
			if collision_point.y > self.global_position.y + 0.05 and collision_point.y <= self.global_position.y + step_height:
				self.global_position.y += step_height
