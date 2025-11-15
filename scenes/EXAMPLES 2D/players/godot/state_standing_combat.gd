extends BaseState2D


var direction :Vector2

func enter() -> void:
	animator.play_backward = false
	animator.pause_clip = false
	

func physics_update(delta:float) -> void:

	var pfwd = player.joystick_direction.y
	var phwd = player.joystick_direction.x
	var fwd = player.camera.get_node("camera_rotation").global_transform.basis_xform(Vector2.UP) * pfwd
	var hwd = player.camera.get_node("camera_rotation").global_transform.basis_xform(Vector2.LEFT) * phwd
	player.direction = (fwd + hwd).normalized()
	direction = Vector2(-phwd, pfwd).normalized()
	
	if player.direction:
		if player.is_sprinting:
			player.is_crouch = false
			animator.PlayAnimation("run_standing")

		elif player.is_crouch:
			emit_signal("change_state","standing_to_crouch")
			
		else:
			animator.PlayAnimation("walk_standing")
			
		#player.animation_direction = player.direction
		""" PLEASE DO NOT ROTATE WITH LOOK_AT """
		player.rotation = lerp_angle(player.rotation, atan2(-phwd, pfwd) + player.camera.get_node("camera_rotation").rotation, delta * 20)
	else:
		if player.is_crouch:
			emit_signal("change_state","standing_to_crouch")
		else:
			animator.PlayAnimation("idle_standing")
			
	#_____________________________________________
	player.weapon.altura_vuelo = -38.0
	#atacar______________________________________
	if Input.is_action_pressed("fire1"):
		emit_signal("change_state", "shoot_standing")


	if player.is_grounded:
		# correr _______________________________________________________________
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
				player.Jump(5.0)
			else:
				if player.is_crouch:
					player.Jump(4.0)
				else:
					player.Jump(5.0)
		
	# agacharse____________________________________
		elif Input.is_action_just_pressed("crouch"):
			player.is_crouch =! player.is_crouch
	
	else:
		
		if player.is_sprinting:
			emit_signal("change_state", "jumping")
		else:
			emit_signal("change_state", "jumping")
	
	# ACTION __________________________________
	if Input.is_action_just_pressed("action"):
		pass


func update(_delta:float) ->void:
	player.get_node("audio_step").AudioStep()
