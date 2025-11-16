extends BaseState2D


func enter() -> void:
	player.direction = Vector2.ZERO
	animator.pause_clip = false
	animator.PlayAnimation("landing")
	

func update(_delta:float) ->void:
	animator.pause_clip = false
	player.ActivateCollision("standing")
	if animator.Finished():
		emit_signal("change_state","combat_standing")
