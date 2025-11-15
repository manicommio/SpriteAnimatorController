extends BaseState2D


func enter() ->void:
	animator.PlayAnimation("heavy_damage")
	player.get_node("AudioHit2").play()
	

func update(_delta:float) -> void:
	player.move_dir = 0
	
	if animator.Finished():
		emit_signal("change_state","idle")
		 
