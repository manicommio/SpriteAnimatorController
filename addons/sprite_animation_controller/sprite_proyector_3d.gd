extends Sprite3D
class_name SpriteProyector3D


@export var animator :AnimatorController = null
@export var shadow : Sprite3D
var billboard_disabled : bool = false
var billboard_Y : bool = false

func _process(_delta: float) ->void:
	if is_instance_valid(animator) and animator != null:
		if animator != null:
			billboard_disabled = animator.billboard_disabled
			billboard_Y = animator.billboard_Y
			if !billboard_disabled:
				if billboard_Y:
					self.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
				else: 
					self.billboard = BaseMaterial3D.BILLBOARD_ENABLED
			else:
				self.billboard = BaseMaterial3D.BILLBOARD_DISABLED
				
			if self.texture !=  animator.spritesheet:
				self.texture =  animator.spritesheet
			if self.hframes != animator.tiles_x:
				self.hframes = animator.tiles_x
			if self.vframes != animator.tiles_y:
				self.vframes = animator.tiles_y
			if self.flip_h != animator.FLIP:
				self.flip_h = animator.FLIP
			if self.frame_coords != animator.frame_coords:
				self.frame_coords = animator.frame_coords
			if animator.is_playing:
				if self.visible != true:
					self.visible = true
			else:
				if self.visible != false:
					self.visible = false
			
			if shadow != null:
				if shadow.texture !=  self.texture:
					shadow.texture =  self.texture
				if shadow.hframes != self.hframes:
					shadow.hframes = self.hframes
				if shadow.vframes != self.vframes:
					shadow.vframes = self.vframes
				if shadow.flip_h != self.flip_h:
					shadow.flip_h = self.flip_h
				if shadow.frame_coords != self.frame_coords:
					shadow.frame_coords = self.frame_coords
				if shadow.offset != self.offset:
					shadow.offset = self.offset
				if shadow.offset != self.offset:
					shadow.offset = self.offset
				if shadow.self_modulate != Color("00000080"):
					shadow.self_modulate = Color("00000080")
				if shadow.billboard != self.billboard:
					shadow.billboard = self.billboard
				if shadow.axis != 1:
					shadow.axis = 1
				if shadow.scale.y != self.scale.y / 2.0:
					shadow.scale.y = self.scale.y / 2.0
				if animator.is_playing:
					if shadow.visible != true:
						shadow.visible = true
				else:
					if shadow.visible != false:
						shadow.visible = false
