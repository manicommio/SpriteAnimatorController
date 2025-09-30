extends BaseState3D


var state_time := 0.0
var last_health := 0.0

func enter() -> void:
	state_time = 0.0
	animator.PlayAnimation("idle")
	last_health = player.current_health


func update(_delta:float) -> void:
	player.show()
	player.move_dir = 0
	#________________________________________________________
	if last_health > player.current_health:
		player.destination = GameManager.player3d.global_transform.origin
		player.NavigationPath()
		emit_signal("change_state", "hunt")
