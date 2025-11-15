extends BaseState2D


@export var proyector :Node2D

func enter() ->void:
	animator.sprite_2d = proyector.lift.get_node("explosion")
	player.move_dir = 0
	proyector.sprite_2d.hide()
	proyector.shadow_sprite.hide()
	proyector.lift.get_node("explosion").show()
	proyector.lift.get_node("smoke").emitting = true
	proyector.lift.get_node("onda").emitting = true
	animator.PlayAnimation("explosion")
	player.get_node("AudioExplosion").play()
	player.collision_shape.set_deferred("disabled", true)
	
	var impact = player.explosion_impact.instantiate()
	player.terrain.get_node("blood_bullet_impact").add_child(impact)
	impact.Start(player, 2.0)
