extends BaseState2D


var state_time :float = 0.0
var this_state = "normal jump"

var direction :Vector2
var animation_name := "jump"
var double_jump := false


func enter() -> void:
	state_time = 0.0
	this_state = "normal jump"
	
	if player.is_sprinting:
		animation_name = "jump_run"
	else:
		animation_name = "jump_walk"
	
	animator.PlayAnimation(animation_name)

	player.is_crouch = false
	direction = Vector2.ZERO
	double_jump = false
	player.get_node("Audio_jump").stream = load("res://sound/tps godot4/player_audio_jump.wav")
	if player.jump_velocity>0:
		player.get_node("Audio_jump").play()
	
	
func update(delta:float) -> void:

	var fwd = player.joystick_direction.y
	var hwd = player.joystick_direction.x
	direction = Vector2(hwd, fwd).normalized()
	#________________________________________________________
	if player.jump_velocity>=3 :
		animator.clip_library[animation_name].frame_index = 0
		animator.clip_library["aim_jump_walk"].frame_index = 0
		animator.clip_library["aim_jump_walk_forward_left"].frame_index = 0
		animator.clip_library["aim_jump_walk_left"].frame_index = 0
		animator.clip_library["aim_jump_run"].frame_index = 0
		animator.clip_library["aim_jump_run_forward_left"].frame_index = 0
		animator.clip_library["aim_jump_run_left"].frame_index = 0

	elif player.jump_velocity>=0  and player.jump_velocity<3:
		animator.clip_library[animation_name].frame_index = 1
		animator.clip_library["aim_jump_walk"].frame_index = 1
		animator.clip_library["aim_jump_walk_forward_left"].frame_index = 1
		animator.clip_library["aim_jump_walk_left"].frame_index = 1
		animator.clip_library["aim_jump_run"].frame_index = 1
		animator.clip_library["aim_jump_run_forward_left"].frame_index = 1
		animator.clip_library["aim_jump_run_left"].frame_index = 1
	
	elif player.jump_velocity>=-5  and player.jump_velocity<0:
		animator.clip_library[animation_name].frame_index = 2
		animator.clip_library["aim_jump_walk"].frame_index = 2
		animator.clip_library["aim_jump_walk_forward_left"].frame_index = 2
		animator.clip_library["aim_jump_walk_left"].frame_index = 2
		animator.clip_library["aim_jump_run"].frame_index = 2
		animator.clip_library["aim_jump_run_forward_left"].frame_index = 2
		animator.clip_library["aim_jump_run_left"].frame_index = 2
	
	elif player.jump_velocity<-5:
		animator.clip_library[animation_name].frame_index = 3
		animator.clip_library["aim_jump_walk"].frame_index = 3
		animator.clip_library["aim_jump_walk_forward_left"].frame_index = 3
		animator.clip_library["aim_jump_walk_left"].frame_index = 3
		animator.clip_library["aim_jump_run"].frame_index = 3
		animator.clip_library["aim_jump_run_forward_left"].frame_index = 3
		animator.clip_library["aim_jump_run_left"].frame_index = 3

	#_____________________________________________________________
	if player.is_grounded:
		if player.landing_velocity < -7.0:
			emit_signal("change_state", "landing")
		else:
			emit_signal("change_state", "standing_combat")
	else:
		# double jump ______________________________________
		if Input.is_action_just_pressed("jump") and !double_jump:
			double_jump = true
			player.get_node("Audio_jump").play()
			if direction:
				player.direction = Vector2(-hwd, -fwd).normalized()

				player.animation_direction_player = player.direction
			
			#_________________________________
			if player.is_sprinting:
				player.Jump(4.0)
			else:
				if player.is_crouch:
					player.Jump(3.0)
				else:
					player.Jump(4.0)
		# atacar______________________________________
		match this_state:
			"normal jump":
				if Input.is_action_pressed("fire1"):
					this_state = "jump shooting"
				
				if !double_jump:
					if player.is_sprinting:
						animation_name = "jump_run"
					else:
						animation_name = "jump_walk"
				else:
					animation_name = "jump_walk"
				animator.PlayAnimation(animation_name)
			
			"jump shooting":
				if Input.is_action_pressed("fire1"):
					player.weapon.Disparar(delta)
				
				if !double_jump:
					if player.is_sprinting:
						animator.PlayAnimationSpace("aim_jump_run_space")
					else:
						animator.PlayAnimationSpace("aim_jump_walk_space")
				else:
					animator.PlayAnimationSpace("aim_jump_walk_space")

	#___________________________________
	#player.weapon.altura_vuelo = -40
