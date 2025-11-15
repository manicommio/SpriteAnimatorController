extends BaseState2D


var direction_bullet :Vector2

func enter() ->void:
	animator.pause_clip = false
	
	
func physics_update(_delta:float) ->void:
	
	var axis_x:float = Input.get_axis("left", "right")
	var axis_y:float = Input.get_axis("up", "down")
	player.direction = Vector2(axis_x, axis_y).normalized()

	
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		player.velocity.y = player.jump_velocity


func update(_delta:float) ->void:
	player.ActivateCollision("standing")
	
	if  player.is_on_floor():
		if player.direction:
			if player.direction.x > 0:
				player.FLIP = false
			elif player.direction.x < 0:
				player.FLIP = true
			
			if abs(player.direction.x) > 0:
				if player.direction.y < 0:
					animator.PlayAnimation("run_right_up")
				elif player.direction.y > 0:
					animator.PlayAnimation("run_right_down")
				else:
					animator.PlayAnimation("run_right")
					
			else:
				if player.direction.y < 0:
					animator.PlayAnimation("idle_look_up")
				elif player.direction.y > 0:
					#animator.PlayAnimation("prone")
					emit_signal("change_state","combat_prone")
				else:
					animator.PlayAnimation("idle_look_right")
		else:
			animator.PlayAnimation("idle_look_right")
			
	else:
		emit_signal("change_state","jump")
	
	#_______________________________
	if player.direction:
		direction_bullet = player.direction
	else:
		if player.FLIP:
			direction_bullet = Vector2.LEFT
		else:
			direction_bullet = Vector2.RIGHT
	if Input.is_action_pressed("fire1") :
		if player.direction.y <= 0 or player.direction.x:
			PositionWeapon()
			player.weapon.Shoot(direction_bullet)
	
	

func PositionWeapon() ->void:
	player.weapon.position = Vector2(0, -50.0) + (direction_bullet * 24)
	
