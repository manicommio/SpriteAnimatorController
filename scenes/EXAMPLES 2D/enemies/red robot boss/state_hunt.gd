extends BaseState2D


var target_direction:Vector2
var torque := 0.0

func enter() ->void:
	pass

func update(delta:float) -> void:
	if GameManager.player2d != null:
		target_direction = (GameManager.player2d.global_position - player.global_position).normalized()
		player.direction = target_direction
	
	""" PLEASE DO NOT ROTATE WITH LOOK_AT """
	""" USE ANY OTHER ROTATION METHOD THAT ALLOWS YOU TO PUT THE TARGET ON THE -Y AXIS OF THE NODE TO BE ROTATED """
	# ROTATE ENEMY EXAMPLE 1 __________________________
	#torque = lerp_angle(torque, atan2(player.direction.x, -player.direction.y) - ( player.rotation ), delta * 15)
	#torque = clamp(torque , -deg_to_rad(45),deg_to_rad(45))
	#player.rotate(torque * 5 * delta)
	
	# ROTATE ENEMY EXAMPLE 2 __________________________
	#player.rotation = lerp_angle(torque, atan2(player.direction.x, -player.direction.y) - ( player.rotation ), delta * 15)
	
	# ROTATE ENEMY EXAMPLE 3 __________________________
	#player.rotation = atan2(player.direction.x, -player.direction.y) 

	
	torque = lerp_angle(torque, atan2(player.direction.x, -player.direction.y) - ( player.rotation ), delta)
	torque = clamp(torque , -deg_to_rad(45),deg_to_rad(45))
	if rad_to_deg(torque) < -7:
		player.rotate(torque * 2 * delta)
		player.move_dir = 0
		animator.PlayAnimation("turn_left")
	elif rad_to_deg(torque) > 7:
		player.rotate(torque * 2 * delta)
		player.move_dir = 0
		animator.PlayAnimation("turn_right")
	else :
		player.rotate(torque * 2 * delta)
		player.move_dir = 1.0
		animator.PlayAnimation("walk")
	
	AudioStep()


func AudioStep():
	if animator.current_clip.get_name() == "walk":
		if animator.clip_library["walk"].KeyFrame(3,true) or animator.clip_library["walk"].KeyFrame(6,true):
			player.get_node("AudioStep").play() 
	
	elif animator.current_clip.get_name() == "turn_left":
		if animator.clip_library["turn_left"].KeyFrame(3,true) or animator.clip_library["turn_left"].KeyFrame(6,true):
			player.get_node("AudioStep").play() 
	
	elif animator.current_clip.get_name() == "turn_right":
		if animator.clip_library["turn_right"].KeyFrame(3,true) or animator.clip_library["turn_right"].KeyFrame(6,true):
			player.get_node("AudioStep").play() 
	
