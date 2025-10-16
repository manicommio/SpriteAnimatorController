extends Node
class_name  AnimatorClip

## select the type of material or node to animate
@export_enum(
	"Material 3D:0", 
	"Sprite 2D/3D:1",
) var projector_type :int = 1
## "true" plays the animation immediately without the need for an "AnimatorController",
## to see your animation try the examples in the "EXAMPLES" section in the node properties
@export var auto_start: bool = false
## "false" the animation will pause. "true" to play
@export var pause_clip: bool = false
## "true" the reproduction will be reverse
@export var play_backward: bool = false

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
## flip in horizontal the animation
@export var FLIP: bool = false

#______________________________________________________
@export_category("USE ANIMATOR DIRECTION")
## use if your "spritesheet" is configured with "directions"
@export  var animator_direction :AnimatorDirection = null
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
@export var inherit_clip_texture :AnimatorClip
##
@export var custom_frame_library :Array[int]
var custom_count :int = 0
#______________________________________________________
@export_category("EXAMPLES")
## Drag a "Sprite2D" node here and you'll see your animation play instantly.
## Check "auto_start" if you're not using "AnimatorController"
@export var sprite_2d :Sprite2D 
## Drag a "Sprite3D" node here and you'll see your animation play instantly.
## Check "auto_start" if you're not using "AnimatorController"
@export var sprite_3d :Sprite3D 
## Drag a "StandardMaterial3D" from your "MeshInstance3D" to here, or create a new material here and drag it onto your "MeshInstance3D".
## You'll see your "MeshInstance3D" animate instantly. Check "auto_start" if you're not using "AnimatorController"
@export var material_3d :StandardMaterial3D 

var index := 0
var lastFrame := 0
var tiempo := 0.0
var frame_coords: Vector2

enum cardinal_direction {
	X8,	X12, X16, X20, X24, X32, X36, X40,
	X48, X64, X80, X96, X100,
	X144
}
var cardinal_equivalent := [8,12,16,20,24,32,36,40,48,64,80,96,100,144]

var animation_direction : Node = null
var directions_number = cardinal_direction.X8

enum cardinal1 {south, south_west, west, north_west, north, north_east, east, south_east}

enum cardinal2 {
	south, south_west1, south_west2, 
	west, north_west1, north_west2,
	north, north_east1, north_east2,
	east, south_east1, south_east2
}
enum cardinal3 {
	south, south_west1, south_west2, south_west3,
	west, north_west1, north_west2, north_west3,
	north, north_east1, north_east2, north_east3,
	east, south_east1, south_east2, south_east3
}
enum cardinal4 {
	south, south_west1, south_west2, south_west3, south_west4,
	west, north_west1, north_west2, north_west3, north_west4,
	north, north_east1, north_east2, north_east3, north_east4,
	east, south_east1, south_east2, south_east3, south_east4
}
enum cardinal5 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5,
	west, north_west1, north_west2, north_west3, north_west4, north_west5,
	north, north_east1, north_east2, north_east3, north_east4, north_east5,
	east, south_east1, south_east2, south_east3, south_east4, south_east5
}
enum cardinal6 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7
}
enum cardinal7 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7, south_west8,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, north_west8,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, north_east8,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, south_east8,
}
enum cardinal8 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7, south_west8, south_west9,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, north_west8, north_west9,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, north_east8, north_east9,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, south_east8, south_east9,
}
#___________ X48______________________

#___________ X64______________________
enum cardinal11 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7,
	south_west8, south_west9, south_west10, south_west11, south_west12, south_west13, south_west14, south_west15,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, 
	north_west8, north_west9, north_west10, north_west11, north_west12, north_west13, north_west14, north_west15,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, 
	north_east8, north_east9, north_east10, north_east11, north_east12, north_east13, north_east14, north_east15,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, 
	south_east8, south_east9, south_east10, south_east11, south_east12, south_east13, south_east14, south_east15
}

var my_orientation := 0

var tiempo_min := 0.0
var tiempo_max := 0.0
var tiempo_aprox := 0.1
var stopped_clip := false

var active :bool = false
var size := Vector2()
var offset := Vector2()
#_____________________________
var key_frame_list :Array


func _ready() -> void:
	if animator_direction != null:
		animation_direction = animator_direction
		directions_number = animation_direction.directions_number
	
	key_frame_list.resize( tiles_x * tiles_y )
	for i in range(key_frame_list.size()):
		key_frame_list[i] = false

	Iniciar()


func Iniciar() -> void:
	tiempo = 0
	stopped_clip = false
	#____________________________________________________
	if animation_direction != null:
		if play_backward:
			frame_index = (tiles_x ) - 1
		else:
			frame_index = 0.0
	else:
		if use_custom_clip:
			if custom_frame_library.size()>0:
				# CUSTOM CLIP MANUAL FRAME ____________
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
				frame_index = 0.0
	
	#_____________________________________________
	if projector_type == 0:
		if FLIP:
			var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
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
				var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
				if (tiles_x * tiles_y )  > cardinal_equivalent[directions_number]:
					if ((tiles_x * tiles_y ) - difference ) - frame_index < cardinal_equivalent[directions_number]:
						lastFrame = ((tiles_x * tiles_y ) - difference ) - frame_index
					else:
						lastFrame = 0
				else:
					lastFrame = (tiles_x * tiles_y )  - frame_index 
			else:
				lastFrame =  frame_index
		else:
			lastFrame =  frame_index
	#______________________________________________
		
	##########################################
	if animation_direction != null:
		index = int(tiempo_min + lastFrame) % (tiles_x * tiles_y )
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
	
	if auto_start:
		Start()
	else:
		Stop()
	

func Start() -> void:
	active = true
	tiempo = 0
	stopped_clip = false
	#_______________________________________________________
	if animation_direction != null:
		if play_backward:
			frame_index = (tiles_x ) - 1
		else:
			frame_index = 0.0
	else:
		if use_custom_clip:
			if custom_frame_library.size()>0:
				# CUSTOM CLIP MANUAL FRAME ____________
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
				frame_index = 0.0

	#_____________________________________________
	if projector_type == 0:
		if FLIP:
			var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
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
				var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
				if (tiles_x * tiles_y )  > cardinal_equivalent[directions_number]:
					if ((tiles_x * tiles_y ) - difference ) - frame_index < cardinal_equivalent[directions_number]:
						lastFrame = ((tiles_x * tiles_y ) - difference ) - frame_index
					else:
						lastFrame = 0
				else:
					lastFrame = (tiles_x * tiles_y )  - frame_index 
			else:
				lastFrame =  frame_index
		else:
			lastFrame =  frame_index
	#______________________________________________
	##########################################
	if animation_direction != null:
		index = int(tiempo_min + lastFrame) % (tiles_x * tiles_y )
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

	set_process(true)


func Stop() -> void:
	active = false
	set_process(false)


func _process(delta:float) -> void:
	#__________________________________________________
	if animation_direction != null:
		my_orientation = animation_direction.CalculateOrientation()
		directions_number = animation_direction.directions_number
		
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
	if animation_direction != null:
		if FLIP:
			index = int(tiempo_min + lastFrame) % (tiles_x * tiles_y )
		else:
			index = int(tiempo_min + lastFrame) % (tiles_x * tiles_y )
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
	if projector_type == 0:
		if material_3d != null:
			ExampleMaterial3D()
	else:
		if sprite_2d != null:
			ExampleSprite2D()
		if sprite_3d != null:
			ExampleSprite3D()


func FrameEqualDirectionProcess():
	#_____________________________________________
	frame_index = my_orientation
	#_____________________________________________
	if projector_type == 0:
		if FLIP:
			var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
			if (tiles_x * tiles_y )  > cardinal_equivalent[directions_number]:
				if  (((tiles_x * tiles_y) - difference) - frame_index  ) < cardinal_equivalent[directions_number]:
					lastFrame = -(((tiles_x * tiles_y) + difference ) + frame_index - 1)
				else:
					lastFrame = -((tiles_x * tiles_y)- 1)
		else:
			lastFrame =  frame_index + tiles_x
	
	else:
		if FLIP:
			var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
			if (tiles_x * tiles_y )  > cardinal_equivalent[directions_number]:
				if ((tiles_x * tiles_y ) - difference ) - frame_index < cardinal_equivalent[directions_number]:
					lastFrame = ((tiles_x * tiles_y ) - difference ) - frame_index
				else:
					lastFrame = 0
			else:
				lastFrame = (tiles_x * tiles_y )  - frame_index 
		else:
			lastFrame =  frame_index
	#______________________________________________
	if !pause_clip:
		if once:
			if tiempo >= 1:
				tiempo = 0
				stopped_clip = true
				set_process(false)
				

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
		lastFrame = frame_index
		
		
		match directions_number:
			#__________________________________________________
			# X8 ______________________________________________
			cardinal_direction.X8:
				if !sprite_full_directions:
					if my_orientation >= 5:
						FLIP = true
					else:
						FLIP = false
				
				if FLIP:
					match my_orientation:
						cardinal1.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0
							
						cardinal1.south_west:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7

						cardinal1.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6

						cardinal1.north_west:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal1.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4
						
						cardinal1.north_east:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3

						cardinal1.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2

						cardinal1.south_east:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1

				else:
					match my_orientation:
						cardinal1.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0

						cardinal1.south_west:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1

						cardinal1.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2

						cardinal1.north_west:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3
							
						cardinal1.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4
						
						cardinal1.north_east:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5
							
						cardinal1.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6

						cardinal1.south_east:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7
			
			#_______________________________________________
			# X12 __________________________________________
			cardinal_direction.X12:
				if !sprite_full_directions:
					if my_orientation >= 7:
						FLIP = true
					else:
						FLIP = false

				if FLIP:
					match my_orientation:
						cardinal2.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0

						cardinal2.south_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 12
							else:
								tiempo_min = tiles_x * 11
						
						cardinal2.south_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 11
							else:
								tiempo_min = tiles_x * 10

						cardinal2.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 10
							else:
								tiempo_min = tiles_x * 9

						cardinal2.north_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 9
							else:
								tiempo_min = tiles_x * 8

						cardinal2.north_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7

						cardinal2.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6

						cardinal2.north_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal2.north_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4

						cardinal2.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3

						cardinal2.south_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2

						cardinal2.south_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1
							
				else:
					match my_orientation:
						cardinal2.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0
							
						cardinal2.south_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1
						
						cardinal2.south_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2

						cardinal2.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3

						cardinal2.north_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4

						cardinal2.north_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal2.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6

						cardinal2.north_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7

						cardinal2.north_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 9
							else:
								tiempo_min = tiles_x * 8

						cardinal2.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 10
							else:
								tiempo_min = tiles_x * 9

						cardinal2.south_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 11
							else:
								tiempo_min = tiles_x * 10

						cardinal2.south_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 12
							else:
								tiempo_min = tiles_x * 11
			
			#____________________________________________________
			# X16 _______________________________________________
			cardinal_direction.X16:
				if !sprite_full_directions:
					if my_orientation >= 9:
						FLIP = true
					else:
						FLIP = false

				if FLIP:
					match my_orientation:
						cardinal3.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0

						cardinal3.south_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 16
							else:
								tiempo_min = tiles_x * 15
						
						cardinal3.south_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 15
							else:
								tiempo_min = tiles_x * 14
						
						cardinal3.south_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 14
							else:
								tiempo_min = tiles_x * 13

						cardinal3.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 13
							else:
								tiempo_min = tiles_x * 12

						cardinal3.north_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 12
							else:
								tiempo_min = tiles_x * 11

						cardinal3.north_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 11
							else:
								tiempo_min = tiles_x * 10
						
						cardinal3.north_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 10
							else:
								tiempo_min = tiles_x * 9
							
						cardinal3.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 9
							else:
								tiempo_min = tiles_x * 8

						cardinal3.north_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7

						cardinal3.north_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6
						
						cardinal3.north_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal3.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4

						cardinal3.south_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3

						cardinal3.south_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2
						
						cardinal3.south_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1
							
				else:
					match my_orientation:
						cardinal3.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0

						cardinal3.south_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1
						
						cardinal3.south_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2
						
						cardinal3.south_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3

						cardinal3.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4

						cardinal3.north_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal3.north_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6
						
						cardinal3.north_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7
							
						cardinal3.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 9
							else:
								tiempo_min = tiles_x * 8

						cardinal3.north_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 10
							else:
								tiempo_min = tiles_x * 9

						cardinal3.north_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 11
							else:
								tiempo_min = tiles_x * 10
						
						cardinal3.north_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 12
							else:
								tiempo_min = tiles_x * 11

						cardinal3.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 13
							else:
								tiempo_min = tiles_x * 12

						cardinal3.south_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 14
							else:
								tiempo_min = tiles_x * 13

						cardinal3.south_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 15
							else:
								tiempo_min = tiles_x * 14
						
						cardinal3.south_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 16
							else:
								tiempo_min = tiles_x * 15
			
			#______________________________________________
			# X20 _________________________________________
			cardinal_direction.X20:

				if !sprite_full_directions:
					if my_orientation >= 11:
						FLIP = true
					else:
						FLIP = false

				if FLIP:
					match my_orientation:
						cardinal4.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0

						cardinal4.south_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 20
							else:
								tiempo_min = tiles_x * 19
						
						cardinal4.south_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 19
							else:
								tiempo_min = tiles_x * 18
						
						cardinal4.south_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 18
							else:
								tiempo_min = tiles_x * 17
								
						cardinal4.south_west4:
							if projector_type == 0:
								tiempo_min = tiles_x * 17
							else:
								tiempo_min = tiles_x * 16

						cardinal4.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 16
							else:
								tiempo_min = tiles_x * 15

						cardinal4.north_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 15
							else:
								tiempo_min = tiles_x * 14

						cardinal4.north_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 14
							else:
								tiempo_min = tiles_x * 13
						
						cardinal4.north_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 13
							else:
								tiempo_min = tiles_x * 12
						
						cardinal4.north_west4:
							if projector_type == 0:
								tiempo_min = tiles_x * 12
							else:
								tiempo_min = tiles_x * 11
							
						cardinal4.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 11
							else:
								tiempo_min = tiles_x * 10

						cardinal4.north_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 10
							else:
								tiempo_min = tiles_x * 9

						cardinal4.north_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 9
							else:
								tiempo_min = tiles_x * 8
						
						cardinal4.north_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7
						
						cardinal4.north_east4:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6

						cardinal4.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal4.south_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4

						cardinal4.south_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3
						
						cardinal4.south_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2
						
						cardinal4.south_east4:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1
							
				else:
					match my_orientation:
						cardinal4.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0

						cardinal4.south_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1
						
						cardinal4.south_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2
						
						cardinal4.south_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3
								
						cardinal4.south_west4:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4

						cardinal4.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal4.north_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6

						cardinal4.north_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7
						
						cardinal4.north_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 9
							else:
								tiempo_min = tiles_x * 8
						
						cardinal4.north_west4:
							if projector_type == 0:
								tiempo_min = tiles_x * 10
							else:
								tiempo_min = tiles_x * 9
							
						cardinal4.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 11
							else:
								tiempo_min = tiles_x * 10

						cardinal4.north_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 12
							else:
								tiempo_min = tiles_x * 11

						cardinal4.north_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 13
							else:
								tiempo_min = tiles_x * 12
						
						cardinal4.north_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 14
							else:
								tiempo_min = tiles_x * 13
						
						cardinal4.north_east4:
							if projector_type == 0:
								tiempo_min = tiles_x * 15
							else:
								tiempo_min = tiles_x * 14

						cardinal4.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 16
							else:
								tiempo_min = tiles_x * 15

						cardinal4.south_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 17
							else:
								tiempo_min = tiles_x * 16

						cardinal4.south_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 18
							else:
								tiempo_min = tiles_x * 17
						
						cardinal4.south_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 19
							else:
								tiempo_min = tiles_x * 18
						
						cardinal4.south_east4:
							if projector_type == 0:
								tiempo_min = tiles_x * 20
							else:
								tiempo_min = tiles_x * 19
			
			#___________________________________________________
			# X24 ______________________________________________
			cardinal_direction.X24:
				if !sprite_full_directions:
					if my_orientation >= 13:
						FLIP = true
					else:
						FLIP = false

				if FLIP:
					match my_orientation:
						cardinal5.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0

						cardinal5.south_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 24
							else:
								tiempo_min = tiles_x * 23
						
						cardinal5.south_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 23
							else:
								tiempo_min = tiles_x * 22
						
						cardinal5.south_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 22
							else:
								tiempo_min = tiles_x * 21
								
						cardinal5.south_west4:
							if projector_type == 0:
								tiempo_min = tiles_x * 21
							else:
								tiempo_min = tiles_x * 20
						
						cardinal5.south_west5:
							if projector_type == 0:
								tiempo_min = tiles_x * 20
							else:
								tiempo_min = tiles_x * 19

						cardinal5.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 19
							else:
								tiempo_min = tiles_x * 18

						cardinal5.north_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 18
							else:
								tiempo_min = tiles_x * 17

						cardinal5.north_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 17
							else:
								tiempo_min = tiles_x * 16
						
						cardinal5.north_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 16
							else:
								tiempo_min = tiles_x * 15
						
						cardinal5.north_west4:
							if projector_type == 0:
								tiempo_min = tiles_x * 15
							else:
								tiempo_min = tiles_x * 14
						
						cardinal5.north_west5:
							if projector_type == 0:
								tiempo_min = tiles_x * 14
							else:
								tiempo_min = tiles_x * 13
							
						cardinal5.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 13
							else:
								tiempo_min = tiles_x * 12

						cardinal5.north_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 12
							else:
								tiempo_min = tiles_x * 11

						cardinal5.north_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 11
							else:
								tiempo_min = tiles_x * 10
						
						cardinal5.north_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 10
							else:
								tiempo_min = tiles_x * 9
						
						cardinal5.north_east4:
							if projector_type == 0:
								tiempo_min = tiles_x * 9
							else:
								tiempo_min = tiles_x * 8
						
						cardinal5.north_east5:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7

						cardinal5.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6

						cardinal5.south_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal5.south_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4
						
						cardinal5.south_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3
						
						cardinal5.south_east4:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2
								
						cardinal5.south_east5:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1
							
				else:
					match my_orientation:
						cardinal5.south:
							if projector_type == 0:
								tiempo_min = tiles_x * 1
							else:
								tiempo_min = tiles_x * 0

						cardinal5.south_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 2
							else:
								tiempo_min = tiles_x * 1
						
						cardinal5.south_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 3
							else:
								tiempo_min = tiles_x * 2
						
						cardinal5.south_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 4
							else:
								tiempo_min = tiles_x * 3
								
						cardinal5.south_west4:
							if projector_type == 0:
								tiempo_min = tiles_x * 5
							else:
								tiempo_min = tiles_x * 4
						
						cardinal5.south_west5:
							if projector_type == 0:
								tiempo_min = tiles_x * 6
							else:
								tiempo_min = tiles_x * 5

						cardinal5.west:
							if projector_type == 0:
								tiempo_min = tiles_x * 7
							else:
								tiempo_min = tiles_x * 6

						cardinal5.north_west1:
							if projector_type == 0:
								tiempo_min = tiles_x * 8
							else:
								tiempo_min = tiles_x * 7

						cardinal5.north_west2:
							if projector_type == 0:
								tiempo_min = tiles_x * 9
							else:
								tiempo_min = tiles_x * 8
						
						cardinal5.north_west3:
							if projector_type == 0:
								tiempo_min = tiles_x * 10
							else:
								tiempo_min = tiles_x * 9
						
						cardinal5.north_west4:
							if projector_type == 0:
								tiempo_min = tiles_x * 11
							else:
								tiempo_min = tiles_x * 10
						
						cardinal5.north_west5:
							if projector_type == 0:
								tiempo_min = tiles_x * 12
							else:
								tiempo_min = tiles_x * 11
							
						cardinal5.north:
							if projector_type == 0:
								tiempo_min = tiles_x * 13
							else:
								tiempo_min = tiles_x * 12

						cardinal5.north_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 14
							else:
								tiempo_min = tiles_x * 13

						cardinal5.north_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 15
							else:
								tiempo_min = tiles_x * 14
						
						cardinal5.north_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 16
							else:
								tiempo_min = tiles_x * 15
						
						cardinal5.north_east4:
							if projector_type == 0:
								tiempo_min = tiles_x * 17
							else:
								tiempo_min = tiles_x * 16
						
						cardinal5.north_east5:
							if projector_type == 0:
								tiempo_min = tiles_x * 18
							else:
								tiempo_min = tiles_x * 17

						cardinal5.east:
							if projector_type == 0:
								tiempo_min = tiles_x * 19
							else:
								tiempo_min = tiles_x * 18

						cardinal5.south_east1:
							if projector_type == 0:
								tiempo_min = tiles_x * 20
							else:
								tiempo_min = tiles_x * 19

						cardinal5.south_east2:
							if projector_type == 0:
								tiempo_min = tiles_x * 21
							else:
								tiempo_min = tiles_x * 20
						
						cardinal5.south_east3:
							if projector_type == 0:
								tiempo_min = tiles_x * 22
							else:
								tiempo_min = tiles_x * 21
						
						cardinal5.south_east4:
							if projector_type == 0:
								tiempo_min = tiles_x * 23
							else:
								tiempo_min = tiles_x * 22
								
						cardinal5.south_east5:
							if projector_type == 0:
								tiempo_min = tiles_x * 24
							else:
								tiempo_min = tiles_x * 23
		
	# ___TWO DIRECTION PER ROW ______________________________
	else:
		#___________________________________
		if projector_type == 0:
			if FLIP:
				lastFrame = -((tiles_x * tiles_y) - frame_index - 1)
			else:
				lastFrame =  frame_index + tiles_x
		else:
			lastFrame = frame_index
		
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


		match directions_number:
			#___________________________________________________________________
			#_________________ X 8 ____________________________________________
			#___________________________________________________________________
			cardinal_direction.X8:
				if !sprite_full_directions:
					if my_orientation >= 5:
						FLIP = true
					else:
						FLIP = false

				if FLIP:
					match my_orientation:
						cardinal1.south:
							tiempo_min = (float(tiles_x) / 2) * 0
							
						cardinal1.south_west:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)
						
						cardinal1.west:
							tiempo_min = ((float(tiles_x) / 2) * 6)

						cardinal1.north_west:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)

						cardinal1.north:
							tiempo_min = (float(tiles_x) / 2) * 4

						cardinal1.north_east:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)

						cardinal1.east:
							tiempo_min =  ((float(tiles_x) / 2) * 2) 

						cardinal1.south_east:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
							
				else: ############################## else ###########################################

					match my_orientation:
						cardinal1.south:
							tiempo_min = (float(tiles_x) / 2) * 0
							
						cardinal1.south_west:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						
						cardinal1.west:
							tiempo_min = ((float(tiles_x) / 2) * 2)

						cardinal1.north_west:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)

						cardinal1.north:
							tiempo_min = (float(tiles_x) / 2) * 4

						cardinal1.north_east:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)

						cardinal1.east:
							tiempo_min =  ((float(tiles_x) / 2) * 6) 

						cardinal1.south_east:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)
			
			#___________________________________________________________________
			#_________________ X 12 ____________________________________________
			#___________________________________________________________________
			cardinal_direction.X12:
				if !sprite_full_directions:
					if my_orientation >= 7:
						FLIP = true
					else:
						FLIP = false

				if FLIP:
					match my_orientation:
						cardinal2.south:
							tiempo_min = (float(tiles_x) / 2) * 0
							
						cardinal2.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)
						
						cardinal2.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 10
						
						cardinal2.west:
							tiempo_min = ((float(tiles_x) / 2) * 8) + (float(tiles_x) / 2)

						cardinal2.north_west1:
							tiempo_min = (float(tiles_x) / 2) * 8

						cardinal2.north_west2:
							tiempo_min =  ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)
						
						cardinal2.north:
							tiempo_min = (float(tiles_x) / 2) * 6

						cardinal2.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)

						cardinal2.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 4
						
						cardinal2.east:
							tiempo_min =  ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)

						cardinal2.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 2) 

						cardinal2.south_east2:
							tiempo_min =  ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
							
				else: ############################## else ###########################################

					match my_orientation:
						cardinal2.south:
							tiempo_min = (float(tiles_x) / 2) * 0
							
						cardinal2.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						
						cardinal2.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 2
						
						cardinal2.west:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)

						cardinal2.north_west1:
							tiempo_min = (float(tiles_x) / 2) * 4

						cardinal2.north_west2:
							tiempo_min =  ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)
						
						cardinal2.north:
							tiempo_min = (float(tiles_x) / 2) * 6

						cardinal2.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)

						cardinal2.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 8
						
						cardinal2.east:
							tiempo_min =  ((float(tiles_x) / 2) * 8) + (float(tiles_x) / 2)

						cardinal2.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 10) 

						cardinal2.south_east2:
							tiempo_min =  ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)
						
			#___________________________________________________________________
			#_________________ X 16 ____________________________________________
			#___________________________________________________________________
			cardinal_direction.X16:
				if !sprite_full_directions:
					if my_orientation >= 9:
						FLIP = true
					else:
						FLIP = false
					
				if FLIP:
					match my_orientation:
						cardinal3.south:
							tiempo_min = (float(tiles_x) / 2) * 0
							
						cardinal3.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2) 
						
						cardinal3.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 14
						
						cardinal3.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 12 ) + (float(tiles_x) / 2)

						cardinal3.west:
							tiempo_min = (float(tiles_x) / 2) * 12

						cardinal3.north_west1:
							tiempo_min = ((float(tiles_x) / 2) * 10 ) + (float(tiles_x) / 2) 

						cardinal3.north_west2:
							tiempo_min = (float(tiles_x) / 2) * 10
						
						cardinal3.north_west3:
							tiempo_min = ((float(tiles_x) / 2) * 8 ) + (float(tiles_x) / 2) 
							
						cardinal3.north:
							tiempo_min = (float(tiles_x) / 2) * 8

						cardinal3.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 6 ) + (float(tiles_x) / 2) 

						cardinal3.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 6
						
						cardinal3.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 4 ) + (float(tiles_x) / 2) 

						cardinal3.east:
							tiempo_min = (float(tiles_x) / 2) * 4

						cardinal3.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 2 ) + (float(tiles_x) / 2)

						cardinal3.south_east2:
							tiempo_min = (float(tiles_x) / 2) * 2
						
						cardinal3.south_east3:
							tiempo_min = ((float(tiles_x) / 2) * 0 ) + (float(tiles_x) / 2)
							
				else: ############################## else ###########################################
					match my_orientation:
						cardinal3.south:
							tiempo_min = (float(tiles_x) / 2) * 0
							
						cardinal3.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						
						cardinal3.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 2
						
						cardinal3.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)

						cardinal3.west:
							tiempo_min = (float(tiles_x) / 2) * 4

						cardinal3.north_west1:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)

						cardinal3.north_west2:
							tiempo_min = (float(tiles_x) / 2) * 6
						
						cardinal3.north_west3:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)
							
						cardinal3.north:
							tiempo_min = (float(tiles_x) / 2) * 8

						cardinal3.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 8) + (float(tiles_x) / 2)

						cardinal3.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 10
						
						cardinal3.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)

						cardinal3.east:
							tiempo_min = (float(tiles_x) / 2) * 12

						cardinal3.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 12) + (float(tiles_x) / 2)

						cardinal3.south_east2:
							tiempo_min = (float(tiles_x) / 2) * 14
						
						cardinal3.south_east3:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2)
			
			#___________________________________________________________________
			#_________________ X 20 ____________________________________________
			#___________________________________________________________________
			cardinal_direction.X20:
				if !sprite_full_directions:
					if my_orientation >= 11:
						FLIP = true
					else:
						FLIP = false
				

				if FLIP:
					match my_orientation:
						cardinal4.south:
							tiempo_min = (float(tiles_x) / 2) * 0
						cardinal4.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 18) + (float(tiles_x) / 2)
						cardinal4.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 18
						cardinal4.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 16) + (float(tiles_x) / 2)
						cardinal4.south_west4:
							tiempo_min = (float(tiles_x) / 2) * 16
							

						cardinal4.west:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2)
						cardinal4.north_west1:
							tiempo_min = (float(tiles_x) / 2) * 14
						cardinal4.north_west2:
							tiempo_min = ((float(tiles_x) / 2) * 12) + (float(tiles_x) / 2)
						cardinal4.north_west3:
							tiempo_min = (float(tiles_x) / 2) * 12
						cardinal4.north_west4:
							tiempo_min = ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)
							
						cardinal4.north:
							tiempo_min = (float(tiles_x) / 2) * 10
						cardinal4.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 8) + (float(tiles_x) / 2)
						cardinal4.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 8
						cardinal4.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)
						cardinal4.north_east4:
							tiempo_min = (float(tiles_x) / 2) * 6

						cardinal4.east:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)
						cardinal4.south_east1:
							tiempo_min = (float(tiles_x) / 2) * 4
						cardinal4.south_east2:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)
						cardinal4.south_east3:
							tiempo_min = (float(tiles_x) / 2) * 2
						cardinal4.south_east4:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
							
				else: ############################## else ###########################################
					match my_orientation:
						cardinal4.south:
							tiempo_min = (float(tiles_x) / 2) * 0
						cardinal4.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						cardinal4.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 2
						cardinal4.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)
						cardinal4.south_west4:
							tiempo_min = (float(tiles_x) / 2) * 4
							

						cardinal4.west:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)
						cardinal4.north_west1:
							tiempo_min = (float(tiles_x) / 2) * 6
						cardinal4.north_west2:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)
						cardinal4.north_west3:
							tiempo_min = (float(tiles_x) / 2) * 8
						cardinal4.north_west4:
							tiempo_min = ((float(tiles_x) / 2) * 8) + (float(tiles_x) / 2)
							
						cardinal4.north:
							tiempo_min = (float(tiles_x) / 2) * 10
						cardinal4.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)
						cardinal4.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 12
						cardinal4.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 12) + (float(tiles_x) / 2)
						cardinal4.north_east4:
							tiempo_min = (float(tiles_x) / 2) * 14

						cardinal4.east:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2)
						cardinal4.south_east1:
							tiempo_min = (float(tiles_x) / 2) * 16
						cardinal4.south_east2:
							tiempo_min = ((float(tiles_x) / 2) * 16) + (float(tiles_x) / 2)
						cardinal4.south_east3:
							tiempo_min = (float(tiles_x) / 2) * 18
						cardinal4.south_east4:
							tiempo_min = ((float(tiles_x) / 2) * 18) + (float(tiles_x) / 2)

			#___________________________________________________________________
			#_________________ X 24 ____________________________________________
			#___________________________________________________________________
			cardinal_direction.X24:
				if !sprite_full_directions:
					if my_orientation >= 13:
						FLIP = true
					else:
						FLIP = false
				
				
				if FLIP:
					match my_orientation:
						cardinal5.south:
							tiempo_min = (float(tiles_x) / 2) * 0
						cardinal5.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 22) + (float(tiles_x) / 2)
						cardinal5.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 22
						cardinal5.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 20) + (float(tiles_x) / 2)
						cardinal5.south_west4:
							tiempo_min = (float(tiles_x) / 2) * 20
						cardinal5.south_west5:
							tiempo_min = ((float(tiles_x) / 2) * 18) + (float(tiles_x) / 2)

						cardinal5.west:
							tiempo_min = (float(tiles_x) / 2) * 18
						cardinal5.north_west1:
							tiempo_min = ((float(tiles_x) / 2) * 16 )  + (float(tiles_x) / 2)
						cardinal5.north_west2:
							tiempo_min = (float(tiles_x) / 2) * 16
						cardinal5.north_west3:
							tiempo_min = ((float(tiles_x) / 2) * 14)  + (float(tiles_x) / 2)
						cardinal5.north_west4:
							tiempo_min = (float(tiles_x) / 2) * 14
						cardinal5.north_west5:
							tiempo_min = ((float(tiles_x) / 2) * 12) + (float(tiles_x) / 2)
							
						cardinal5.north:
							tiempo_min = (float(tiles_x) / 2) * 12
						cardinal5.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)
						cardinal5.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 10
						cardinal5.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 8) + (float(tiles_x) / 2)
						cardinal5.north_east4:
							tiempo_min = (float(tiles_x) / 2) * 8
						cardinal5.north_east5:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)

						cardinal5.east:
							tiempo_min = (float(tiles_x) / 2) * 6
						cardinal5.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 4)  + (float(tiles_x) / 2)
						cardinal5.south_east2:
							tiempo_min = (float(tiles_x) / 2) * 4
						cardinal5.south_east3:
							tiempo_min = ((float(tiles_x) / 2) * 2)  + (float(tiles_x) / 2)
						cardinal5.south_east4:
							tiempo_min = (float(tiles_x) / 2) * 2
						cardinal5.south_east5:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
							
				else: ############################## else ###########################################
					match my_orientation:
						cardinal5.south:
							tiempo_min = (float(tiles_x) / 2) * 0
						cardinal5.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						cardinal5.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 2
						cardinal5.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)
						cardinal5.south_west4:
							tiempo_min = (float(tiles_x) / 2) * 4
						cardinal5.south_west5:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)

						cardinal5.west:
							tiempo_min = (float(tiles_x) / 2) * 6
						cardinal5.north_west1:
							tiempo_min = ((float(tiles_x) / 2) * 6 )  + (float(tiles_x) / 2)
						cardinal5.north_west2:
							tiempo_min = (float(tiles_x) / 2) * 8
						cardinal5.north_west3:
							tiempo_min = ((float(tiles_x) / 2) * 8)  + (float(tiles_x) / 2)
						cardinal5.north_west4:
							tiempo_min = (float(tiles_x) / 2) * 10
						cardinal5.north_west5:
							tiempo_min = ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)
							
						cardinal5.north:
							tiempo_min = (float(tiles_x) / 2) * 12
						cardinal5.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 12) + (float(tiles_x) / 2)
						cardinal5.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 14
						cardinal5.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2)
						cardinal5.north_east4:
							tiempo_min = (float(tiles_x) / 2) * 16
						cardinal5.north_east5:
							tiempo_min = ((float(tiles_x) / 2) * 16) + (float(tiles_x) / 2)

						cardinal5.east:
							tiempo_min = (float(tiles_x) / 2) * 18
						cardinal5.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 18)  + (float(tiles_x) / 2)
						cardinal5.south_east2:
							tiempo_min = (float(tiles_x) / 2) * 20
						cardinal5.south_east3:
							tiempo_min = ((float(tiles_x) / 2) * 20)  + (float(tiles_x) / 2)
						cardinal5.south_east4:
							tiempo_min = (float(tiles_x) / 2) * 22
						cardinal5.south_east5:
							tiempo_min = ((float(tiles_x) / 2) * 22) + (float(tiles_x) / 2)
			
			#___________________________________________________________________
			#_________________ X 32 ____________________________________________
			#___________________________________________________________________
			cardinal_direction.X32:
				if !sprite_full_directions:
					if my_orientation >= 17:
						FLIP = true
					else:
						FLIP = false

				if FLIP:
					match my_orientation:
						cardinal6.south:
							tiempo_min = (float(tiles_x) / 2) * 0
						cardinal6.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 30) + (float(tiles_x) / 2)
						cardinal6.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 30
						cardinal6.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 28) + (float(tiles_x) / 2)
						cardinal6.south_west4:
							tiempo_min = (float(tiles_x) / 2) * 28
						cardinal6.south_west5:
							tiempo_min = ((float(tiles_x) / 2) * 26) + (float(tiles_x) / 2)
						cardinal6.south_west6:
							tiempo_min = (float(tiles_x) / 2) * 26
						cardinal6.south_west7:
							tiempo_min = ((float(tiles_x) / 2) * 24) + (float(tiles_x) / 2)
							
						cardinal6.west:
							tiempo_min = (float(tiles_x) / 2) * 24
						cardinal6.north_west1:
							tiempo_min = ((float(tiles_x) / 2) * 22 )  + (float(tiles_x) / 2)
						cardinal6.north_west2:
							tiempo_min = (float(tiles_x) / 2) * 22
						cardinal6.north_west3:
							tiempo_min = ((float(tiles_x) / 2) * 20)  + (float(tiles_x) / 2)
						cardinal6.north_west4:
							tiempo_min = (float(tiles_x) / 2) * 20
						cardinal6.north_west5:
							tiempo_min = ((float(tiles_x) / 2) * 18) + (float(tiles_x) / 2)
						cardinal6.north_west6:
							tiempo_min = (float(tiles_x) / 2) * 18
						cardinal6.north_west7:
							tiempo_min = ((float(tiles_x) / 2) * 16) + (float(tiles_x) / 2)
						
							
						cardinal6.north:
							tiempo_min = (float(tiles_x) / 2) * 16
						cardinal6.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2)
						cardinal6.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 14
						cardinal6.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 12) + (float(tiles_x) / 2)
						cardinal6.north_east4:
							tiempo_min = (float(tiles_x) / 2) * 12
						cardinal6.north_east5:
							tiempo_min = ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)
						cardinal6.north_east6:
							tiempo_min = (float(tiles_x) / 2) * 10
						cardinal6.north_east7:
							tiempo_min = ((float(tiles_x) / 2) * 8) + (float(tiles_x) / 2)
						
						cardinal6.east:
							tiempo_min = (float(tiles_x) / 2) * 8
						cardinal6.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 6)  + (float(tiles_x) / 2)
						cardinal6.south_east2:
							tiempo_min = (float(tiles_x) / 2) * 6
						cardinal6.south_east3:
							tiempo_min = ((float(tiles_x) / 2) * 4)  + (float(tiles_x) / 2)
						cardinal6.south_east4:
							tiempo_min = (float(tiles_x) / 2) * 4
						cardinal6.south_east5:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)
						cardinal6.south_east6:
							tiempo_min = (float(tiles_x) / 2) * 2
						cardinal6.south_east7:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						
				else: ############################## else ###########################################
					match my_orientation:
						cardinal6.south:
							tiempo_min = (float(tiles_x) / 2) * 0
						cardinal6.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						cardinal6.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 2
						cardinal6.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)
						cardinal6.south_west4:
							tiempo_min = (float(tiles_x) / 2) * 4
						cardinal6.south_west5:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)
						cardinal6.south_west6:
							tiempo_min = (float(tiles_x) / 2) * 6
						cardinal6.south_west7:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)
							
						cardinal6.west:
							tiempo_min = (float(tiles_x) / 2) * 8
						cardinal6.north_west1:
							tiempo_min = ((float(tiles_x) / 2) * 8 )  + (float(tiles_x) / 2)
						cardinal6.north_west2:
							tiempo_min = (float(tiles_x) / 2) * 10
						cardinal6.north_west3:
							tiempo_min = ((float(tiles_x) / 2) * 10)  + (float(tiles_x) / 2)
						cardinal6.north_west4:
							tiempo_min = (float(tiles_x) / 2) * 12
						cardinal6.north_west5:
							tiempo_min = ((float(tiles_x) / 2) * 12) + (float(tiles_x) / 2)
						cardinal6.north_west6:
							tiempo_min = (float(tiles_x) / 2) * 14
						cardinal6.north_west7:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2)
						
							
						cardinal6.north:
							tiempo_min = (float(tiles_x) / 2) * 16
						cardinal6.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 16) + (float(tiles_x) / 2)
						cardinal6.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 18
						cardinal6.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 18) + (float(tiles_x) / 2)
						cardinal6.north_east4:
							tiempo_min = (float(tiles_x) / 2) * 20
						cardinal6.north_east5:
							tiempo_min = ((float(tiles_x) / 2) * 20) + (float(tiles_x) / 2)
						cardinal6.north_east6:
							tiempo_min = (float(tiles_x) / 2) * 22
						cardinal6.north_east7:
							tiempo_min = ((float(tiles_x) / 2) * 22) + (float(tiles_x) / 2)
						
						cardinal6.east:
							tiempo_min = (float(tiles_x) / 2) * 24
						cardinal6.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 24)  + (float(tiles_x) / 2)
						cardinal6.south_east2:
							tiempo_min = (float(tiles_x) / 2) * 26
						cardinal6.south_east3:
							tiempo_min = ((float(tiles_x) / 2) * 26)  + (float(tiles_x) / 2)
						cardinal6.south_east4:
							tiempo_min = (float(tiles_x) / 2) * 28
						cardinal6.south_east5:
							tiempo_min = ((float(tiles_x) / 2) * 28) + (float(tiles_x) / 2)
						cardinal6.south_east6:
							tiempo_min = (float(tiles_x) / 2) * 30
						cardinal6.south_east7:
							tiempo_min = ((float(tiles_x) / 2) * 30) + (float(tiles_x) / 2)
						
			#___________________________________________________________________
			#_________________ X 40 ____________________________________________
			#___________________________________________________________________
			cardinal_direction.X40:
				if !sprite_full_directions:
					if my_orientation >= 21:
						FLIP = true
					else:
						FLIP = false

				if FLIP:
					match my_orientation:
						cardinal8.south:
							tiempo_min = (float(tiles_x) / 2) * 0
						cardinal8.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 38) + (float(tiles_x) / 2)
						cardinal8.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 38
						cardinal8.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 36) + (float(tiles_x) / 2)
						cardinal8.south_west4:
							tiempo_min = (float(tiles_x) / 2) * 36
						cardinal8.south_west5:
							tiempo_min = ((float(tiles_x) / 2) * 34) + (float(tiles_x) / 2)
						cardinal8.south_west6:
							tiempo_min = (float(tiles_x) / 2) * 34
						cardinal8.south_west7:
							tiempo_min = ((float(tiles_x) / 2) * 32) + (float(tiles_x) / 2)
						cardinal8.south_west8:
							tiempo_min = (float(tiles_x) / 2) * 32
						cardinal8.south_west9:
							tiempo_min = ((float(tiles_x) / 2) * 30) + (float(tiles_x) / 2)
							
						cardinal8.west:
							tiempo_min = (float(tiles_x) / 2) * 30
						cardinal8.north_west1:
							tiempo_min = ((float(tiles_x) / 2) * 28 )  + (float(tiles_x) / 2)
						cardinal8.north_west2:
							tiempo_min = (float(tiles_x) / 2) * 28
						cardinal8.north_west3:
							tiempo_min = ((float(tiles_x) / 2) * 26)  + (float(tiles_x) / 2)
						cardinal8.north_west4:
							tiempo_min = (float(tiles_x) / 2) * 26
						cardinal8.north_west5:
							tiempo_min = ((float(tiles_x) / 2) * 24) + (float(tiles_x) / 2)
						cardinal8.north_west6:
							tiempo_min = (float(tiles_x) / 2) * 24
						cardinal8.north_west7:
							tiempo_min = ((float(tiles_x) / 2) * 22) + (float(tiles_x) / 2)
						cardinal8.north_west8:
							tiempo_min = (float(tiles_x) / 2) * 22
						cardinal8.north_west9:
							tiempo_min = ((float(tiles_x) / 2) * 20) + (float(tiles_x) / 2)
							
						cardinal8.north:
							tiempo_min = (float(tiles_x) / 2) * 20
						cardinal8.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 18) + (float(tiles_x) / 2)
						cardinal8.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 18
						cardinal8.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 16) + (float(tiles_x) / 2)
						cardinal8.north_east4:
							tiempo_min = (float(tiles_x) / 2) * 16
						cardinal8.north_east5:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2)
						cardinal8.north_east6:
							tiempo_min = (float(tiles_x) / 2) * 14
						cardinal8.north_east7:
							tiempo_min = ((float(tiles_x) / 2) * 12) + (float(tiles_x) / 2)
						cardinal8.north_east8:
							tiempo_min = (float(tiles_x) / 2) * 12
						cardinal8.north_east9:
							tiempo_min = ((float(tiles_x) / 2) * 10) + (float(tiles_x) / 2)
							
							
						cardinal8.east:
							tiempo_min = (float(tiles_x) / 2) * 10
						cardinal8.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 8)  + (float(tiles_x) / 2)
						cardinal8.south_east2:
							tiempo_min = (float(tiles_x) / 2) * 8
						cardinal8.south_east3:
							tiempo_min = ((float(tiles_x) / 2) * 6)  + (float(tiles_x) / 2)
						cardinal8.south_east4:
							tiempo_min = (float(tiles_x) / 2) * 6
						cardinal8.south_east5:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)
						cardinal8.south_east6:
							tiempo_min = (float(tiles_x) / 2) * 4
						cardinal8.south_east7:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)
						cardinal8.south_east8:
							tiempo_min = (float(tiles_x) / 2) * 2
						cardinal8.south_east9:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						
				else: ############################## else ###########################################
					match my_orientation:
						cardinal8.south:
							tiempo_min = (float(tiles_x) / 2) * 0
						cardinal8.south_west1:
							tiempo_min = ((float(tiles_x) / 2) * 0) + (float(tiles_x) / 2)
						cardinal8.south_west2:
							tiempo_min = (float(tiles_x) / 2) * 2
						cardinal8.south_west3:
							tiempo_min = ((float(tiles_x) / 2) * 2) + (float(tiles_x) / 2)
						cardinal8.south_west4:
							tiempo_min = (float(tiles_x) / 2) * 4
						cardinal8.south_west5:
							tiempo_min = ((float(tiles_x) / 2) * 4) + (float(tiles_x) / 2)
						cardinal8.south_west6:
							tiempo_min = (float(tiles_x) / 2) * 6
						cardinal8.south_west7:
							tiempo_min = ((float(tiles_x) / 2) * 6) + (float(tiles_x) / 2)
						cardinal8.south_west8:
							tiempo_min = (float(tiles_x) / 2) * 8
						cardinal8.south_west9:
							tiempo_min = ((float(tiles_x) / 2) * 8) + (float(tiles_x) / 2)
							
						cardinal8.west:
							tiempo_min = (float(tiles_x) / 2) * 10
						cardinal8.north_west1:
							tiempo_min = ((float(tiles_x) / 2) * 10 )  + (float(tiles_x) / 2)
						cardinal8.north_west2:
							tiempo_min = (float(tiles_x) / 2) * 12
						cardinal8.north_west3:
							tiempo_min = ((float(tiles_x) / 2) * 12)  + (float(tiles_x) / 2)
						cardinal8.north_west4:
							tiempo_min = (float(tiles_x) / 2) * 14
						cardinal8.north_west5:
							tiempo_min = ((float(tiles_x) / 2) * 14) + (float(tiles_x) / 2)
						cardinal8.north_west6:
							tiempo_min = (float(tiles_x) / 2) * 16
						cardinal8.north_west7:
							tiempo_min = ((float(tiles_x) / 2) * 16) + (float(tiles_x) / 2)
						cardinal8.north_west8:
							tiempo_min = (float(tiles_x) / 2) * 18
						cardinal8.north_west9:
							tiempo_min = ((float(tiles_x) / 2) * 18) + (float(tiles_x) / 2)
							
						cardinal8.north:
							tiempo_min = (float(tiles_x) / 2) * 20
						cardinal8.north_east1:
							tiempo_min = ((float(tiles_x) / 2) * 20) + (float(tiles_x) / 2)
						cardinal8.north_east2:
							tiempo_min = (float(tiles_x) / 2) * 22
						cardinal8.north_east3:
							tiempo_min = ((float(tiles_x) / 2) * 22) + (float(tiles_x) / 2)
						cardinal8.north_east4:
							tiempo_min = (float(tiles_x) / 2) * 24
						cardinal8.north_east5:
							tiempo_min = ((float(tiles_x) / 2) * 24) + (float(tiles_x) / 2)
						cardinal8.north_east6:
							tiempo_min = (float(tiles_x) / 2) * 26
						cardinal8.north_east7:
							tiempo_min = ((float(tiles_x) / 2) * 26) + (float(tiles_x) / 2)
						cardinal8.north_east8:
							tiempo_min = (float(tiles_x) / 2) * 28
						cardinal8.north_east9:
							tiempo_min = ((float(tiles_x) / 2) * 28) + (float(tiles_x) / 2)
							
							
						cardinal8.east:
							tiempo_min = (float(tiles_x) / 2) * 30
						cardinal8.south_east1:
							tiempo_min = ((float(tiles_x) / 2) * 30)  + (float(tiles_x) / 2)
						cardinal8.south_east2:
							tiempo_min = (float(tiles_x) / 2) * 32
						cardinal8.south_east3:
							tiempo_min = ((float(tiles_x) / 2) * 32)  + (float(tiles_x) / 2)
						cardinal8.south_east4:
							tiempo_min = (float(tiles_x) / 2) * 34
						cardinal8.south_east5:
							tiempo_min = ((float(tiles_x) / 2) * 34) + (float(tiles_x) / 2)
						cardinal8.south_east6:
							tiempo_min = (float(tiles_x) / 2) * 36
						cardinal8.south_east7:
							tiempo_min = ((float(tiles_x) / 2) * 36) + (float(tiles_x) / 2)
						cardinal8.south_east8:
							tiempo_min = (float(tiles_x) / 2) * 38
						cardinal8.south_east9:
							tiempo_min = ((float(tiles_x) / 2) * 38) + (float(tiles_x) / 2)


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
	#__________________________________________________
	if animation_direction != null:
		if play_backward:
			frame_index = (tiles_x ) - 1
		else:
			frame_index = 0.0
	else:
		if use_custom_clip:
			if custom_frame_library.size()>0:
				# CUSTOM CLIP MANUAL FRAME ____________
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
				frame_index = 0.0

	#_____________________________________________
	if projector_type == 0:
		if FLIP:
			var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
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
				var difference = (tiles_x * tiles_y ) - cardinal_equivalent[directions_number]
				if (tiles_x * tiles_y )  > cardinal_equivalent[directions_number]:
					if ((tiles_x * tiles_y ) - difference ) - frame_index < cardinal_equivalent[directions_number]:
						lastFrame = ((tiles_x * tiles_y ) - difference ) - frame_index
					else:
						lastFrame = 0
				else:
					lastFrame = (tiles_x * tiles_y )  - frame_index 
			else:
				lastFrame =  frame_index
		else:
			lastFrame =  frame_index
	#______________________________________________
	set_process(true)


## To get the texture of a specific animatorClip, especially when multiple clips share the same texture, 
## set the specific animatorClip to the "inherit_clip_texture" variable.
func GetSpriteSheet() -> Texture:
	if inherit_clip_texture == null:
		return spritesheet
	else:
		return inherit_clip_texture.spritesheet


##
func ExampleSprite2D() ->void:
	sprite_2d.texture =  GetSpriteSheet()
	sprite_2d.hframes = tiles_x
	sprite_2d.vframes = tiles_y
	sprite_2d.flip_h = FLIP
	sprite_2d.frame_coords = frame_coords


##
func ExampleSprite3D() ->void:
	if !billboard_disabled:
		if billboard_Y:
			sprite_3d.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		else: 
			sprite_3d.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	else:
		sprite_3d.billboard = BaseMaterial3D.BILLBOARD_DISABLED
		
	sprite_3d.hframes = tiles_x
	sprite_3d.vframes = tiles_y
	sprite_3d.flip_h = FLIP
	sprite_3d.texture = GetSpriteSheet()
	sprite_3d.shaded = false
	sprite_3d.frame_coords = frame_coords


##
func ExampleMaterial3D() ->void:
		if !billboard_disabled:
			if billboard_Y:
				material_3d.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
			else: 
				material_3d.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
		else:
			material_3d.billboard_mode = BaseMaterial3D.BILLBOARD_DISABLED
		
		material_3d.billboard_keep_scale = true
		var uv_escala = size
		var off_set = offset
		material_3d.albedo_texture = GetSpriteSheet()
		material_3d.set("uv1_scale", Vector3(uv_escala.x ,uv_escala.y,0))
		material_3d.set("uv1_offset", Vector3(off_set.x, off_set.y,0))
