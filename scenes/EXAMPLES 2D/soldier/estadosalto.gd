extends BaseState2D

var velocity := 0.0
var direction_bullet :Vector2

func enter() -> void:
	velocity = player.velocity.y
	animator.pause_clip = true
	
func physics_update(_delta:float) ->void:

	player.direction.x = Input.get_axis("left", "right")
	player.direction.y = Input.get_axis("up", "down")
	
	
	if velocity < player.velocity.y:
		velocity = player.velocity.y
		
	if player.velocity.y<= -150 :
		if animator.animation_key == "jump_look_right":
			animator.frame_index = 16
		elif animator.animation_key == "jump_look_down":
			animator.frame_index = 19
		elif animator.animation_key == "jump_look_right_down":
			animator.frame_index = 22
		elif animator.animation_key == "jump_look_right_up":
			animator.frame_index = 25
		elif animator.animation_key == "jump_look_up":
			animator.frame_index = 28
	
	if player.velocity.y<=150  and player.velocity.y> -150:
		if animator.animation_key == "jump_look_right":
			animator.frame_index = 16+1
		elif animator.animation_key == "jump_look_down":
			animator.frame_index = 19+1
		elif animator.animation_key == "jump_look_right_down":
			animator.frame_index = 22+1
		elif animator.animation_key == "jump_look_right_up":
			animator.frame_index = 25+1
		elif animator.animation_key == "jump_look_up":
			animator.frame_index = 28+1

	elif player.velocity.y>150: 
		if animator.animation_key == "jump_look_right":
			animator.frame_index = 16+2
		elif animator.animation_key == "jump_look_down":
			animator.frame_index = 19+2
		elif animator.animation_key == "jump_look_right_down":
			animator.frame_index = 22+2
		elif animator.animation_key == "jump_look_right_up":
			animator.frame_index = 25+2
		elif animator.animation_key == "jump_look_up":
			animator.frame_index = 28+2
	
	#__________________________________________________
	if player.is_on_floor():
		if velocity >= 300: 
			emit_signal("change_state", "landing")
		else:
			emit_signal("change_state", "combat_standing")
	

func update(_delta:float) ->void:
	player.ActivateCollision("jump")
	#______________________________________________
	if player.direction:
		direction_bullet = player.direction
		if player.direction.x > 0:
			player.FLIP = false
		elif player.direction.x < 0:
			player.FLIP = true
		
		if abs(player.direction.x) > 0:
			if player.direction.y < 0:
				animator.PlayAnimation("jump_look_right_up")
			elif player.direction.y > 0:
				animator.PlayAnimation("jump_look_right_down")
			else:
				animator.PlayAnimation("jump_look_right")
				
		else:
			if player.direction.y < 0:
				animator.PlayAnimation("jump_look_up")
			elif player.direction.y > 0:
				animator.PlayAnimation("jump_look_down")
			else:
				animator.PlayAnimation("jump_look_right")
	else:
		animator.PlayAnimation("jump_look_right")
		
	#____________________________________
	if player.direction:
		direction_bullet = player.direction
	else:
		if player.FLIP:
			direction_bullet = Vector2.LEFT
		else:
			direction_bullet = Vector2.RIGHT
	if Input.is_action_pressed("fire1"):
		player.weapon.Shoot(direction_bullet)
	#_______________________________________
	PositionWeapon()
	

func PositionWeapon() ->void:
	player.weapon.position = Vector2(0, -50.0) + (direction_bullet * 24)
		
