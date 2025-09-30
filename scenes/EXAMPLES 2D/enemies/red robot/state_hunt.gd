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
	torque = lerp_angle(torque, atan2(player.direction.x, -player.direction.y) - ( player.rotation ), delta * 15)
	torque = clamp(torque , -deg_to_rad(45),deg_to_rad(45))
	player.rotate(torque * 5 * delta)
	
	# ROTATE ENEMY EXAMPLE 2 __________________________
	#player.rotation = lerp_angle(torque, atan2(player.direction.x, -player.direction.y) - ( player.rotation ), delta * 15)
	
	# ROTATE ENEMY EXAMPLE 3 __________________________
	#player.rotation = atan2(player.direction.x, -player.direction.y) 
	
	player.move_dir = 1.0
	animator.PlayAnimation("walk")
	
	if animator.clip_library["walk"].KeyFrame(3,true) or animator.clip_library["walk"].KeyFrame(6,true):
		player.get_node("AudioStep").play() 
