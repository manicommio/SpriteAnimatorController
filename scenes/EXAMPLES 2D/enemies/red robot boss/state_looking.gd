extends BaseState2D


@export var animation_name :String
var last_health := 0.0
var state_time := 0.0
var time_looking := [1.0, 3.0, 7.0]
var choice_time := 0
var this_state = "ini"


func enter() ->void:
	last_health = player.current_health
	
	state_time = 0
	this_state = "ini"
	animator.clip_library[animation_name].frame_index = 0
	animator.clip_library[animation_name].play_backward = false
	animator.clip_library[animation_name].pause_clip = false  
	animator.PlayAnimation(animation_name)
	player.get_node("AudioLook").play() 
	
	randomize()
	choice_time = randi()%3
	

func update(delta:float) -> void:
	player.move_dir = 0
	if last_health > player.current_health:
		emit_signal("change_state","hunt")
	
	match this_state:
		"ini":
			if animator.clip_library[animation_name].frame_index >= 7:
				animator.clip_library[animation_name].frame_index = 7
				animator.clip_library[animation_name].pause_clip = true 
				this_state = "pause"
		
		"pause":
			state_time += delta
			if state_time >= time_looking[choice_time]:
				state_time = 0
				animator.clip_library[animation_name].frame_index = 7
				animator.clip_library[animation_name].play_backward = true
				animator.clip_library[animation_name].pause_clip = false
				player.get_node("AudioLook").play() 
				this_state = "end"
		
		"end":
			if animator.clip_library[animation_name].frame_index <= 0:
				animator.clip_library[animation_name].frame_index = 0
				animator.clip_library[animation_name].play_backward = false
				animator.clip_library[animation_name].pause_clip = false 
				emit_signal("change_state","idle")
