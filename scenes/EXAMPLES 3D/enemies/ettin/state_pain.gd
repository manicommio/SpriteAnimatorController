extends BaseState3D


var state_time := 0.0


func enter() ->void:
	state_time = 0.0
	animator.PlayAnimation("pain")


func update(_delta:float) -> void:
	player.move_dir = 0

	if animator.Finished():
		player.NavigationPath()
		emit_signal("change_state","hunt")
