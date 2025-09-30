extends Sprite2D
class_name SpriteProyector2D


@export var animator :AnimatorController = null
@export var shadow : Sprite2D
var texture_color := Color(1,1,1,1)


func _process(_delta: float) ->void:
	if is_instance_valid(animator) and animator != null:
		if animator.current_clip != null:
			self.texture =  animator.current_clip.GetSpriteSheet()
			self.hframes = animator.current_clip.tiles_x
			self.vframes = animator.current_clip.tiles_y
			self.flip_h = animator.current_clip.FLIP
			self.frame_coords = animator.current_clip.frame_coords

			
			if shadow != null:
				shadow.texture =  self.texture
				shadow.hframes = self.hframes
				shadow.vframes = self.vframes
				shadow.flip_h = self.flip_h
				shadow.frame_coords = self.frame_coords
				shadow.offset = self.offset
				shadow.scale = Vector2(self.scale.x,  self.scale.y / 2.0)
				shadow.skew = 45.0
				shadow.self_modulate = Color("00000080")
