extends Node
class_name AnimatorSpace

@export_enum(
	"Editor 2D", 
	"Editor 3D",
)  var tipo_apartado:int


## Choose the number of "directions" to calculate,
## verify that it corresponds to the same number of "directions" in your sprite sheet in the corresponding animation

enum cardinal1 {center, north, north_east, east, south_east, south, south_west, west, north_west}
@export_category("EDITOR 2D")
## Drag the owner "player" here
@export var player_2d :Node2D
@export var target_2d :Node2D
@export_category("EDITOR 3D")
## Drag the owner "player" here
@export var player_3d  :Node3D


@export_category("ANIMATOR CLIP")
@export var center_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var C_options = 0

@export var north_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var N_options = 0

@export var north_east_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var NE_options = 0

@export var east_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var E_options = 0

@export var south_east_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var SE_options = 0

@export var south_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var S_options = 0

@export var south_west_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var SW_options = 0

@export var west_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var W_options = 0

@export var north_west_clip :AnimatorClip
@export_flags("Play bacward", "Flip") var NW_options = 0

#@export var automatic_play_backward :bool


#_____________________________________________
var my_orientation :int
var rot_actor_player := 0.0
var rot_actor_camera := 0.0
var synrot := 0.0
var synrot2 := 0.0
var grado := 0
var animation_frame := 0.0
#_______________________________________________________
var FB_movement := 0.0
var LR_movement := 0.0
var velocity_2D :Vector2
var velocity_3D :Vector3
var animation_name :String


func PlaySpace(_animator:AnimatorController) -> String:
	var animation_count :int = Direction()

	match animation_count:
		cardinal1.center:
			animation_name = center_clip.get_name()
			if C_options > 0:
				if C_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  C_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false
				
		cardinal1.north:
			animation_name =  north_clip.get_name()
			if N_options > 0:
				if N_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  N_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false
				
		cardinal1.north_east:
			animation_name =  north_east_clip.get_name()
			if NE_options > 0:
				if NE_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  NE_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false
				
		cardinal1.east:
			animation_name =  east_clip.get_name()
			if E_options > 0:
				if E_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  E_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false
				
		cardinal1.south_east:
			animation_name =  south_east_clip.get_name()
			if SE_options > 0:
				if SE_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  SE_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false
				
		cardinal1.south:
			animation_name = south_clip.get_name()
			if S_options > 0:
				if S_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  S_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false
			
		cardinal1.south_west:
			animation_name =  south_west_clip.get_name()
			if SW_options > 0:
				if SW_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  SW_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false
			
		cardinal1.west:
			animation_name =  west_clip.get_name()
			if W_options > 0:
				if W_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  W_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false			
			
		cardinal1.north_west:
			animation_name =  north_west_clip.get_name()
			if NW_options > 0:
				if NW_options == 1:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = false
				elif  NW_options == 2:
					_animator.clip_library[animation_name].play_backward = false
					_animator.clip_library[animation_name].FLIP = true
				else:
					_animator.clip_library[animation_name].play_backward = true
					_animator.clip_library[animation_name].FLIP = true
			else:
				_animator.clip_library[animation_name].play_backward = false
				_animator.clip_library[animation_name].FLIP = false

	return animation_name


func Direction() ->int:
	if tipo_apartado == 0:
		if "velocity" in player_2d:
			velocity_2D = player_2d.velocity
			CalculateAxisMovement2D(player_2d, velocity_2D)

		var move_dir :Vector2 = Vector2(LR_movement, FB_movement).normalized()
		rot_actor_player = rad_to_deg(atan2(move_dir.x, move_dir.y))
		rot_actor_camera = 0

	else:
		if "velocity" in player_3d:
			velocity_3D = player_3d.velocity
		CalculateAxisMovement3D(player_3d, velocity_3D)


	synrot = (rot_actor_player - rot_actor_camera)
	if synrot >= -180  and synrot <= 180:
		synrot2 =  synrot
	else:
		if rot_actor_player >= 0:
			synrot2 = (rot_actor_player - (360 + (rot_actor_camera)))
		else:
			synrot2 = (rot_actor_player + (360 - (rot_actor_camera)))
	
	animation_frame = synrot2
	
	#############################################################
	#___________________________________________________________
	#______________________ X 8 _______________________________

	var formula = 360.0 / 8.0
	
	if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
		grado = 0
	elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1) + (formula/2.0):
		grado = 1
	elif animation_frame  > (formula*1)+ (formula/2.0) and animation_frame <= (formula*2)+ (formula/2.0):
		grado = 2
	elif animation_frame  > (formula*2)+ (formula/2.0) and animation_frame <= (formula*3)+ (formula/2.0):
		grado = 3
	elif animation_frame  > (formula*3)+ (formula/2.0) or animation_frame < -((formula*3)+ (formula/2.0)):
		grado = 4
		

	elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
		grado = 5
	elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
		grado = 6
	elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
		grado = 7
	
	if Vector2(LR_movement, FB_movement):
		if grado == 0:
			my_orientation = cardinal1.north
		if grado == 1:
			my_orientation = cardinal1.north_west
		if grado == 2:
			my_orientation = cardinal1.west
		if grado == 3:
			my_orientation = cardinal1.south_west
		if grado == 4:
			my_orientation = cardinal1.south
		if grado == 5:
			my_orientation = cardinal1.south_east
		if grado == 6:
			my_orientation = cardinal1.east
		if grado == 7:
			my_orientation = cardinal1.north_east
	else:
		my_orientation = cardinal1.center


	return my_orientation
		

func CalculateAxisMovement2D(target:Node2D, velocity:Vector2):
	var front_position = target.global_transform.origin + (target.global_transform.basis_xform(Vector2.DOWN) * -2.0 )
	var rear_position = target.global_transform.origin + (target.global_transform.basis_xform(Vector2.DOWN) * 2.0 )
	var vector_subtraction = (front_position - rear_position).normalized()
	FB_movement = vector_subtraction.dot(velocity.normalized())

	var left_position = target.global_transform.origin + (target.global_transform.basis_xform(Vector2.RIGHT) * -2.0 )
	var right_position = target.global_transform.origin + (target.global_transform.basis_xform(Vector2.RIGHT) * 2.0 )
	var vector_subtraction2 = (left_position - right_position).normalized()
	LR_movement = vector_subtraction2.dot(velocity.normalized())


func CalculateAxisMovement3D(target:Node3D, velocity:Vector3):
	var front_position = target.global_transform.origin + (target.global_transform.basis.z.normalized() * 2.0 )
	var rear_position = target.global_transform.origin + (target.global_transform.basis.z.normalized() * -2.0 )
	var vector_subtraction = (front_position - rear_position).normalized()
	FB_movement = vector_subtraction.dot(velocity.normalized())

	var left_position = target.global_transform.origin + (target.global_transform.basis.x.normalized() * -2.0 )
	var right_position = target.global_transform.origin + (target.global_transform.basis.x.normalized() * 2.0 )
	var vector_subtraction2 = (left_position - right_position).normalized()
	LR_movement = vector_subtraction2.dot(velocity.normalized())
