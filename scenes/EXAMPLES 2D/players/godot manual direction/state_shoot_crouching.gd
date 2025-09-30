extends BaseState2D


var tiempo_refresh_roll := 0.0
var puede_activar_roll := false
var state_time :float = 0.0
var direction := Vector2()


func enter() -> void:
	state_time = 0


func physics_update(_delta:float) -> void:
	# JOYSTICK ________________________________________
	var fwd = player.joystick_direction.y
	var hwd = player.joystick_direction.x
	player.direction = Vector2(-hwd, -fwd).normalized()
	direction = Vector2(-hwd, -fwd).normalized()
	

func update(delta:float) -> void:
	
	# ANIMACIONES ______________________________________
	if player.is_sprinting or !player.is_crouch:
		player.is_crouch = false
		emit_signal("change_state","standing_to_crouch")
	else:
		animator.PlayAnimationSpace("crouch_space")
	
	if animator.current_space != null:
		PositionWeapon()

	#_______________________________________________
	player.weapon.altura_vuelo = -28
	# atacar________________________________________
	if Input.is_action_pressed("fire1"):
		state_time = 0
		player.weapon.Disparar(delta)
	else:
		state_time += delta
		if state_time >= 0.5:
			emit_signal("change_state", "crouching_combat")

	#______________________________________________________
	if player.is_grounded:
		# correr ____________________________________________
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
	var orientation :int = animator.current_space.my_orientation
	match orientation:
		0:#__________ center
			player.weapon.position.x = 4.0
		1:#__________ N
			player.weapon.position.x = 4.0
		2:#__________ NE
			player.weapon.position.x = 4.0
		3:#__________ E
			player.weapon.position.x = -2.0
		4:#__________ SE
			player.weapon.position.x = -4.0
		5:#__________ S
			player.weapon.position.x = 4.0
		6:#__________ SW
			player.weapon.position.x = -3.0
		7:#__________ W
			player.weapon.position.x = 2.0
		8:#__________ NW
			player.weapon.position.x = -4.0
