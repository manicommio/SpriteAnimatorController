class_name  AnimatorController
extends Node


@export var enabled := true
@export_enum(
	"Material 3D:0", 
	"Sprite 2D/3D:1",
) var projector_type :int = 1

@export var auto_start: bool = false
@export var pause_clip: bool = false
@export var play_backward: bool = false
@export var spritesheet : Texture = null
@export var frame_index := 0
@export var FLIP: bool = false
@export_category("USE ANIMATOR DIRECTION")
@export  var animator_direction :AnimatorDirection = null
@export var actor_player_2d :Node2D
@export var actor_player_3d :Node3D
@export var manual_direction :Vector2
@export_category("ANIMATORS CLIPS")
@export var clip_library :Dictionary[String, AnimatorClip] = {}
@export_category("ANIMATORS SPACES")
@export var space_library :Dictionary[String,AnimatorSpace] = {}
@export_category("EXAMPLES")
@export var sprite_2d :Sprite2D = null
@export var sprite_3d :Sprite3D = null
## Drag a "StandardMaterial3D" from your "MeshInstance3D" to here, or create a new material here and drag it onto your "MeshInstance3D".
## You'll see your "MeshInstance3D" animate instantly. Check "auto_start" if you're not using "AnimatorController"
@export var material_3d :StandardMaterial3D = null
#______________________________________________________
var previus_clip :String
var current_clip :String
var current_space :AnimatorSpace = null

var player_2d :Node2D
var target_2d :Node2D
var player_3d :Node3D
var target_3d :Node3D
var animation_name :String
var tiles_x := 1
var tiles_y := 1
var frame_per_second := 24.0
var once := false
var use_animator_direction:bool = false
var sprite_full_directions: bool = true 
var two_directions_per_row : bool = false 
var one_frame_per_direction = false 
var billboard_disabled : bool = false 
var billboard_Y : bool = false 
var use_custom_clip: bool = false 
var clip_start_frame : int
var clip_end_frame : int
var custom_frame_library :Array[int]
var custom_count :int = 0

var index := 0
var lastFrame := 0
var tiempo := 0.0
var frame_coords: Vector2i

enum cardinal_direction {
	X4, X8, X12, X16, X20, X24, X32, X36, X40,
	X48, X64, X80, X96, X100,
	X144
}
var cardinal_equivalent := [4,8,12,16,20,24,32,36,40,48,64,80,96,100,144]
var directions_number = cardinal_direction.X8
var my_orientation := 0
var my_space_orientation := 0
var tiempo_min := 0
var tiempo_max := 0.0
var tiempo_aprox := 0.1
var stopped_clip := false
var is_playing :bool = false
var size := Vector2()
var offset := Vector2()
#_____________________________
var key_frame_list :Array


func _ready() -> void:
	#____________________________________________
	if animator_direction != null:
		IniciarAnimatorDirection()
	#________________________________________________
	if !clip_library.is_empty():
		animation_name = clip_library.keys()[0]
		IniciarLibreria()


func PlayAnimation(new_animation:String) -> void:
	if enabled :
		if clip_library.size()>0:
			if current_clip != new_animation: 
				previus_clip = animation_name
				current_clip = new_animation
				animation_name = new_animation
				Start()
	else:
		if is_processing():
			set_process(false)


func PlayAnimationSpace(space_name:String) -> void:
	if space_library.size()>0:
		current_space = space_library[space_name]
		var space_data:Dictionary = current_space.PlaySpace(self, player_2d, player_3d)
		my_space_orientation = space_data.space_orientation
		PlayAnimation(space_data.animation_name)
		

func IniciarAnimatorDirection() -> void:
	if get_parent() is Node2D:
		animator_direction.tipo_apartado = 0
	else:
		animator_direction.tipo_apartado = 1
		
	match animator_direction.tipo_apartado:
		0:
			var mCamera = get_tree().get_nodes_in_group(animator_direction.actor_target_group)
			if mCamera.size()>0:
				target_2d = mCamera[0]

			if actor_player_2d == null:
				player_2d = get_parent()
			else:
				player_2d = actor_player_2d
		1:
			var mCamera = get_tree().get_nodes_in_group(animator_direction.actor_target_group)
			if mCamera.size()>0:
				target_3d = mCamera[0]

			if actor_player_3d == null:
				player_3d = get_parent()
			else:
				player_3d = actor_player_3d


func IniciarLibreria() ->void:
	tiempo = 0
	stopped_clip = false
	_apply_clip_properties()
	if auto_start:
		Start()
	else:
		Stop()


func Start() -> void:
	is_playing = true
	tiempo = 0
	stopped_clip = false
	_apply_clip_properties() 
	set_process(true)


func Stop() -> void:
	is_playing = false
	set_process(false)
	
	
func _apply_clip_properties() -> void:
	# LECTURA DE PROPIEDADES DEL CLIP (MOVIMIENTO)
	if !clip_library.is_empty():
		clip_library[animation_name].Setup()
		if clip_library[animation_name].spritesheet != null or clip_library[animation_name].inherit_clip_texture != null:
			spritesheet = clip_library[animation_name].GetSpriteSheet()
		
		tiles_x = clip_library[animation_name].tiles_x 
		tiles_y = clip_library[animation_name].tiles_y
		frame_per_second = clip_library[animation_name].frame_per_second 
		once = clip_library[animation_name].once
		use_animator_direction = clip_library[animation_name].use_animator_direction
		sprite_full_directions = clip_library[animation_name].sprite_full_directions
		two_directions_per_row = clip_library[animation_name].two_directions_per_row
		one_frame_per_direction = clip_library[animation_name].one_frame_per_direction
		billboard_disabled = clip_library[animation_name].billboard_disabled
		billboard_Y = clip_library[animation_name].billboard_Y

		use_custom_clip = clip_library[animation_name].use_custom_clip
		clip_start_frame = clip_library[animation_name].clip_start_frame
		clip_end_frame = clip_library[animation_name].clip_end_frame
		custom_frame_library = clip_library[animation_name].custom_frame_library
		key_frame_list = clip_library[animation_name].key_frame_list

		material_3d = clip_library[animation_name].EXAMPLE_material_3d
		if !clip_library[animation_name].EXAMPLE_sprite.is_empty():
			var node = get_node(clip_library[animation_name].EXAMPLE_sprite)
			if node != null:
				if node is Sprite2D:
					if sprite_2d != null:
						if sprite_2d != node:
							sprite_2d.visible = false
							node.visible = true
							sprite_2d = node
						else:
							node.visible = true
							sprite_2d = node
					else:
						node.visible = true
						sprite_2d = node
				
				elif node is Sprite3D:
					if sprite_3d != null:
						if sprite_3d != node:
							sprite_3d.visible = false
							node.visible = true
							sprite_3d = node
						else:
							sprite_3d = node
					else:
						node.visible = true
						sprite_3d = node
		
	# INICIALIZACIÓN DE frame_index (Lógica de inicio o fin del clip)
	if animator_direction != null and use_animator_direction:
		if play_backward:
			frame_index = (tiles_x ) - 1
		else:
			frame_index = 0
	else:
		if use_custom_clip:
			if custom_frame_library.size()>0:
				clip_start_frame = 0
				clip_end_frame = custom_frame_library.size() - 1
				if play_backward:
					frame_index = custom_frame_library[clip_end_frame]
				else:
					frame_index = custom_frame_library[clip_start_frame]
			else:
				if play_backward:
					frame_index = clip_end_frame
				else:
					frame_index = clip_start_frame
		else:
			if play_backward:
				frame_index = (tiles_x * tiles_y ) - 1
			else:
				frame_index = 0

	if projector_type == 0:
		# ... Lógica de lastFrame para Material 3D
		if FLIP:
			var difference = (tiles_x * tiles_y) - cardinal_equivalent[directions_number]
			if (tiles_x * tiles_y) > cardinal_equivalent[directions_number]:
				if (((tiles_x * tiles_y) - difference) - frame_index) < cardinal_equivalent[directions_number]:
					lastFrame = -(((tiles_x * tiles_y) + difference) + frame_index - 1)
				else:
					lastFrame = -((tiles_x * tiles_y)- 1)
		else:
			lastFrame = frame_index + tiles_x
			
	else:
		# ... Lógica de lastFrame para Sprite 2D/3D
		if one_frame_per_direction:
			if FLIP:
				var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
				if (tiles_x * tiles_y) > cardinal_equivalent[directions_number]:
					if ((tiles_x * tiles_y ) - difference ) - frame_index < cardinal_equivalent[directions_number]:
						lastFrame = ((tiles_x * tiles_y ) - difference ) - frame_index
					else:
						lastFrame = 0
				else:
					lastFrame = (tiles_x * tiles_y) - frame_index
			else:
				lastFrame = frame_index
		else:
			lastFrame = frame_index
			
	# 4. CÁLCULO DE COORDENADAS FINALES (index, size, offset)
	if animator_direction != null and use_animator_direction:
		index = int(tiempo_min + lastFrame) % (tiles_x * tiles_y )
	else:
		index = int(lastFrame) % (tiles_x * tiles_y )

	if FLIP:
		size = Vector2(-1.0 / tiles_x, 1.0 / tiles_y)
	else:
		size = Vector2(1.0 / tiles_x, 1.0 / tiles_y)

	var uIndex = index % tiles_x
	var vIndex = float(index) / float(tiles_x)

	if FLIP:
		offset = Vector2( uIndex * -size.x , 1.0 - size.y + int(vIndex) * size.y)
	else:
		offset = Vector2( uIndex * size.x, 1.0 - size.y + int(vIndex) * size.y)

	frame_coords = Vector2(uIndex , int(vIndex))


func _process(delta:float) -> void:
	#if clip_library.is_empty():
		#return
	#__________________________________________________
	if animator_direction != null and use_animator_direction:
		my_orientation = animator_direction.CalculateOrientation(player_2d, target_2d, player_3d, target_3d, manual_direction)
		directions_number = animator_direction.directions_number
		
		if one_frame_per_direction:
			FrameEqualDirectionProcess()
		else:
			AnimationDirectionProcess()

	else:
		if !pause_clip:
			#_________________________________________________
			if once:
				if use_custom_clip:
					if custom_frame_library.size()>0:
						# CUSTOM CLIP MANUAL FRAME ____________
						clip_start_frame = 0
						clip_end_frame = custom_frame_library.size() - 1
						if play_backward:
							tiempo_max =  tiempo_aprox
							if (custom_count ) <= tiempo_max and !stopped_clip:
								stopped_clip = true
								set_process(false)
							else:
								if tiempo >= 1:
									tiempo = 0
									custom_count = wrapi(custom_count - 1, clip_end_frame, clip_start_frame -1)
						else:
							tiempo_max =  (clip_end_frame + 1) - tiempo_aprox
							if (custom_count + tiempo) >= tiempo_max and !stopped_clip:
								stopped_clip = true
								set_process(false)
							else:
								if tiempo >= 1:
									tiempo = 0
									custom_count = wrapi(custom_count + 1, clip_start_frame, clip_end_frame + 1)
						
						frame_index = custom_frame_library[custom_count]
						
					else:
						# CUSTOM CLIP AUTOMATIC _________________
						if play_backward:
							tiempo_max =  tiempo_aprox
							if (frame_index ) <= tiempo_max and !stopped_clip:
								stopped_clip = true
								set_process(false)
							else:
								if tiempo >= 1:
									tiempo = 0
									frame_index = wrapi(frame_index - 1, clip_end_frame, clip_start_frame -1)
						else:
							tiempo_max =  (clip_end_frame + 1) - tiempo_aprox
							if (frame_index + tiempo) >= tiempo_max and !stopped_clip:
								stopped_clip = true
								set_process(false)
							else:
								if tiempo >= 1:
									tiempo = 0
									frame_index = wrapi(frame_index + 1, clip_start_frame, clip_end_frame + 1)
						
				else:
					if play_backward:
						tiempo_max =  tiempo_aprox
						if (frame_index ) <= tiempo_max and !stopped_clip:
							stopped_clip = true
							set_process(false)
						else:
							if tiempo >= 1:
								tiempo = 0
								frame_index = wrapi(frame_index - 1, (tiles_x * tiles_y) - 1, -1 )
					else:
						tiempo_max =  (tiles_x * tiles_y ) - tiempo_aprox
						if (frame_index + tiempo) >= tiempo_max and !stopped_clip:
							stopped_clip = true
							set_process(false)
						else:
							if tiempo >= 1:
								tiempo = 0
								frame_index = wrapi(frame_index + 1, 0, tiles_x * tiles_y )
			#______________________________________________________________
			else:
				if tiempo >= 1:
					tiempo = 0
					if use_custom_clip:
						if custom_frame_library.size()>0:
							# CUSTOM CLIP MANUAL FRAME ____________
							clip_start_frame = 0
							clip_end_frame = custom_frame_library.size()-1
							if play_backward:
								custom_count = wrapi(custom_count - 1, clip_end_frame , clip_start_frame -1 )
							else:
								custom_count = wrapi(custom_count + 1, clip_start_frame , clip_end_frame + 1)

							frame_index = custom_frame_library[custom_count]
						
						else:
							# CUSTOM CLIP AUTOMATIC _________________
							if play_backward:
								frame_index = wrapi(frame_index - 1, clip_end_frame , clip_start_frame -1 )
							else:
								frame_index = wrapi(frame_index + 1, clip_start_frame , clip_end_frame + 1)
						
					else:
						if play_backward:
							frame_index = wrapi(frame_index - 1, (tiles_x * tiles_y ) - 1, -1 )
						else:
							frame_index = wrapi(frame_index + 1, 0.0, tiles_x * tiles_y )
		
		
		#_____________________________________
		if projector_type == 0:
			if FLIP:
				lastFrame = -((tiles_x * tiles_y) - frame_index - 1)
			else:
				lastFrame =  frame_index + tiles_x
		else:
			lastFrame =  frame_index
	
	#____________________________________________
	if !pause_clip:
		tiempo += delta * frame_per_second
	
#	index = int(tiempo) % (tiles_x * tiles_y )
	##########################################
	if animator_direction != null and use_animator_direction:
		index = int(tiempo_min + lastFrame ) % (tiles_x * tiles_y )
	else:
		index = int(lastFrame) % (tiles_x * tiles_y )
	
	if FLIP:
		size = Vector2(-1.0 / tiles_x, 1.0 / tiles_y)
	else:
		size = Vector2(1.0 / tiles_x, 1.0 / tiles_y)
	

	var uIndex = index % tiles_x
	var vIndex =  float(index) / float(tiles_x)
	
	if FLIP:
		offset = Vector2( uIndex * -size.x , 1.0 - size.y + int(vIndex) * size.y)
	else:
		offset = Vector2( uIndex * size.x, 1.0 - size.y + int(vIndex) * size.y)

	frame_coords = Vector2(uIndex , int(vIndex))
	
	#_______________________________________________
	if !clip_library.is_empty():
		if clip_library[animation_name].spritesheet != null:
			if spritesheet != clip_library[animation_name].GetSpriteSheet():
				spritesheet = clip_library[animation_name].GetSpriteSheet()
	#_______________________________________________
	if projector_type == 0:
		if material_3d != null:
			ExampleMaterial3D()
	else:
		if sprite_2d != null:
			ExampleSprite2D()
			
		elif sprite_3d != null:
			ExampleSprite3D()


func FrameEqualDirectionProcess():
	#_____________________________________________
	tiempo_min = 0
	var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
	#_____________________________________________
	if projector_type == 0:
		if FLIP:
			if (tiles_x * tiles_y )  > cardinal_equivalent[directions_number]:
				if  (((tiles_x * tiles_y) - difference) - frame_index  ) < cardinal_equivalent[directions_number]:
					lastFrame = -(((tiles_x * tiles_y) + difference ) + frame_index - 1)
				else:
					lastFrame = -((tiles_x * tiles_y)- 1)
		else:
			lastFrame =  frame_index + tiles_x
	
	else:
		if one_frame_per_direction:
			if FLIP:
				if (tiles_x * tiles_y )  > cardinal_equivalent[directions_number]:
					if ((tiles_x * tiles_y ) - difference ) - frame_index < cardinal_equivalent[directions_number]:
						lastFrame = ((tiles_x * tiles_y ) - difference ) - frame_index
					else:
						lastFrame = 0
				else:
					lastFrame = (tiles_x * tiles_y )  - frame_index 
			else:
				lastFrame =  frame_index
	#____________________________________________
	if !pause_clip:
		if once:
			if tiempo >= 1:
				tiempo = 0
				stopped_clip = true
				set_process(false)
	#____________________________________________
	frame_index = my_orientation
	

func AnimationDirectionProcess() -> void:
	#_________________________________________________________
	if !two_directions_per_row:
		if !pause_clip:
			if once:
				if play_backward:
					tiempo_max = tiempo_aprox
					if (frame_index ) <= tiempo_max:
						stopped_clip = true
						set_process(false)
					else:
						if tiempo >= 1:
							tiempo = 0
							frame_index = wrapi(frame_index - 1, tiles_x-1, -1)
				else:
					tiempo_max = (tiles_x) - tiempo_aprox
					if (frame_index + tiempo) >= tiempo_max:
						stopped_clip = true
						set_process(false)
					else:
						if tiempo >= 1:
							tiempo = 0
							frame_index = wrapi(frame_index + 1, 0, tiles_x)
			else:
				if tiempo >= 1:
					tiempo = 0
					if play_backward:
						frame_index = wrapi(frame_index - 1, tiles_x-1, -1)
					else:
						frame_index = wrapi(frame_index + 1, 0, tiles_x)

		#_______________________________________________________________
		if !sprite_full_directions:
			if my_orientation >= (cardinal_equivalent[directions_number] / 2.0) + 1:
				FLIP = true
			else:
				FLIP = false
		
		if FLIP:
			#____________________________________________
			if my_orientation == 0:
				if projector_type == 0:
					tiempo_min = tiles_x * (my_orientation + 1)
				else:
					tiempo_min = tiles_x * my_orientation
			else:
				if projector_type == 0:
					tiempo_min = tiles_x * ((cardinal_equivalent[directions_number] - my_orientation) + 1)
				else:
					tiempo_min = tiles_x * ( cardinal_equivalent[directions_number] - my_orientation)
				
		else:
			#_________________________________________________
			if projector_type == 0:
				tiempo_min = tiles_x * (my_orientation + 1)
			else:
				tiempo_min = tiles_x * my_orientation
		#_____________________________________
		lastFrame = frame_index
		#____________________________________
	else:
		# ___TWO DIRECTION PER ROW ______________________________
		var total_directions = cardinal_equivalent[directions_number]
		var total_row = total_directions - (total_directions - my_orientation)
		var total_row_flip = total_directions - my_orientation
		var tiles_per_anim = float(tiles_x) / 2.0
		#________________________________________
		if !pause_clip:
			if once:
				if play_backward:
					tiempo_max = tiempo_aprox
					if (frame_index ) <= tiempo_max:
						stopped_clip = true
						set_process(false)
					else:
						if tiempo >= 1:
							tiempo = 0
							frame_index = wrapf(frame_index - 1.0,  (float(tiles_x) / 2.0) - 1.0, -1.0 )
				else:
					tiempo_max = (float(tiles_x) / 2) - tiempo_aprox
					if (frame_index + tiempo) >= tiempo_max:
						stopped_clip = true
						set_process(false)
					else:
						if tiempo >= 1:
							tiempo = 0
							frame_index = wrapf(frame_index + 1.0, 0.0, (float(tiles_x) / 2))
						
			else:
				if tiempo >= 1:
					tiempo = 0

					if play_backward:
						frame_index = wrapf(frame_index - 1.0,  (float(tiles_x) / 2.0) - 1.0, -1.0 )
					else:
						frame_index = wrapf(frame_index + 1.0, 0.0, (float(tiles_x) / 2) )

		#___________________________________________________
		if !sprite_full_directions:
			if my_orientation >= (cardinal_equivalent[directions_number] / 2.0) + 1:
				FLIP = true
			else:
				FLIP = false
		#_______________________________________________
		if FLIP:
			if my_orientation == 0:
				tiempo_min = 0
			else:
				if my_orientation % 2 != 0:
					tiempo_min = (tiles_per_anim * (total_row_flip - 1)) + tiles_per_anim
				else:
					tiempo_min = tiles_per_anim * total_row_flip
		
		else:
			if my_orientation == 0:
				tiempo_min = 0
			else:
				if my_orientation % 2 != 0:
					tiempo_min = (tiles_per_anim * (total_row - 1)) + tiles_per_anim
				else:
					tiempo_min = tiles_per_anim * total_row 
		#___________________________________
		if projector_type == 0:
			if FLIP:
				lastFrame = -((tiles_x * tiles_y) - frame_index - 1)
			else:
				lastFrame =  frame_index + tiles_x
		else:
			lastFrame = frame_index	


## You can check when the animation stops. 
func Finished() ->bool:
	return stopped_clip
	
	
## In this function you can check when a specific frame is playing
func KeyFrame(frame_shoot:int, repeat:bool) -> bool:
	var frame = int(frame_index)
	if frame == (frame_shoot ):
		if !key_frame_list[(frame_shoot )]:
			key_frame_list[(frame_shoot )] = true
			return true
		else:
			if repeat:
				if stopped_clip:
					key_frame_list[(frame_shoot )] = false
			return false
	else:
		key_frame_list[(frame_shoot )] = false
		return false


## to play the animation again
func PlayAgain() -> void:
	stopped_clip = false
	tiempo = 0
	_apply_clip_properties()
	set_process(true)


##
func ExampleSprite2D() ->void:
	if spritesheet  != null:
		if sprite_2d.texture != spritesheet:
			sprite_2d.texture = spritesheet 
	if sprite_2d.hframes != tiles_x:
		sprite_2d.hframes = tiles_x
	if sprite_2d.vframes != tiles_y:
		sprite_2d.vframes = tiles_y
	if sprite_2d.flip_h != FLIP:
		sprite_2d.flip_h = FLIP
	if sprite_2d.frame_coords != frame_coords:
		sprite_2d.frame_coords = frame_coords
	

##
func ExampleSprite3D() ->void:
	if !billboard_disabled:
		if billboard_Y:
			if sprite_3d.billboard != BaseMaterial3D.BILLBOARD_FIXED_Y:
				sprite_3d.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		else: 
			if sprite_3d.billboard != BaseMaterial3D.BILLBOARD_ENABLED:
				sprite_3d.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	else:
		if sprite_3d.billboard != BaseMaterial3D.BILLBOARD_DISABLED:
			sprite_3d.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	
	if sprite_3d.hframes != tiles_x:
		sprite_3d.hframes = tiles_x
	if sprite_3d.vframes != tiles_y:
		sprite_3d.vframes = tiles_y
	if sprite_3d.flip_h != FLIP:
		sprite_3d.flip_h = FLIP
	if spritesheet != null:
		if sprite_3d.texture != spritesheet :
			sprite_3d.texture = spritesheet 

	if sprite_3d.shaded:
		sprite_3d.shaded = false
	if sprite_3d.frame_coords != frame_coords:
		sprite_3d.frame_coords = frame_coords


##
func ExampleMaterial3D() ->void:
		if !billboard_disabled:
			if billboard_Y:
				if material_3d.billboard_mode != BaseMaterial3D.BILLBOARD_FIXED_Y:
					material_3d.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
			else: 
				if material_3d.billboard_mode != BaseMaterial3D.BILLBOARD_ENABLED:
					material_3d.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
		else:
			if material_3d.billboard_mode != BaseMaterial3D.BILLBOARD_DISABLED:
				material_3d.billboard_mode = BaseMaterial3D.BILLBOARD_DISABLED
		
		if material_3d.billboard_keep_scale != true:
			material_3d.billboard_keep_scale = true
		var uv_escala = size
		var off_set = offset
		if material_3d.albedo_texture != spritesheet:
			material_3d.albedo_texture = spritesheet
		if material_3d.get("uv1_scale") != Vector3(uv_escala.x ,uv_escala.y,0):
			material_3d.set("uv1_scale", Vector3(uv_escala.x ,uv_escala.y,0))
		if material_3d.get("uv1_offset") != Vector3(off_set.x, off_set.y,0):
			material_3d.set("uv1_offset", Vector3(off_set.x, off_set.y,0))


func Activate(value:bool) ->void:
	enabled = value
	if !enabled:
		current_clip = ""
		Stop()
