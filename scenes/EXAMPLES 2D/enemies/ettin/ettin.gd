extends CharacterBody2D

@onready var state_machine = $StateMachine
@onready var animator_controller = $AnimatorController
@onready var collision_shape_1 = $CollisionShape1

#_____________________________________________
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction :Vector2
var animation_direction :Vector2
var FLIP := false
var estado :String
var is_dead := false
var health := 100.0
var current_health := 100.0

func _physics_process(delta:float) ->void:
	# Add the gravity.
	if not is_on_floor():
		if !is_dead:
			velocity += get_gravity() * delta


	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _process(_delta:float) ->void:
	if animator_controller != null:
		animator_controller.FLIP = FLIP
	#__________________________________
	if state_machine.current_state != null:
		estado = state_machine.current_state.get_name()
	#_________________________________________-
	if !is_dead:
		if current_health <=0:
			state_machine.ChangeState("death")


func Damage(_amount:float) ->void:
	if !is_dead:
		current_health -= _amount
