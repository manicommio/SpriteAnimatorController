extends CharacterBody2D

@onready var animator_controller :AnimatorController = $AnimatorController
@onready var state_machine :StateMachine = $StateMachine
@onready var collision_shape_1 = $CollisionShape1
@onready var collision_shape_2 = $CollisionShape2
@onready var weapon = $weapon


#_______________________
var walk_speed := 180
var run_speed := 360
var SPEED = 300.0
var jump_velocity = -500.0
var is_sprinting := false
var direction : Vector2
var animation_direction :Vector2
var FLIP := false
var estado := ""


func _ready() ->void:
	set_physics_process(false)
	await get_tree().create_timer(2.0).timeout
	set_physics_process(true)
	self.show()


func _physics_process(delta:float) ->void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _process(_delta:float) ->void:
	if animator_controller.current_clip != null:
		animator_controller.current_clip.FLIP = FLIP
	#__________________________________
	if state_machine.current_state != null:
		estado = state_machine.current_state.get_name()
		

func ActivateCollision(_type:String) ->void:
	match  _type:
		"prone":
			collision_shape_1.set_deferred("disabled", true)
			collision_shape_2.set_deferred("disabled", false)
			
		"roll":
			collision_shape_1.set_deferred("disabled", true)
			collision_shape_2.set_deferred("disabled", false)

		"crouch":
			collision_shape_1.set_deferred("disabled", true)
			collision_shape_2.set_deferred("disabled", false)

		"standing":
			collision_shape_1.set_deferred("disabled", false)
			collision_shape_2.set_deferred("disabled", true)

		"jump":
			collision_shape_1.set_deferred("disabled", false)
			collision_shape_2.set_deferred("disabled", true)
