extends BaseState2D


func enter() -> void:
	player.direction = Vector2.ZERO
	#animator.clip_library["jump"].FLIP = player.FLIP
	animator.PlayAnimation("landing")
	

func update(_delta:float) ->void:
	player.ActivateCollision("standing")
	if animator.clip_library["landing"].Finished():
		emit_signal("change_state","combat_standing")
