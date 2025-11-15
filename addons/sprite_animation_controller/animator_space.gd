class_name AnimatorSpace
extends Resource


@export_enum(
	"Editor 2D", 
	"Editor 3D",
)  var tipo_apartado:int

enum cardinal1 {center, north, north_east, east, south_east, south, south_west, west, north_west}
@export_category("EDITOR 2D")
## Drag the owner "player" here
#@export var player_2d :Node2D

@export_enum(
	"ROTATE NODE",
	"MANUAL DIRECTION",
	"AUTOMATIC DIRECTION",
) var type_calculation :String = "ROTATE NODE"
@export var manual_direction :Vector2

@export_category("EDITOR 3D")
## Drag the owner "player" here
#@export var player_3d  :Node3D

@export_category("ANIMATOR CLIPS NAMES")
@export var center_clip :String
@export_flags("Play bacward", "Flip") var C_options = 0

@export var north_clip :String
@export_flags("Play bacward", "Flip") var N_options = 0

@export var north_east_clip :String
@export_flags("Play bacward", "Flip") var NE_options = 0

@export var east_clip :String
@export_flags("Play bacward", "Flip") var E_options = 0

@export var south_east_clip :String
@export_flags("Play bacward", "Flip") var SE_options = 0

@export var south_clip :String
@export_flags("Play bacward", "Flip") var S_options = 0

@export var south_west_clip :String
@export_flags("Play bacward", "Flip") var SW_options = 0

@export var west_clip :String
@export_flags("Play bacward", "Flip") var W_options = 0

@export var north_west_clip :String
@export_flags("Play bacward", "Flip") var NW_options = 0




func PlaySpace(_animator:AnimatorController, player_2d:Node2D, player_3d:Node3D) -> Dictionary:
	var animation_count :int = Direction(player_2d, player_3d)
	var animation_name :String
	match animation_count:
		cardinal1.center:
			animation_name = center_clip
			if C_options > 0:
				if C_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  C_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false
				
		cardinal1.north:
			animation_name =  north_clip
			if N_options > 0:
				if N_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  N_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false
				
		cardinal1.north_east:
			animation_name =  north_east_clip
			if NE_options > 0:
				if NE_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  NE_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false
				
		cardinal1.east:
			animation_name =  east_clip
			if E_options > 0:
				if E_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  E_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false
				
		cardinal1.south_east:
			animation_name =  south_east_clip
			if SE_options > 0:
				if SE_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  SE_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false
				
		cardinal1.south:
			animation_name = south_clip
			if S_options > 0:
				if S_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  S_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false
			
		cardinal1.south_west:
			animation_name =  south_west_clip
			if SW_options > 0:
				if SW_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  SW_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false
			
		cardinal1.west:
			animation_name =  west_clip
			if W_options > 0:
				if W_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  W_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false
			
		cardinal1.north_west:
			animation_name =  north_west_clip
			if NW_options > 0:
				if NW_options == 1:
					_animator.play_backward = true
					_animator.FLIP = false
				elif  NW_options == 2:
					_animator.play_backward = false
					_animator.FLIP = true
				else:
					_animator.play_backward = true
					_animator.FLIP = true
			else:
				_animator.play_backward = false
				_animator.FLIP = false

	return {"animation_name":animation_name, "space_orientation":animation_count }


func Direction(player_2d:Node2D, player_3d:Node3D) ->int:
	#_____________________________________________
	var my_orientation :int
	var rot_actor_player := 0.0
	var rot_actor_camera := 0.0
	var synrot := 0.0
	var synrot2 := 0.0
	var grado := 0
	var animation_frame := 0.0
	var velocity_2D :Vector2
	var velocity_3D :Vector3
	var LRFB_movement :Vector2
	
	
	
	if tipo_apartado == 0:
		if "velocity" in player_2d:
			velocity_2D = player_2d.velocity
			LRFB_movement = CalculateAxisMovement2D(player_2d, velocity_2D)
		var move_dir :Vector2 = LRFB_movement.normalized()
		
		match type_calculation:
			"ROTATE NODE":
				rot_actor_player = rad_to_deg(atan2(move_dir.x, move_dir.y))
				rot_actor_camera = 0
			
			"MANUAL DIRECTION":
				rot_actor_player = rad_to_deg(atan2(manual_direction.x, -manual_direction.y))
				rot_actor_camera = rad_to_deg(atan2(-move_dir.x, move_dir.y))
			
			"AUTOMATIC DIRECTION":
				manual_direction = player_2d.animation_direction
				rot_actor_player = rad_to_deg(atan2(manual_direction.x, -manual_direction.y))
				rot_actor_camera = rad_to_deg(atan2(-move_dir.x, move_dir.y))
		
	else:
		if "velocity" in player_3d:
			velocity_3D = player_3d.velocity
		#CalculateAxisMovement3D(player_3d, velocity_3D)


	synrot = (rot_actor_player - rot_actor_camera)
	if synrot > 180:
		synrot -= 360
	elif synrot < -180:
		synrot += 360
	
	var angulo_para_mapear :float = synrot
	if angulo_para_mapear < 0:
		angulo_para_mapear += 360
	
	#############################################################
	#___________________________________________________________
	#______________________ X 8 _______________________________

	const NUM_DIRECCIONES : int = 8
	const ARCO_GRADOS :float = 360.0 / float(NUM_DIRECCIONES)
	const OFFSET :float = ARCO_GRADOS / 2.0
	var angulo_rotado :float = angulo_para_mapear + OFFSET
	grado = int(angulo_rotado / ARCO_GRADOS) % NUM_DIRECCIONES
			
	
	if LRFB_movement:
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
		

func CalculateAxisMovement2D(target:Node2D, velocity:Vector2) ->Vector2:
	var front_position = target.global_transform.origin + (target.global_transform.basis_xform(Vector2.DOWN) * -2.0 )
	var rear_position = target.global_transform.origin + (target.global_transform.basis_xform(Vector2.DOWN) * 2.0 )
	var vector_subtraction = (front_position - rear_position).normalized()
	var FB_movement :float = vector_subtraction.dot(velocity.normalized())

	var left_position = target.global_transform.origin + (target.global_transform.basis_xform(Vector2.RIGHT) * -2.0 )
	var right_position = target.global_transform.origin + (target.global_transform.basis_xform(Vector2.RIGHT) * 2.0 )
	var vector_subtraction2 = (left_position - right_position).normalized()
	var LR_movement :float = vector_subtraction2.dot(velocity.normalized())
	return Vector2(LR_movement,FB_movement)

func CalculateAxisMovement3D(target:Node3D, velocity:Vector3) ->Vector2: 
	var front_position = target.global_transform.origin + (target.global_transform.basis.z.normalized() * 2.0 )
	var rear_position = target.global_transform.origin + (target.global_transform.basis.z.normalized() * -2.0 )
	var vector_subtraction = (front_position - rear_position).normalized()
	var FB_movement :float = vector_subtraction.dot(velocity.normalized())

	var left_position = target.global_transform.origin + (target.global_transform.basis.x.normalized() * -2.0 )
	var right_position = target.global_transform.origin + (target.global_transform.basis.x.normalized() * 2.0 )
	var vector_subtraction2 = (left_position - right_position).normalized()
	var LR_movement :float = vector_subtraction2.dot(velocity.normalized())
	return Vector2(LR_movement,FB_movement)
