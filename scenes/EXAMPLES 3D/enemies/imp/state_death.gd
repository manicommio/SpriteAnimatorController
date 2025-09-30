extends BaseState3D


func enter() ->void:
	player.move_dir = 0
	animator.PlayAnimation("death")
	player.collision_shape.set_deferred("disabled", true)
	player.set_physics_process(false)
