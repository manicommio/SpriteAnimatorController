extends BaseState2D


var state_time :float = 0.0
var this_state := "standing to crouch"

func enter() -> void:
	if player.is_crouch:
		animator.clip_library["standing_to_crouch"].frame_index = 0
		animator.clip_library["standing_to_crouch"].play_backward = false
		animator.clip_library["standing_to_crouch"].pause_clip = false
		animator.PlayAnimation("standing_to_crouch")
		this_state = "standing to crouch"
	
	else:
		animator.clip_library["standing_to_crouch"].frame_index = 3
		animator.clip_library["standing_to_crouch"].play_backward = true
		animator.clip_library["standing_to_crouch"].pause_clip = false
		animator.PlayAnimation("standing_to_crouch")
		this_state = "crouch to standing"
	
	state_time = 0
	player.direction = Vector2.ZERO
	

func update(_delta:float) -> void:
	match this_state:
		
		"standing to crouch":
			if animator.clip_library["standing_to_crouch"].frame_index >= 3 or animator.clip_library["standing_to_crouch"].Finished():
				animator.clip_library["standing_to_crouch"].frame_index = 3
				animator.clip_library["standing_to_crouch"].pause_clip = true
				if Input.is_action_pressed("fire1"):
					emit_signal("change_state","shoot_crouching")
				else:
					emit_signal("change_state","crouching_combat")
				
		"crouch to standing":
			if animator.clip_library["standing_to_crouch"].frame_index <= 0 or animator.clip_library["standing_to_crouch"].Finished():
				animator.clip_library["standing_to_crouch"].frame_index = 0
				animator.clip_library["standing_to_crouch"].pause_clip = true
				if Input.is_action_pressed("fire1"):
					emit_signal("change_state","shoot_standing")
				else:
					emit_signal("change_state","standing_combat")
