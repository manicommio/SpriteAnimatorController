extends CharacterBody2D


@onready var weapon = $weapon
@onready var proyector = $proyector
@onready var collision_shape = $CollisionShape2D
@onready var state_machine = $StateMachine
#______________________________________________
@export var health = 100.0
@export var current_health = 100.0
#______________________________________________
var crouch_speed := 128
var walk_speed := 160
var run_speed := 286
var sprinting_speed := 364
var acceleration := 10.0
var mass_velocity := 0.0
var SPEED := 300.0
#_______________________________
var gravity_force := 64.0
var gravity_speed := 0.0
var jump_velocity := 0.0
var landing_velocity := 0.0
#_______________________________
var is_sprinting := false
var is_crouch := false
var is_grounded := false
var direction :Vector2
var bullet_efect := Vector2.ZERO
var state = ""
#______________________________________
var camera : Node2D = null
var world :Node2D = null
var terrain :Node2D = null
var Ysort :Node2D = null

#@onready var joystick = get_node("CanvasLayer/main_joystick")
var joystick : Control = null
var joystick_direction := Vector2()
var joystick_sensitive := 1.0


func _ready() ->void:
	GameManager.player2d = self
	var mCam = get_tree().get_nodes_in_group("camera")
	if mCam.size()>0:
		camera = mCam[0] 
	var miYsort = get_tree().get_nodes_in_group("Ysort")
	if miYsort.size()>0:
		Ysort = miYsort[0]
	var miMundo = get_tree().get_nodes_in_group("world")
	if miMundo.size()>0:
		world = miMundo[0]
	var miTerreno = get_tree().get_nodes_in_group("map_position")
	if miTerreno.size()>0:
		terrain = miTerreno[0]
	
	self.remove_child(proyector)
	Ysort.add_child(proyector)
	proyector.father = self
	
	
func _physics_process(delta:float) ->void:
	SimulateJump(delta)
	bullet_efect = lerp(bullet_efect, Vector2.ZERO, 3 * delta)

	if direction or bullet_efect:
		var new_direction = Vector2(direction.x + bullet_efect.x, direction.y + bullet_efect.y)
		velocity.x = lerp(velocity.x, new_direction.x * SPEED, acceleration * delta)
		velocity.y = lerp(velocity.y, new_direction.y * SPEED, acceleration * delta)
	else:
		if mass_velocity > (SPEED * 10.0) / 100.0:
			velocity = lerp(velocity,  Vector2.ZERO, acceleration * delta)
		else:
			velocity = Vector2.ZERO
	
	move_and_slide()
	mass_velocity = velocity.length()
	
	
func _process(delta:float) ->void:
	
	if state_machine .current_state != null:
		state = state_machine .current_state.get_name()
	# SPRINTING _____________________________________-
	if is_sprinting:
		if state == "shoot_standing" or state == "jumping":
			SPEED = run_speed
		else:
			SPEED = sprinting_speed
			
	else:
		if is_crouch:
			SPEED = crouch_speed
		else:
			SPEED = walk_speed

	# LIMIT ROTATION _____________________________
	if abs(self.rotation) > deg_to_rad(360):
		self.rotation = 0
	#_______________________________________________
	proyector.Update(delta)


func Jump(_force:float) ->void:
	proyector.lift_position -= 1
	jump_velocity = _force
	gravity_speed = 0.0
	is_grounded = false


func SimulateJump(delta) ->void:
	#_____________________________________
	if not is_grounded:
		gravity_speed += gravity_force * delta
		jump_velocity -= gravity_speed * delta
		proyector.lift_position -= jump_velocity
		#______________________________________________________
		if proyector.lift.position.y > proyector.lift_position:
			proyector.lift.position.y = proyector.lift_position
			proyector.state_lift = "UP"
			
		elif proyector.lift.position.y < proyector.lift_position:
			proyector.lift.position.y = proyector.lift_position
			proyector.state_lift = "DOWN"

		if proyector.state_lift == "DOWN":
			if proyector.lift_position > proyector.ground_position:
				proyector.lift_position = proyector.ground_position
				proyector.lift.position.y = proyector.lift_position
				proyector.state_lift = "GROUND"
				is_grounded = true

		if landing_velocity > jump_velocity:
			landing_velocity = jump_velocity
		
	else:
		landing_velocity = 0.0
		gravity_speed = 0.0

		if proyector.lift_position < proyector.ground_position:
			is_grounded = false
		else:
			proyector.lift_position = proyector.ground_position
			proyector.lift.position.y = proyector.lift_position
			proyector.state_lift = "GROUND"


func _on_get_value_joystick(_direction:Vector2,_sensitive:float) ->void:
	joystick_direction = _direction
	joystick_sensitive = _sensitive
