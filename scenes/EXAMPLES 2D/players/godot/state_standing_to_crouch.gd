extends BaseState2D


var state_time :float = 0.0
var this_state := "standing to crouch"

func enter() -> void:
	if player.is_crouch:
		animator.frame_index = 0
		animator.play_backward = false
		animator.pause_clip = false
		animator.PlayAnimation("standing_to_crouch")
		this_state = "standing to crouch"
	
	else:
		animator.frame_index = 3
		animator.play_backward = true
		animator.pause_clip = false
		animator.PlayAnimation("standing_to_crouch")
		this_state = "crouch to standing"
	
	state_time = 0
	player.direction = Vector2.ZERO
	

func update(_delta:float) -> void:
	match this_state:
		
		"standing to crouch":
			if animator.frame_index >= 3 or animator.Finished():
				animator.frame_index = 3
				animator.pause_clip = true
				if Input.is_action_pressed("fire1"):
					
					emit_signal("change_state","shoot_crouching")
				else:
					
					emit_signal("change_state","crouching_combat")
				
		"crouch to standing":
			if animator.frame_index <= 0 or animator.Finished():
				animator.frame_index = 0
				animator.pause_clip = true
				if Input.is_action_pressed("fire1"):
					
					emit_signal("change_state","shoot_standing")
				else:
					
					emit_signal("change_state","standing_combat")
