extends BaseState2D


func enter() ->void:
	animator.PlayAnimation("pain")
	player.get_node("AudioHit").stream = load("res://sounds/tps godot3/robot_walk_step_ini.wav")
	player.get_node("AudioHit").play()
	

func update(_delta:float) -> void:
	player.move_dir = 0
	
	if animator.Finished():
		player.get_node("AudioHit").stream = load("res://sounds/tps godot3/sound_hit.wav")
		emit_signal("change_state","idle")
		 
