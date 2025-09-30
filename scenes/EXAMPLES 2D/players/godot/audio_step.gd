extends AudioStreamPlayer2D


@export var player:Node2D
@export var animator :AnimatorController


func AudioStep():
	if animator.current_clip != null:
		if animator.current_clip.get_name() == "walk_standing" :
			if animator.clip_library["walk_standing"].KeyFrame(3,true) or animator.clip_library["walk_standing"].KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "walk_crouch" :
			if animator.clip_library["walk_crouch"].KeyFrame(3,true) or animator.clip_library["walk_crouch"].KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
			
		elif animator.current_clip.get_name() == "run_standing" :
			if animator.clip_library["run_standing"].KeyFrame(0,true) or animator.clip_library["run_standing"].KeyFrame(3,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_crouch_forward" :
			if animator.clip_library["aim_crouch_forward"].KeyFrame(3,true) or animator.clip_library["aim_crouch_forward"].KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_crouch_forward_left" :
			if animator.clip_library["aim_crouch_forward_left"].KeyFrame(3,true) or animator.clip_library["aim_crouch_forward_left"].KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_crouch_left" :
			if animator.clip_library["aim_crouch_left"].KeyFrame(3,true) or animator.clip_library["aim_crouch_left"].KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_walk_forward" :
			if animator.clip_library["aim_walk_forward"].KeyFrame(3,true) or animator.clip_library["aim_walk_forward"].KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_walk_forward_left" :
			if animator.clip_library["aim_walk_forward_left"].KeyFrame(3,true) or animator.clip_library["aim_walk_forward_left"].KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_walk_left" :
			if animator.clip_library["aim_walk_left"].KeyFrame(3,true) or animator.clip_library["aim_walk_left"].KeyFrame(7,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_run_forward" :
			if animator.clip_library["aim_run_forward"].KeyFrame(0,true) or animator.clip_library["aim_run_forward"].KeyFrame(3,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_run_forward_left" :
			if animator.clip_library["aim_run_forward_left"].KeyFrame(0,true) or animator.clip_library["aim_run_forward_left"].KeyFrame(3,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
		
		elif animator.current_clip.get_name() == "aim_run_left" :
			if animator.clip_library["aim_run_left"].KeyFrame(0,true) or animator.clip_library["aim_run_left"].KeyFrame(3,true):
				self.pitch_scale = randf_range(0.6,0.8)
				self.play()
