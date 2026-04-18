extends BaseState2DResource



func Setup(_name, _actor, _animator) -> void:
	state_name = _name
	player = _actor
	animator =_animator

	
func enter() ->void:
	animator.play_backward = false
	animator.pause_clip = false 
	animator.PlayAnimation("heavy_damage")
	player.get_node("AudioHit2").play()
	

func update(_delta:float) -> void:
	player.move_dir = 0
	
	if animator.Finished():
		emit_signal("change_state","idle")
		 
