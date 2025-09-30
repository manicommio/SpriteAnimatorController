extends BaseState2D

var tiempo_estado := 0.0


func enter() ->void:

	tiempo_estado = 0
	animator.PlayAnimation("death1")
	player.collision_shape_1.set_deferred("disabled", true)
	player.is_dead = true

func update(delta:float) ->void:
	
	tiempo_estado += delta
	if tiempo_estado >= 7.0:
		player.collision_shape_1.set_deferred("disabled", false)
		player.is_dead = false
		player.current_health = player.health
		emit_signal("change_state","idle")
