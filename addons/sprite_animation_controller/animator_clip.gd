class_name AnimatorClip
extends Resource

@export var clip_name :String

@export var spritesheet : Texture = null
## Number of horizontal frames in your sprite sheet
@export var tiles_x := 1
## Number of vertical frames in your sprite sheet
@export var tiles_y := 1
## frame rate
@export var frame_per_second := 24.0
## frame you are on if the animation is playing, or if not;
## if the animation is paused you can specify a frame to project
@export var frame_index := 0
## "true" the animation will play only once, you can play it again using the "PlayAgain()" function, 
## to verify that the animation has stopped see "stopped_clip"
@export var once := false

#______________________________________________________
@export_category("USE ANIMATOR DIRECTION")
## use if your "spritesheet" is configured with "directions"
@export  var use_animator_direction : bool = false 
## Only when using "AnimatorDirection",
## "false" if your "spritesheet" does not contain the full "directions"
@export var sprite_full_directions: bool = true 
## Only when using "AnimatorDirection",
## "true" if your "spritesheet" contains two animations per row
@export var two_directions_per_row : bool = false 
## only when using "AnimatorDirection"
@export var one_frame_per_direction = false 

#______________________________________________________
@export_category("Material3D / Sprite3D")
## only when using a "SpatialMaterial3D" or "Sprite3D"
@export var billboard_disabled : bool = false 
## only when using a "SpatialMaterial3D" or "Sprite3D"
@export var billboard_Y : bool = false 
#______________________________________________________
@export_category("CUSTOM CLIP")
## use as custom clip
@export var use_custom_clip: bool = false 
##
@export var clip_start_frame : int
##
@export var clip_end_frame : int
##
@export var inherit_clip_texture :AnimatorClip = null
##
@export var custom_frame_library :Array[int]
var custom_count :int = 0
#______________________________________________________
@export var EXAMPLE_sprite :NodePath
## Drag a "StandardMaterial3D" from your "MeshInstance3D" to here, or create a new material here and drag it onto your "MeshInstance3D".
## You'll see your "MeshInstance3D" animate instantly. Check "auto_start" if you're not using "AnimatorController"
@export var EXAMPLE_material_3d :StandardMaterial3D 

#_____________________________
var key_frame_list :Array


func _init() -> void:
	#setup_local_to_scene()
	pass
	
func Setup() -> void:
	if key_frame_list.is_empty():
		key_frame_list.resize( tiles_x * tiles_y )
		for i in range(key_frame_list.size()):
			key_frame_list[i] = false


func GetSpriteSheet() -> Texture:
	if inherit_clip_texture == null:
		return spritesheet
	else:
		return inherit_clip_texture.spritesheet
		
