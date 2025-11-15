extends BaseState3D


func enter() ->void:
	animator.PlayAnimation("pain")


func update(_delta:float) -> void:
	player.move_dir = 0
	
	if animator.Finished():
		player.NavigationPath()
		emit_signal("change_state","hunt")
