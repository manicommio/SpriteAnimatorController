extends Sprite3D
class_name SpriteProyector3D


@export var animator :AnimatorController = null
@export var shadow : Sprite3D
var texture_color := Color(1,1,1,1)
var billboard_disabled : bool = false
var billboard_Y : bool = false

func _process(_delta: float) ->void:
	if is_instance_valid(animator) and animator != null:
		if animator.current_clip != null:
			billboard_disabled = animator.current_clip.billboard_disabled
			billboard_Y = animator.current_clip.billboard_Y
			if !billboard_disabled:
				if billboard_Y:
					self.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
				else: 
					self.billboard = BaseMaterial3D.BILLBOARD_ENABLED
			else:
				self.billboard = BaseMaterial3D.BILLBOARD_DISABLED
				
			self.hframes = animator.current_clip.tiles_x
			self.vframes = animator.current_clip.tiles_y
			self.flip_h = animator.current_clip.FLIP
			self.texture =  animator.current_clip.GetSpriteSheet()
			#self.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			self.frame_coords = animator.current_clip.frame_coords
			if animator.current_clip.active:
				self.show()
			else:
				self.hide()
			
			if shadow != null:
				shadow.texture =  self.texture
				shadow.hframes = self.hframes
				shadow.vframes = self.vframes
				shadow.flip_h = self.flip_h
				shadow.frame_coords = self.frame_coords
				shadow.billboard = self.billboard
				shadow.axis = 1
				shadow.modulate = Color(00000080)
				shadow.offset = self.offset
				shadow.scale.y = self.scale.y / 2.0
				if animator.current_clip.active:
					self.show()
				else:
					self.hide()
