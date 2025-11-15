extends BaseState2D


var state_time :float = 0.0
var direction := Vector2()


func enter() -> void:
	state_time = 0
	animator.play_backward = false
	animator.pause_clip = false
	

func physics_update(_delta:float) -> void:
	# JOYSTICK ________________________________________
	var fwd = player.joystick_direction.y
	var hwd = player.joystick_direction.x
	player.direction = Vector2(-hwd, -fwd).normalized()
	direction = Vector2(-hwd, -fwd).normalized()
	

func update(delta:float) -> void:
	# ANIMACIONES _______________________________________
	if player.is_sprinting:
		animator.PlayAnimationSpace("run_space")
	else:
		animator.PlayAnimationSpace("walk_space")
	
	if animator.current_space != null:
		PositionWeapon()

	#________________________________________________
	if player.is_crouch:
		emit_signal("change_state","standing_to_crouch")
			
	#________________________________________________
	player.weapon.altura_vuelo = -46.0
	# atacar__________________________________________
	if Input.is_action_pressed("fire1"):
		state_time = 0
		player.weapon.Disparar(delta)
	else:
		state_time += delta
		if state_time >= 0.5:
			emit_signal("change_state", "standing_combat")


	#____________________________________________________________
	if player.is_grounded:
		# correr ____________________________________________________
		if player.joystick != null:
			if (Input.is_action_pressed("sprinting") or player.joystick.double_click):
				if direction:
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
				player.Jump(5.0)
			else:
				if player.is_crouch:
					player.Jump(4.0)
				else:
					player.Jump(5.0)
	else:
		emit_signal("change_state", "jumping")
		
	# agacharse____________________________________
	if Input.is_action_just_pressed("crouch"):
		player.is_crouch =! player.is_crouch
	
	
	player.get_node("audio_step").AudioStep()


func PositionWeapon() ->void:
	var orientation :int = animator.my_space_orientation
	match orientation:
		0:#__________ center
			player.weapon.position.x = 11.0
		1:#__________ N
			player.weapon.position.x = 11.0
		2:#__________ NE
			player.weapon.position.x = -11.0
		3:#__________ E
			player.weapon.position.x = -6.0
		4:#__________ SE
			player.weapon.position.x = 11.0
		5:#__________ S
			player.weapon.position.x = 11.0
		6:#__________ SW
			player.weapon.position.x = -11.0
		7:#__________ W
			player.weapon.position.x = 6.0
		8:#__________ NW
			player.weapon.position.x = 11.0
