extends BaseState2D


var state_time :float = 0.0
var animation_name := ""

func enter() -> void:
	state_time = 0.0
	if player.landing_velocity <= -15:
		animation_name = "landing_run"
	else:
		animation_name = "landing_walk"
	
	animator.play_backward = false
	animator.pause_clip = false
	animator.PlayAnimation(animation_name)

	player.is_crouch = false
	player.direction = Vector2.ZERO
	
	player.get_node("Audio_jump").stream = load("res://sounds/tps godot4/player_audio_land.wav")
	player.get_node("Audio_jump").play()
	

func update(_delta:float) -> void:
	if animator.Finished():
		if Input.is_action_pressed("fire1"):
			emit_signal("change_state","shoot_standing")
		else:
			emit_signal("change_state","standing_combat")
	
	
