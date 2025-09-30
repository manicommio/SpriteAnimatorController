extends Sprite2D


@export var animator :AnimatorController = null
@export var sprite_shield_L: Sprite2D
@export var sprite_shield_R: Sprite2D
var texture_color := Color(1,1,1,1)

@export var idle :Array[Texture]
@export var walk :Array[Texture]
@export var pain :Array[Texture]
@export var heavy_damage :Array[Texture]
@export var fire :Array[Texture]
@export var looking_left :Array[Texture]
@export var looking_right :Array[Texture]
@export var turn_left :Array[Texture]
@export var turn_right :Array[Texture]


func _process(_delta: float) ->void:
	if is_instance_valid(animator) and animator != null:
		if animator.current_clip != null:
			if sprite_shield_L != null:
				sprite_shield_L.texture =  GetSpriteSheet(animator.current_clip.get_name(), 0)
				sprite_shield_L.hframes = hframes
				sprite_shield_L.vframes = vframes
				sprite_shield_L.flip_h = flip_h
				sprite_shield_L.frame_coords = frame_coords

			
			if sprite_shield_R != null:
				sprite_shield_R.texture =  GetSpriteSheet(animator.current_clip.get_name(), 1)
				sprite_shield_R.hframes = hframes
				sprite_shield_R.vframes = vframes
				sprite_shield_R.flip_h = flip_h
				sprite_shield_R.frame_coords = frame_coords


func GetSpriteSheet(_name_texture:String, _value:int) ->Texture:
	var choise_texture :Texture = null
	if _name_texture in self:
		choise_texture = get(_name_texture)[_value]
	
	return choise_texture
