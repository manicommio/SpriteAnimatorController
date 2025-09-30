extends BaseState3D


var state_time := 0.0


func enter() -> void:
	state_time = 0.0


func update(delta:float) -> void:
	
	player.destination = GameManager.player3d.global_transform.origin
	player.move_dir = 1.0
	player.RotateEnemy(delta)
	if player.path.size() <= 0:
		player.NavigationPath()
		
	animator.PlayAnimation("walk")
	state_time += delta


	if state_time >= 30.0:
		state_time = 0
		emit_signal("change_state","idle")
	
	#if player.DistanciaPlayer() <= 1.5:
		#emit_signal("state_change",  "ataque_golpe")
	
