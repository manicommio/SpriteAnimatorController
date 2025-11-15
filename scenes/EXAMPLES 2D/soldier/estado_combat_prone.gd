extends BaseState2D


var estado = "entrando"
var direction :Vector2
var direction_bullet :Vector2

func enter() ->void:
	estado = "entrando"
	animator.frame_index = 54  #50-54
	animator.pause_clip = false
	animator.play_backward = true
	animator.PlayAnimation("prone_to_standing")
	
	
func update(_delta:float) ->void:
	player.ActivateCollision("prone")
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	match estado:
		"entrando":
			# agacharse____________________________________
			if direction.y <=0 or abs(direction.x)>0:
				animator.play_backward = false
				animator.pause_clip = false
				estado = "saliendo"
			else:
				if animator.frame_index <= 49:
					animator.frame_index = 49
					animator.pause_clip = true
					
					#_______________________________
					PositionWeapon()
					if player.FLIP:
						direction_bullet = Vector2.LEFT
					else:
						direction_bullet = Vector2.RIGHT
					if Input.is_action_pressed("fire1"):
						player.weapon.Shoot(direction_bullet)
					
					
					
					
		"saliendo":
			if animator.frame_index >= 54:
				animator.frame_index = 54
				animator.pause_clip = true
				emit_signal("change_state","combat_standing")

	if !player.is_on_floor():
		emit_signal("change_state","jump")
		

func PositionWeapon() ->void:
	player.weapon.position = Vector2(0, -12.0) + (direction_bullet * 24)
	
	
	
