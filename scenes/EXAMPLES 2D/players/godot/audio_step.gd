extends AudioStreamPlayer2D


@export var player:Node2D
@export var animator :AnimatorController


func AudioStep():
	if animator.current_clip != null:
		if animator.animation_name == "walk_standing" :
			if animator.KeyFrame(3,true) or animator.KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "walk_crouch" :
			if animator.KeyFrame(3,true) or animator.KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
			
		elif animator.animation_name == "run_standing" :
			if animator.KeyFrame(0,true) or animator.KeyFrame(3,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_crouch_forward" :
			if animator.KeyFrame(3,true) or animator.KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_crouch_forward_left" :
			if animator.KeyFrame(3,true) or animator.KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_crouch_left" :
			if animator.KeyFrame(3,true) or animator.KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_walk_forward" :
			if animator.KeyFrame(3,true) or animator.KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_walk_forward_left" :
			if animator.KeyFrame(3,true) or animator.KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_walk_left" :
			if animator.KeyFrame(3,true) or animator.KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_run_forward" :
			if animator.KeyFrame(0,true) or animator.KeyFrame(3,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_run_forward_left" :
			if animator.KeyFrame(0,true) or animator.KeyFrame(3,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.animation_name == "aim_run_left" :
			if animator.KeyFrame(0,true) or animator.KeyFrame(3,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
