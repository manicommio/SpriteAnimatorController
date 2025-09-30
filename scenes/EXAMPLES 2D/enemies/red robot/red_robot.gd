extends CharacterBody2D



@onready var proyector = $proyector
@onready var animator = $AnimatorController
@onready var collision_shape = $CollisionShape2D
@onready var state_machine = $StateMachine
#________________________________
@export var health = 500.0
@export var current_health = 500.0
var pain_healt := 500.0
#________________________________
var acceleration := 10.0
var mass_velocity := 0.0
var SPEED := 96.0
var nivel_colision := [1,0,0,0,0]

# to simulate jump______________
var gravity_force := 64.0
var gravity_speed := 0.0
var jump_velocity := 0.0
var landing_velocity := 0.0
var is_grounded := false
#_______________________________
var direction :Vector2
var bullet_efect := Vector2.ZERO
var move_dir := 0.0
var state = ""
#______________________________________
var camera : Node2D = null
var world :Node2D = null
var terrain :Node2D = null
var Ysort :Node2D = null
#________________________________________
var explosion_impact = preload("res://scenes/EXAMPLES 2D/enemies/red robot/explosion_impact.tscn")

func _ready() ->void:
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
		var new_direction :Vector2 = Vector2((direction.x * move_dir) + bullet_efect.x , (direction.y * move_dir) + bullet_efect.y)
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
	# LIMITAR ROTACION ____________________________
	if abs(self.rotation) > deg_to_rad(360):
		self.rotation = 0
		
	#______________________________________________
	proyector.Update(delta)
	#______________________________________________
	if state != "death":
		if current_health <= 0:
			state_machine.ChangeState("death")
		elif pain_healt >= current_health + 200:
			pain_healt = current_health
			state_machine.ChangeState("pain")
	
	
func Damage(_damage:float, _bullet:Node2D, _bullet_force:float, _shot_type:String, _shape:int) ->void:
	if state != "death" and state != "pain":
		current_health -= _damage
		$AudioHit.play()


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
