extends BaseState2D

@export var proyector :Node2D
var last_health := 0.0
var state_time := 0.0
var time_looking := [5.0, 7.0, 15.0]
var choice_time := 0
var looking_left_rgiht := 0



func enter() ->void:
	state_time = 0.0
	proyector.sprite_2d.show()
	proyector.lift.get_node("explosion").hide()
	animator.play_backward = false
	animator.pause_clip = false 
	animator.PlayAnimation("idle")
	last_health = player.current_health
	
	randomize()
	looking_left_rgiht = randi()%2
	choice_time = randi()%3
	

func update(delta:float) -> void:
	player.move_dir = 0
	if last_health > player.current_health:
		emit_signal("change_state","hunt")
	
	state_time += delta
	if state_time >= time_looking[choice_time]:
		if looking_left_rgiht == 0:
			emit_signal("change_state","looking_left")
		else:
			emit_signal("change_state","looking_right")
