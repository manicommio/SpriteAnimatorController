extends BaseState2D

#@export var proyector :Node2D
var altura_vuelo := 44.0
var altura_underground := 0.0

var tiempo_refresh_roll := 0.0
var puede_activar_roll := false
var extra_jump:float = 0.0
var time_fast_run:float = 0.0


var tiempo_eg := 0.0


func enter() -> void:
	pass

func physics_update(_delta:float) -> void:

	var fwd = player.joystick_direction.y
	var hwd = player.joystick_direction.x
	player.direction = Vector2(-hwd, -fwd).normalized()

	if player.direction:
		if player.is_sprinting:
			player.is_crouch = false
			emit_signal("change_state","standing_to_crouch")
			
		elif player.is_crouch:
			animator.PlayAnimation("walk_crouch")

		else:
			emit_signal("change_state","standing_to_crouch")
			
		""" IMPORTANT MANUAL DIRECTION"""
		player.animation_direction = player.direction
	else:
		if player.is_crouch:
			animator.PlayAnimation("idle_crouch")
			
		else:
			emit_signal("change_state","standing_to_crouch")
	
	#_____________________________________________
	player.weapon.altura_vuelo = -22
	# atacar______________________________________
	if Input.is_action_pressed("fire1"):
		if player.is_crouch:
			emit_signal("change_state", "shoot_crouching")

	# correr _______________________________________________________________
	if player.is_grounded:
		if player.joystick != null:
			if (Input.is_action_pressed("sprinting") or player.joystick.double_click):
				if player.direction:
					player.is_sprinting = true
				else:
					player.is_sprinting = false
			else:
				player.is_sprinting = false
		else:
			if Input.is_action_pressed("sprinting"):
				if player.direction:
					player.is_sprinting = true
				else:
					player.is_sprinting = false
			else:
				player.is_sprinting = false
	

		# saltar______________________________________
		if Input.is_action_just_pressed("jump"):
			if player.is_sprinting:
				player.Jump(6.0)
			else:
				if player.is_crouch:
					player.Jump(5.0)
				else:
					player.Jump(6.0)
		
	# agacharse____________________________________
		elif Input.is_action_just_pressed("crouch"):
			player.is_crouch =! player.is_crouch
	
	else:
		if player.is_sprinting:
			emit_signal("change_state", "jumping")
		else:
			emit_signal("change_state", "jumping")
	
	
	if Input.is_action_just_pressed("action"):
		pass


func update(_delta:float) ->void:
	player.get_node("audio_step").AudioStep()
