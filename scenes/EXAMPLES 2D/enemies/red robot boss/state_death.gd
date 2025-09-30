extends BaseState2D


@export var proyector :Node2D
var this_state = "ini"
var state_time := 0.0
var explode_count := 0
var explode_time := 0.0


func enter() ->void:
	state_time = 0
	player.move_dir = 0
	this_state = "ini"
	proyector.lift.get_node("explode_front").emitting = true
	proyector.lift.get_node("explode_back").emitting = true
	proyector.lift.get_node("explode_smoke").emitting = true
	animator.current_clip.pause_clip = true
	proyector.sprite_2d.self_modulate = Color(0.6, 0.6, 0.6, 1.0)


func update(delta:float) -> void:
	match  this_state:
		"ini":
			if explode_count < 15:
				explode_time += delta
				if explode_time >= 0.13:
					explode_time = 0
					explode_count += 1
					player.get_node("AudioExplosion").volume_db = -8.0
					player.get_node("AudioExplosion").play()
			else:
				this_state = "destroy"
		
		"destroy":
			state_time += delta
			if state_time >= 7.0:
				player.get_node("AudioExplosion").volume_db = 0.0
				Destroy()
				this_state = "end"
	

func Destroy() ->void:
	player.collision_shape.set_deferred("disabled", true)
	proyector.sprite_2d.hide()
	proyector.shadow_sprite.hide()
	proyector.lift.get_node("explosion").show()
	proyector.lift.get_node("smoke_up").emitting = false
	proyector.lift.get_node("smoke_L").emitting = false
	proyector.lift.get_node("smoke_R").emitting = false
	proyector.lift.get_node("onda").emitting = true
	proyector.lift.get_node("smoke_end").emitting = true
	animator.PlayAnimation("explosion")
	player.get_node("AudioExplosion").play()
	
	var impact = player.explosion_impact.instantiate()
	player.terrain.get_node("blood_bullet_impact").add_child(impact)
	impact.Start(player, 3.0)
