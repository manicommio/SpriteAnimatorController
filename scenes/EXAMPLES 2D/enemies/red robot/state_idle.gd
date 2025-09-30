extends BaseState2D

@export var proyector :Node2D
var last_health := 0.0

func enter() ->void:
	proyector.sprite_2d.show()
	proyector.lift.get_node("explosion").hide()
	animator.PlayAnimation("idle")
	last_health = player.current_health
	

func update(_delta:float) -> void:
	player.move_dir = 0
	if last_health > player.current_health:
		emit_signal("change_state","hunt")
