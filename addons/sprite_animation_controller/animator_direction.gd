extends Node
class_name AnimatorDirection


## Choose the corresponding section you are working on,
## depending on whether your game is 2D or 3D
@export_enum(
	"Editor 2D", 
	"Editor 3D",
)  var tipo_apartado:int
	
enum cardinal_direction {
	X8,	X12, X16, X20, X24, X32, X36, X40,
	X48, X64, X80, X96, X100,
	X144
}
## Choose the number of "directions" to calculate,
## verify that it corresponds to the same number of "directions" in your sprite sheet in the corresponding animation
@export var directions_number : cardinal_direction
## corresponds to the camera node of the active environment, or failing that, a node that fulfills this function for 2D cases,
## a specific node must be added to the group
@export  var actor_target_group : String = "camera"
@export_category("EDITOR 2D")
## Drag the owner "player" here
@export var actor_player_2d :Node2D
var player_2d :Node2D
var target_2d :Node2D
## MANUAL: performs the calculation directly without the camera in between, 
## the direction in which the player moves must be manually entered
## ROTATE NODE: Performs the calculation taking into account the direction of rotation of the players with respect to the direction of rotation of the camera,
## this mode is special when the configuration of the players' nodes are rotating, even the camera node can rotate.
@export_enum(
	"ROTATE NODE",
	"MANUAL DIRECTION",
	"AUTOMATIC DIRECTION",
) var type_calculation :String = "ROTATE NODE"
## Direction in which the player is facing forward,
## for it to work correctly the player must move forward on the -y axis
@export var manual_direction :Vector2
##
@export var adjust_velocity_up :float = 1.0
#_______________________________________________
@export_category("EDITOR 3D")
## Drag the owner "player" here
@export var actor_player_3d :Node3D
## Drag the owner "player" here
@export var compensate_camera_perspective :bool = true
var player_3d :Node3D
var target_3d :Node3D
#___ seccion 1 ___________
enum cardinal1 {south, south_west, west, north_west, north, north_east, east, south_east}

enum cardinal2 {
	south, south_west1, south_west2, 
	west, north_west1, north_west2,
	north, north_east1, north_east2,
	east, south_east1, south_east2,
}
enum cardinal3 {
	south, south_west1, south_west2, south_west3,
	west, north_west1, north_west2, north_west3,
	north, north_east1, north_east2, north_east3,
	east, south_east1, south_east2, south_east3,
}
enum cardinal4 {
	south, south_west1, south_west2, south_west3, south_west4,
	west, north_west1, north_west2, north_west3, north_west4,
	north, north_east1, north_east2, north_east3, north_east4,
	east, south_east1, south_east2, south_east3, south_east4,
}
enum cardinal5 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5,
	west, north_west1, north_west2, north_west3, north_west4, north_west5,
	north, north_east1, north_east2, north_east3, north_east4, north_east5,
	east, south_east1, south_east2, south_east3, south_east4, south_east5,
}
enum cardinal6 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7,
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

#___ SECCION 2 _____________________________________________
enum cardinal9 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7, south_west8, south_west9, south_west10, south_west11,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, north_west8, north_west9, north_west10, north_west11,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, north_east8, north_east9, north_east10, north_east11,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, south_east8, south_east9, south_east10, south_east11,
}
				
enum cardinal10 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7,
	south_west8, south_west9, south_west10, south_west11, south_west12, south_west13, south_west14, south_west15,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, 
	north_west8, north_west9, north_west10, north_west11, north_west12, north_west13, north_west14, north_west15,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, 
	north_east8, north_east9, north_east10, north_east11, north_east12, north_east13, north_east14, north_east15,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, 
	south_east8, south_east9, south_east10, south_east11, south_east12, south_east13, south_east14, south_east15,
}
				
enum cardinal11 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7,south_west8, south_west9, south_west10, 
	south_west11, south_west12, south_west13, south_west14, south_west15, south_west16, south_west17, south_west18, south_west19,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, north_west8, north_west9, north_west10, 
	north_west11, north_west12, north_west13, north_west14, north_west15, north_west16, north_west17, north_west18, north_west19,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, north_east8, north_east9, north_east10, 
	north_east11, north_east12, north_east13, north_east14, north_east15, north_east16, north_east17, north_east18, north_east19,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, south_east8, south_east9, south_east10, 
	south_east11, south_east12, south_east13, south_east14, south_east15, south_east16, south_east17, south_east18, south_east19,
}

enum cardinal12 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7,south_west8, south_west9, south_west10,south_west11, south_west12,  
	south_west13, south_west14, south_west15, south_west16, south_west17, south_west18, south_west19, south_west20, south_west21, south_west22, south_west23,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, north_west8, north_west9, north_west10, north_west11, north_west12, 
	north_west13, north_west14, north_west15, north_west16, north_west17, north_west18, north_west19, north_west20, north_west21, north_west22, north_west23,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, north_east8, north_east9, north_east10, north_east11, north_east12, 
	north_east13, north_east14, north_east15, north_east16, north_east17, north_east18, north_east19, north_east20, north_east21, north_east22, north_east23,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, south_east8, south_east9, south_east10, south_east11, south_east12, 
	south_east13, south_east14, south_east15, south_east16, south_east17, south_east18, south_east19, south_east20, south_east21, south_east22, south_east23,
}

enum cardinal13 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7,south_west8, south_west9, south_west10,south_west11, south_west12,  
	south_west13, south_west14, south_west15, south_west16, south_west17, south_west18, south_west19, south_west20, south_west21, south_west22, south_west23, south_west24,
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, north_west8, north_west9, north_west10, north_west11, north_west12, 
	north_west13, north_west14, north_west15, north_west16, north_west17, north_west18, north_west19, north_west20, north_west21, north_west22, north_west23, north_west24,
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, north_east8, north_east9, north_east10, north_east11, north_east12, 
	north_east13, north_east14, north_east15, north_east16, north_east17, north_east18, north_east19, north_east20, north_east21, north_east22, north_east23, north_east24,
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, south_east8, south_east9, south_east10, south_east11, south_east12, 
	south_east13, south_east14, south_east15, south_east16, south_east17, south_east18, south_east19, south_east20, south_east21, south_east22, south_east23, south_east24,
}

#______ SECCION 3 _____________________________________
enum cardinal15 {
	south, south_west1, south_west2, south_west3, south_west4, south_west5, south_west6, south_west7,south_west8, south_west9, south_west10,south_west11, south_west12,  
	south_west13, south_west14, south_west15, south_west16, south_west17, south_west18, south_west19, south_west20, south_west21, south_west22, south_west23, south_west24,
	south_west25, south_west26, south_west27, south_west28, south_west29, south_west30, south_west31, south_west32, south_west33, south_west34, south_west35, 
	west, north_west1, north_west2, north_west3, north_west4, north_west5, north_west6, north_west7, north_west8, north_west9, north_west10, north_west11, north_west12, 
	north_west13, north_west14, north_west15, north_west16, north_west17, north_west18, north_west19, north_west20, north_west21, north_west22, north_west23, north_west24,
	north_west25, north_west26, north_west27, north_west28, north_west29, north_west30, north_west31, north_west32, north_west33, north_west34, north_west35, 
	north, north_east1, north_east2, north_east3, north_east4, north_east5, north_east6, north_east7, north_east8, north_east9, north_east10, north_east11, north_east12, 
	north_east13, north_east14, north_east15, north_east16, north_east17, north_east18, north_east19, north_east20, north_east21, north_east22, north_east23, north_east24, 
	north_east25, north_east26, north_east27, north_east28, north_east29, north_east30, north_east31, north_east32, north_east33, north_east34, north_east35, 
	east, south_east1, south_east2, south_east3, south_east4, south_east5, south_east6, south_east7, south_east8, south_east9, south_east10, south_east11, south_east12, 
	south_east13, south_east14, south_east15, south_east16, south_east17, south_east18, south_east19, south_east20, south_east21, south_east22, south_east23, south_east24, 
	south_east25, south_east26, south_east27, south_east28, south_east29, south_east30, south_east31, south_east32, south_east33, south_east34, south_east35,
}

var my_orientation :int
#_______________________________________________________
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
var compensation_fov := 0.0

func _ready() -> void:
	if get_parent() is Node2D:
		tipo_apartado = 0
	else:
		tipo_apartado = 1
		
	match tipo_apartado:
		0:
			var mCamera = get_tree().get_nodes_in_group(actor_target_group)
			if mCamera.size()>0:
				target_2d = mCamera[0]

			if actor_player_2d == null:
				player_2d = get_parent()
			else:
				player_2d = actor_player_2d
		1:
			var mCamera = get_tree().get_nodes_in_group(actor_target_group)
			if mCamera.size()>0:
				target_3d = mCamera[0]

			if actor_player_3d == null:
				player_3d = get_parent()
			else:
				player_3d = actor_player_3d


func CalculateOrientation() ->int:
	if tipo_apartado == 0:
		match  type_calculation:
			"ROTATE NODE":
				rot_actor_player = CheckRotation2D(player_2d)
				rot_actor_camera = CheckRotation2D(target_2d)
			
			"MANUAL DIRECTION":
				rot_actor_player = rad_to_deg(atan2(-manual_direction.x, -manual_direction.y))
				rot_actor_camera = 0
				
			"AUTOMATIC DIRECTION":
				if "velocity" in player_2d:
					velocity_2D = player_2d.velocity
					CalculateAxisMovement2D(player_2d, velocity_2D)
				if Vector2(LR_movement, FB_movement ):
					rot_actor_player = rad_to_deg(atan2(LR_movement, FB_movement * adjust_velocity_up))
					rot_actor_camera = 0
	
	else:
		# COMPENSATION FOV CAMERA ____________________________________
		if compensate_camera_perspective:
			compensation_fov = CheckCameraAngle(target_3d.global_position, -target_3d.global_basis.z.normalized(), player_3d.global_position)
		else:
			compensation_fov = 0
		#____________________________________________________________________________
		rot_actor_player = CheckRotation3D(player_3d,1)
		rot_actor_camera = CheckRotation3D(target_3d,-1) - rad_to_deg(compensation_fov)
	
	
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
	match directions_number:
		#___________________________________________________________
		#______________________ X 8 _______________________________
		cardinal_direction.X8:
			var formula = 360.0 / 8.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) or animation_frame < -((formula*3)+(formula/2.0)):
				grado = 4
				

			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 5
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 6
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 7
			
			#_________________________________
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

		#___________________________________________________________
		#______________________ X 12 _______________________________
		cardinal_direction.X12:
			var formula = 360.0 / 12.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) or animation_frame < -((formula*5)+(formula/2.0)):
				grado = 6
				
		
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 7
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 8
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 9
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 10
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 11
			
			#___________________________
			if grado == 0:
				my_orientation = cardinal2.north
			if grado == 2:
				my_orientation = cardinal2.north_west2
			if grado == 3:
				my_orientation = cardinal2.north_west1
			if grado == 4:
				my_orientation = cardinal2.west
			if grado == 6:
				my_orientation = cardinal2.south_west2
			if grado == 7:
				my_orientation = cardinal2.south_west1
			if grado == 8:
				
				my_orientation = cardinal2.south
			if grado == 10:
				my_orientation = cardinal2.south_east2
			if grado == 11:
				my_orientation = cardinal2.south_east1
			if grado == 12:
				my_orientation = cardinal2.east
			if grado == 14:
				my_orientation = cardinal2.north_east2
			if grado == 15:
				my_orientation = cardinal2.north_east1
					
		#___________________________________________________________
		#______________________ X 16 _______________________________
		cardinal_direction.X16:
			var formula = 360.0 / 16.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) or animation_frame < -((formula*7)+(formula/2.0)):
				grado = 8
				
		
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 9
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 10
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 11
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 12
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 13
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 14
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 15
			
			#___________________________
			if grado == 0:
				my_orientation = cardinal3.north
			if grado == 1:
				my_orientation = cardinal3.north_west3
			if grado == 2:
				my_orientation = cardinal3.north_west2
			if grado == 3:
				my_orientation = cardinal3.north_west1
			if grado == 4:
				my_orientation = cardinal3.west
			if grado == 5:
				my_orientation = cardinal3.south_west3
			if grado == 6:
				my_orientation = cardinal3.south_west2
			if grado == 7:
				my_orientation = cardinal3.south_west1
			if grado == 8:
				my_orientation = cardinal3.south
			if grado == 9:
				my_orientation = cardinal3.south_east3
			if grado == 10:
				my_orientation = cardinal3.south_east2
			if grado == 11:
				my_orientation = cardinal3.south_east1
			if grado == 12:
				my_orientation = cardinal3.east
			if grado == 13:
				my_orientation = cardinal3.north_east3
			if grado == 14:
				my_orientation = cardinal3.north_east2
			if grado == 15:
				my_orientation = cardinal3.north_east1


		#___________________________________________________________
		#______________________ X 20 _______________________________
		cardinal_direction.X20:
			var formula = 360.0 / 20.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) or animation_frame < -((formula*9)+(formula/2.0)):
				grado = 10
				
		
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 11
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 12
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 13
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 14
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 15
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 16
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 17
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 18
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 19
			
			#___________________________
			if grado == 0:
				my_orientation = cardinal4.north
			if grado == 1:
				my_orientation = cardinal4.north_west4
			if grado == 2:
				my_orientation = cardinal4.north_west3
			if grado == 3:
				my_orientation = cardinal4.north_west2
			if grado == 4:
				my_orientation = cardinal4.north_west1
			if grado == 5:
				my_orientation = cardinal4.west
			if grado == 6:
				my_orientation = cardinal4.south_west4
			if grado == 7:
				my_orientation = cardinal4.south_west3
			if grado == 8:
				my_orientation = cardinal4.south_west2
			if grado == 9:
				my_orientation = cardinal4.south_west1
				
			if grado == 10:
				my_orientation = cardinal4.south
			if grado == 11:
				my_orientation = cardinal4.south_east4
			if grado == 12:
				my_orientation = cardinal4.south_east3
			if grado == 13:
				my_orientation = cardinal4.south_east2
			if grado == 14:
				my_orientation = cardinal4.south_east1
			if grado == 15:
				my_orientation = cardinal4.east
			if grado == 16:
				my_orientation = cardinal4.north_east4
			if grado == 17:
				my_orientation = cardinal4.north_east3
			if grado == 18:
				my_orientation = cardinal4.north_east2
			if grado == 19:
				my_orientation = cardinal4.north_east1


		#___________________________________________________________
		#______________________ X 24 _______________________________
		cardinal_direction.X24:
			var formula = 360.0 / 24.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) or animation_frame < -((formula*11)+(formula/2.0)):
				grado = 12
				
		
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 13
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 14
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 15
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 16
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 17
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 18
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 19
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 20
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 21
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 22
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 23
			
			#___________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal5.north
			if grado == 1:
				my_orientation = cardinal5.north_west5
			if grado == 2:
				my_orientation = cardinal5.north_west4
			if grado == 3:
				my_orientation = cardinal5.north_west3
			if grado == 4:
				my_orientation = cardinal5.north_west2
			if grado == 5:
				my_orientation = cardinal5.north_west1
			if grado == 6:
				my_orientation = cardinal5.west
			if grado == 7:
				my_orientation = cardinal5.south_west5
			if grado == 8:
				my_orientation = cardinal5.south_west4
			if grado == 9:
				my_orientation = cardinal5.south_west3
			if grado == 10:
				my_orientation = cardinal5.south_west2
			if grado == 11:
				my_orientation = cardinal5.south_west1
				
				
			if grado == 12:
				my_orientation = cardinal5.south
			if grado == 13:
				my_orientation = cardinal5.south_east5
			if grado == 14:
				my_orientation = cardinal5.south_east4
			if grado == 15:
				my_orientation = cardinal5.south_east3
			if grado == 16:
				my_orientation = cardinal5.south_east2
			if grado == 17:
				my_orientation = cardinal5.south_east1
			if grado == 18:
				my_orientation = cardinal5.east
			if grado == 19:
				my_orientation = cardinal5.north_east5
			if grado == 20:
				my_orientation = cardinal5.north_east4
			if grado == 21:
				my_orientation = cardinal5.north_east3
			if grado == 22:
				my_orientation = cardinal5.north_east2
			if grado == 23:
				my_orientation = cardinal5.north_east1


		#___________________________________________________________
		#______________________ X 32 _______________________________
		#___________________________________________________________
		cardinal_direction.X32:
			var formula = 360.0 / 32.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) or animation_frame < -((formula*15)+(formula/2.0)):
				grado = 16
				
		
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 17
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 18
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 19
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 20
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 21
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 22
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 23
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 24
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 25
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 26
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 27
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 28
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 29
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 30
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 31
			
			#___________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal6.north
			if grado == 1:
				my_orientation = cardinal6.north_west7
			if grado == 2:
				my_orientation = cardinal6.north_west6
			if grado == 3:
				my_orientation = cardinal6.north_west5
			if grado == 4:
				my_orientation = cardinal6.north_west4
			if grado == 5:
				my_orientation = cardinal6.north_west3
			if grado == 6:
				my_orientation = cardinal6.north_west2
			if grado == 7:
				my_orientation = cardinal6.north_west1
			if grado == 8:
				my_orientation = cardinal6.west
			if grado == 9:
				my_orientation = cardinal6.south_west7
			if grado == 10:
				my_orientation = cardinal6.south_west6
			if grado == 11:
				my_orientation = cardinal6.south_west5
			if grado == 12:
				my_orientation = cardinal6.south_west4
			if grado == 13:
				my_orientation = cardinal6.south_west3
			if grado == 14:
				my_orientation = cardinal6.south_west2
			if grado == 15:
				my_orientation = cardinal6.south_west1
				
				
			if grado == 16:
				my_orientation = cardinal6.south
			if grado == 17:
				my_orientation = cardinal6.south_east7
			if grado == 18:
				my_orientation = cardinal6.south_east6
			if grado == 19:
				my_orientation = cardinal6.south_east5
			if grado == 20:
				my_orientation = cardinal6.south_east4
			if grado == 21:
				my_orientation = cardinal6.south_east3
			if grado == 22:
				my_orientation = cardinal6.south_east2
			if grado == 23:
				my_orientation = cardinal6.south_east1
			if grado == 24:
				my_orientation = cardinal6.east
			if grado == 25:
				my_orientation = cardinal6.north_east7
			if grado == 26:
				my_orientation = cardinal6.north_east6
			if grado == 27:
				my_orientation = cardinal6.north_east5
			if grado == 28:
				my_orientation = cardinal6.north_east4
			if grado == 29:
				my_orientation = cardinal6.north_east3
			if grado == 30:
				my_orientation = cardinal6.north_east2
			if grado == 31:
				my_orientation = cardinal6.north_east1
					

		#___________________________________________________________
		#______________________ X 36 _______________________________
		cardinal_direction.X36:
			var formula = 360.0 / 36.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) and animation_frame <= (formula*16)+(formula/2.0):
				grado = 16
			elif animation_frame  > (formula*16)+(formula/2.0) and animation_frame <= (formula*17)+(formula/2.0):
				grado = 17
			elif animation_frame  > (formula*17)+(formula/2.0) or animation_frame < -((formula*17)+(formula/2.0)):
				grado = 18
				
		
			elif animation_frame  >= -((formula*17)+(formula/2.0)) and animation_frame < -((formula*16)+(formula/2.0)):
				grado = 19
			elif animation_frame  >= -((formula*16)+(formula/2.0)) and animation_frame < -((formula*15)+(formula/2.0)):
				grado = 20
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 21
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 22
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 23
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 24
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 25
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 26
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 27
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 28
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 29
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 30
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 31
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 32
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 33
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 34
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 35
			
			#___________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal7.north
			if grado == 1:
				my_orientation = cardinal7.north_west8
			if grado == 2:
				my_orientation = cardinal7.north_west7
			if grado == 3:
				my_orientation = cardinal7.north_west6
			if grado == 4:
				my_orientation = cardinal7.north_west5
			if grado == 5:
				my_orientation = cardinal7.north_west4
			if grado == 6:
				my_orientation = cardinal7.north_west3
			if grado == 7:
				my_orientation = cardinal7.north_west2
			if grado == 8:
				my_orientation = cardinal7.north_west1
			if grado == 9:
				my_orientation = cardinal7.west
			if grado == 10:
				my_orientation = cardinal7.south_west8
			if grado == 11:
				my_orientation = cardinal7.south_west7
			if grado == 12:
				my_orientation = cardinal7.south_west6
			if grado == 13:
				my_orientation = cardinal7.south_west5
			if grado == 14:
				my_orientation = cardinal7.south_west4
			if grado == 15:
				my_orientation = cardinal7.south_west3
			if grado == 16:
				my_orientation = cardinal7.south_west2
			if grado == 17:
				my_orientation = cardinal7.south_west1
				
				
			if grado == 18:
				my_orientation = cardinal7.south
			if grado == 19:
				my_orientation = cardinal7.south_east8
			if grado == 20:
				my_orientation = cardinal7.south_east7
			if grado == 21:
				my_orientation = cardinal7.south_east6
			if grado == 22:
				my_orientation = cardinal7.south_east5
			if grado == 23:
				my_orientation = cardinal7.south_east4
			if grado == 24:
				my_orientation = cardinal7.south_east3
			if grado == 25:
				my_orientation = cardinal7.south_east2
			if grado == 26:
				my_orientation = cardinal7.south_east1
			if grado == 27:
				my_orientation = cardinal7.east
			if grado == 28:
				my_orientation = cardinal7.north_east8
			if grado == 29:
				my_orientation = cardinal7.north_east7
			if grado == 30:
				my_orientation = cardinal7.north_east6
			if grado == 31:
				my_orientation = cardinal7.north_east5
			if grado == 32:
				my_orientation = cardinal7.north_east4
			if grado == 33:
				my_orientation = cardinal7.north_east3
			if grado == 34:
				my_orientation = cardinal7.north_east2
			if grado == 35:
				my_orientation = cardinal7.north_east1

		
		#___________________________________________________________
		#______________________ X 40 _______________________________
		cardinal_direction.X40:
			var formula = 360.0 / 40.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) and animation_frame <= (formula*16)+(formula/2.0):
				grado = 16
			elif animation_frame  > (formula*16)+(formula/2.0) and animation_frame <= (formula*17)+(formula/2.0):
				grado = 17
			elif animation_frame  > (formula*17)+(formula/2.0) and animation_frame <= (formula*18)+(formula/2.0):
				grado = 18
			elif animation_frame  > (formula*18)+(formula/2.0) and animation_frame <= (formula*19)+(formula/2.0):
				grado = 19
			elif animation_frame  > (formula*19)+(formula/2.0) or animation_frame < -((formula*19)+(formula/2.0)):
				grado = 20
				
		
			elif animation_frame  >= -((formula*19)+(formula/2.0)) and animation_frame < -((formula*18)+(formula/2.0)):
				grado = 21
			elif animation_frame  >= -((formula*18)+(formula/2.0)) and animation_frame < -((formula*17)+(formula/2.0)):
				grado = 22
			elif animation_frame  >= -((formula*17)+(formula/2.0)) and animation_frame < -((formula*16)+(formula/2.0)):
				grado = 23
			elif animation_frame  >= -((formula*16)+(formula/2.0)) and animation_frame < -((formula*15)+(formula/2.0)):
				grado = 24
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 25
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 26
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 27
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 28
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 29
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 30
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 31
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 32
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 33
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 34
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 35
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 36
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 37
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 38
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 39
			
			#___________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal8.north
			if grado == 1:
				my_orientation = cardinal8.north_west9
			if grado == 2:
				my_orientation = cardinal8.north_west8
			if grado == 3:
				my_orientation = cardinal8.north_west7
			if grado == 4:
				my_orientation = cardinal8.north_west6
			if grado == 5:
				my_orientation = cardinal8.north_west5
			if grado == 6:
				my_orientation = cardinal8.north_west4
			if grado == 7:
				my_orientation = cardinal8.north_west3
			if grado == 8:
				my_orientation = cardinal8.north_west2
			if grado == 9:
				my_orientation = cardinal8.north_west1
			if grado == 10:
				my_orientation = cardinal8.west
			if grado == 11:
				my_orientation = cardinal8.south_west9
			if grado == 12:
				my_orientation = cardinal8.south_west8
			if grado == 13:
				my_orientation = cardinal8.south_west7
			if grado == 14:
				my_orientation = cardinal8.south_west6
			if grado == 15:
				my_orientation = cardinal8.south_west5
			if grado == 16:
				my_orientation = cardinal8.south_west4
			if grado == 17:
				my_orientation = cardinal8.south_west3
			if grado == 18:
				my_orientation = cardinal8.south_west2
			if grado == 19:
				my_orientation = cardinal8.south_west1
				
				
			if grado == 20:
				my_orientation = cardinal8.south
			if grado == 21:
				my_orientation = cardinal8.south_east9
			if grado == 22:
				my_orientation = cardinal8.south_east8
			if grado == 23:
				my_orientation = cardinal8.south_east7
			if grado == 24:
				my_orientation = cardinal8.south_east6
			if grado == 25:
				my_orientation = cardinal8.south_east5
			if grado == 26:
				my_orientation = cardinal8.south_east4
			if grado == 27:
				my_orientation = cardinal8.south_east3
			if grado == 28:
				my_orientation = cardinal8.south_east2
			if grado == 29:
				my_orientation = cardinal8.south_east1
			if grado == 30:
				my_orientation = cardinal8.east
			if grado == 31:
				my_orientation = cardinal8.north_east9
			if grado == 32:
				my_orientation = cardinal8.north_east8
			if grado == 33:
				my_orientation = cardinal8.north_east7
			if grado == 34:
				my_orientation = cardinal8.north_east6
			if grado == 35:
				my_orientation = cardinal8.north_east5
			if grado == 36:
				my_orientation = cardinal8.north_east4
			if grado == 37:
				my_orientation = cardinal8.north_east3
			if grado == 38:
				my_orientation = cardinal8.north_east2
			if grado == 39:
				my_orientation = cardinal8.north_east1
			

#*******************************************************************
#*******************************************************************
#_____ SECCION 2 ___________________________________________________
#*******************************************************************
#*******************************************************************
		##___________________________________________________________
		##______________________ X 48 _______________________________
		cardinal_direction.X48:
			var formula = 360.0 / 48.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) and animation_frame <= (formula*16)+(formula/2.0):
				grado = 16
			elif animation_frame  > (formula*16)+(formula/2.0) and animation_frame <= (formula*17)+(formula/2.0):
				grado = 17
			elif animation_frame  > (formula*17)+(formula/2.0) and animation_frame <= (formula*18)+(formula/2.0):
				grado = 18
			elif animation_frame  > (formula*18)+(formula/2.0) and animation_frame <= (formula*19)+(formula/2.0):
				grado = 19
			elif animation_frame  > (formula*19)+(formula/2.0) and animation_frame <= (formula*20)+(formula/2.0):
				grado = 20
			elif animation_frame  > (formula*20)+(formula/2.0) and animation_frame <= (formula*21)+(formula/2.0):
				grado = 21
			elif animation_frame  > (formula*21)+(formula/2.0) and animation_frame <= (formula*22)+(formula/2.0):
				grado = 22
			elif animation_frame  > (formula*22)+(formula/2.0) and animation_frame <= (formula*23)+(formula/2.0):
				grado = 23
			elif animation_frame  > (formula*23)+(formula/2.0) or animation_frame < -((formula*23)+(formula/2.0)):
				grado = 24
				
		
			elif animation_frame  >= -((formula*23)+(formula/2.0)) and animation_frame < -((formula*22)+(formula/2.0)):
				grado = 25
			elif animation_frame  >= -((formula*22)+(formula/2.0)) and animation_frame < -((formula*21)+(formula/2.0)):
				grado = 26
			elif animation_frame  >= -((formula*21)+(formula/2.0)) and animation_frame < -((formula*20)+(formula/2.0)):
				grado = 27
			elif animation_frame  >= -((formula*20)+(formula/2.0)) and animation_frame < -((formula*19)+(formula/2.0)):
				grado = 28
			elif animation_frame  >= -((formula*19)+(formula/2.0)) and animation_frame < -((formula*18)+(formula/2.0)):
				grado = 29
			elif animation_frame  >= -((formula*18)+(formula/2.0)) and animation_frame < -((formula*17)+(formula/2.0)):
				grado = 30
			elif animation_frame  >= -((formula*17)+(formula/2.0)) and animation_frame < -((formula*16)+(formula/2.0)):
				grado = 31
			elif animation_frame  >= -((formula*16)+(formula/2.0)) and animation_frame < -((formula*15)+(formula/2.0)):
				grado = 32
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 33
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 34
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 35
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 36
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 37
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 38
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 39
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 40
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 41
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 42
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 43
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 44
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 45
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 46
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 47
			
			#___________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal9.north
			if grado == 1:
				my_orientation = cardinal9.north_west11
			if grado == 2:
				my_orientation = cardinal9.north_west10
			if grado == 3:
				my_orientation = cardinal9.north_west9
			if grado == 4:
				my_orientation = cardinal9.north_west8
			if grado == 5:
				my_orientation = cardinal9.north_west7
			if grado == 6:
				my_orientation = cardinal9.north_west6
			if grado == 7:
				my_orientation = cardinal9.north_west5
			if grado == 8:
				my_orientation = cardinal9.north_west4
			if grado == 9:
				my_orientation = cardinal9.north_west3
			if grado == 10:
				my_orientation = cardinal9.north_west2
			if grado == 11:
				my_orientation = cardinal9.north_west1
			if grado == 12:
				my_orientation = cardinal9.west
			if grado == 13:
				my_orientation = cardinal9.south_west11
			if grado == 14:
				my_orientation = cardinal9.south_west10
			if grado == 15:
				my_orientation = cardinal9.south_west9
			if grado == 16:
				my_orientation = cardinal9.south_west8
			if grado == 17:
				my_orientation = cardinal9.south_west7
			if grado == 18:
				my_orientation = cardinal9.south_west6
			if grado == 19:
				my_orientation = cardinal9.south_west5
			if grado == 20:
				my_orientation = cardinal9.south_west4
			if grado == 21:
				my_orientation = cardinal9.south_west3
			if grado == 22:
				my_orientation = cardinal9.south_west2
			if grado == 23:
				my_orientation = cardinal9.south_west1
				
				
			if grado == 24:
				my_orientation = cardinal9.south
			if grado == 25:
				my_orientation = cardinal9.south_east11
			if grado == 26:
				my_orientation = cardinal9.south_east10
			if grado == 27:
				my_orientation = cardinal9.south_east9
			if grado == 28:
				my_orientation = cardinal9.south_east8
			if grado == 29:
				my_orientation = cardinal9.south_east7
			if grado == 30:
				my_orientation = cardinal9.south_east6
			if grado == 31:
				my_orientation = cardinal9.south_east5
			if grado == 32:
				my_orientation = cardinal9.south_east4
			if grado == 33:
				my_orientation = cardinal9.south_east3
			if grado == 34:
				my_orientation = cardinal9.south_east2
			if grado == 35:
				my_orientation = cardinal9.south_east1
			if grado == 36:
				my_orientation = cardinal9.east
			if grado == 37:
				my_orientation = cardinal9.north_east11
			if grado == 38:
				my_orientation = cardinal9.north_east10
			if grado == 39:
				my_orientation = cardinal9.north_east9
			if grado == 40:
				my_orientation = cardinal9.north_east8
			if grado == 41:
				my_orientation = cardinal9.north_east7
			if grado == 42:
				my_orientation = cardinal9.north_east6
			if grado == 43:
				my_orientation = cardinal9.north_east5
			if grado == 44:
				my_orientation = cardinal9.north_east4
			if grado == 45:
				my_orientation = cardinal9.north_east3
			if grado == 46:
				my_orientation = cardinal9.north_east2
			if grado == 47:
				my_orientation = cardinal9.north_east1

			
		#___________________________________________________________
		#______________________ X 64 _______________________________
		cardinal_direction.X64:
			var formula = 360.0 / 64.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) and animation_frame <= (formula*16)+(formula/2.0):
				grado = 16
			elif animation_frame  > (formula*16)+(formula/2.0) and animation_frame <= (formula*17)+(formula/2.0):
				grado = 17
			elif animation_frame  > (formula*17)+(formula/2.0) and animation_frame <= (formula*18)+(formula/2.0):
				grado = 18
			elif animation_frame  > (formula*18)+(formula/2.0) and animation_frame <= (formula*19)+(formula/2.0):
				grado = 19
			elif animation_frame  > (formula*19)+(formula/2.0) and animation_frame <= (formula*20)+(formula/2.0):
				grado = 20
			elif animation_frame  > (formula*20)+(formula/2.0) and animation_frame <= (formula*21)+(formula/2.0):
				grado = 21
			elif animation_frame  > (formula*21)+(formula/2.0) and animation_frame <= (formula*22)+(formula/2.0):
				grado = 22
			elif animation_frame  > (formula*22)+(formula/2.0) and animation_frame <= (formula*23)+(formula/2.0):
				grado = 23
			elif animation_frame  > (formula*23)+(formula/2.0) and animation_frame <= (formula*24)+(formula/2.0):
				grado = 24
			elif animation_frame  > (formula*24)+(formula/2.0) and animation_frame <= (formula*25)+(formula/2.0):
				grado = 25
			elif animation_frame  > (formula*25)+(formula/2.0) and animation_frame <= (formula*26)+(formula/2.0):
				grado = 26
			elif animation_frame  > (formula*26)+(formula/2.0) and animation_frame <= (formula*27)+(formula/2.0):
				grado = 27
			elif animation_frame  > (formula*27)+(formula/2.0) and animation_frame <= (formula*28)+(formula/2.0):
				grado = 28
			elif animation_frame  > (formula*28)+(formula/2.0) and animation_frame <= (formula*29)+(formula/2.0):
				grado = 29
			elif animation_frame  > (formula*29)+(formula/2.0) and animation_frame <= (formula*30)+(formula/2.0):
				grado = 30
			elif animation_frame  > (formula*30)+(formula/2.0) and animation_frame <= (formula*31)+(formula/2.0):
				grado = 31
			elif animation_frame  > (formula*31)+(formula/2.0) or animation_frame < -((formula*31)+(formula/2.0)):
				grado = 32
				
		
			elif animation_frame  >= -((formula*31)+(formula/2.0)) and animation_frame < -((formula*30)+(formula/2.0)):
				grado = 33
			elif animation_frame  >= -((formula*30)+(formula/2.0)) and animation_frame < -((formula*29)+(formula/2.0)):
				grado = 34
			elif animation_frame  >= -((formula*29)+(formula/2.0)) and animation_frame < -((formula*28)+(formula/2.0)):
				grado = 35
			elif animation_frame  >= -((formula*28)+(formula/2.0)) and animation_frame < -((formula*27)+(formula/2.0)):
				grado = 36
			elif animation_frame  >= -((formula*27)+(formula/2.0)) and animation_frame < -((formula*26)+(formula/2.0)):
				grado = 37
			elif animation_frame  >= -((formula*26)+(formula/2.0)) and animation_frame < -((formula*25)+(formula/2.0)):
				grado = 38
			elif animation_frame  >= -((formula*25)+(formula/2.0)) and animation_frame < -((formula*24)+(formula/2.0)):
				grado = 39
			elif animation_frame  >= -((formula*24)+(formula/2.0)) and animation_frame < -((formula*23)+(formula/2.0)):
				grado = 40
			elif animation_frame  >= -((formula*23)+(formula/2.0)) and animation_frame < -((formula*22)+(formula/2.0)):
				grado = 41
			elif animation_frame  >= -((formula*22)+(formula/2.0)) and animation_frame < -((formula*21)+(formula/2.0)):
				grado = 42
			elif animation_frame  >= -((formula*21)+(formula/2.0)) and animation_frame < -((formula*20)+(formula/2.0)):
				grado = 43
			elif animation_frame  >= -((formula*20)+(formula/2.0)) and animation_frame < -((formula*19)+(formula/2.0)):
				grado = 44
			elif animation_frame  >= -((formula*19)+(formula/2.0)) and animation_frame < -((formula*18)+(formula/2.0)):
				grado = 45
			elif animation_frame  >= -((formula*18)+(formula/2.0)) and animation_frame < -((formula*17)+(formula/2.0)):
				grado = 46
			elif animation_frame  >= -((formula*17)+(formula/2.0)) and animation_frame < -((formula*16)+(formula/2.0)):
				grado = 47
			elif animation_frame  >= -((formula*16)+(formula/2.0)) and animation_frame < -((formula*15)+(formula/2.0)):
				grado = 48
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 49
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 50
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 51
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 52
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 53
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 54
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 55
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 56
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 57
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 58
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 59
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 60
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 61
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 62
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 63
			
			#________________________________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal10.north
			if grado == 1:
				my_orientation = cardinal10.north_west15
			if grado == 2:
				my_orientation = cardinal10.north_west14
			if grado == 3:
				my_orientation = cardinal10.north_west13
			if grado == 4:
				my_orientation = cardinal10.north_west12
			if grado == 5:
				my_orientation = cardinal10.north_west11
			if grado == 6:
				my_orientation = cardinal10.north_west10
			if grado == 7:
				my_orientation = cardinal10.north_west9
			if grado == 8:
				my_orientation = cardinal10.north_west8
			if grado == 9:
				my_orientation = cardinal10.north_west7
			if grado == 10:
				my_orientation = cardinal10.north_west6
			if grado == 11:
				my_orientation = cardinal10.north_west5
			if grado == 12:
				my_orientation = cardinal10.north_west4
			if grado == 13:
				my_orientation = cardinal10.north_west3
			if grado == 14:
				my_orientation = cardinal10.north_west2
			if grado == 15:
				my_orientation = cardinal10.north_west1
			if grado == 16:
				my_orientation = cardinal10.west
			if grado == 17:
				my_orientation = cardinal10.south_west15
			if grado == 18:
				my_orientation = cardinal10.south_west14
			if grado == 19:
				my_orientation = cardinal10.south_west13
			if grado == 20:
				my_orientation = cardinal10.south_west12
			if grado == 21:
				my_orientation = cardinal10.south_west11
			if grado == 22:
				my_orientation = cardinal10.south_west10
			if grado == 23:
				my_orientation = cardinal10.south_west9
			if grado == 24:
				my_orientation = cardinal10.south_west8
			if grado == 25:
				my_orientation = cardinal10.south_west7
			if grado == 26:
				my_orientation = cardinal10.south_west6
			if grado == 27:
				my_orientation = cardinal10.south_west5
			if grado == 28:
				my_orientation = cardinal10.south_west4
			if grado == 29:
				my_orientation = cardinal10.south_west3
			if grado == 30:
				my_orientation = cardinal10.south_west2
			if grado == 31:
				my_orientation = cardinal10.south_west1
				
				
			if grado == 32:
				my_orientation = cardinal10.south
			if grado == 33:
				my_orientation = cardinal10.south_east15
			if grado == 34:
				my_orientation = cardinal10.south_east14
			if grado == 35:
				my_orientation = cardinal10.south_east13
			if grado == 36:
				my_orientation = cardinal10.south_east12
			if grado == 37:
				my_orientation = cardinal10.south_east11
			if grado == 38:
				my_orientation = cardinal10.south_east10
			if grado == 39:
				my_orientation = cardinal10.south_east9
			if grado == 40:
				my_orientation = cardinal10.south_east8
			if grado == 41:
				my_orientation = cardinal10.south_east7
			if grado == 42:
				my_orientation = cardinal10.south_east6
			if grado == 43:
				my_orientation = cardinal10.south_east5
			if grado == 44:
				my_orientation = cardinal10.south_east4
			if grado == 45:
				my_orientation = cardinal10.south_east3
			if grado == 46:
				my_orientation = cardinal10.south_east2
			if grado == 47:
				my_orientation = cardinal10.south_east1
			if grado == 48:
				my_orientation = cardinal10.east
			if grado == 49:
				my_orientation = cardinal10.north_east15
			if grado == 50:
				my_orientation = cardinal10.north_east14
			if grado == 51:
				my_orientation = cardinal10.north_east13
			if grado == 52:
				my_orientation = cardinal10.north_east12
			if grado == 53:
				my_orientation = cardinal10.north_east11
			if grado == 54:
				my_orientation = cardinal10.north_east10
			if grado == 55:
				my_orientation = cardinal10.north_east9
			if grado == 56:
				my_orientation = cardinal10.north_east8
			if grado == 57:
				my_orientation = cardinal10.north_east7
			if grado == 58:
				my_orientation = cardinal10.north_east6
			if grado == 59:
				my_orientation = cardinal10.north_east5
			if grado == 60:
				my_orientation = cardinal10.north_east4
			if grado == 61:
				my_orientation = cardinal10.north_east3
			if grado == 62:
				my_orientation = cardinal10.north_east2
			if grado == 63:
				my_orientation = cardinal10.north_east1
			

		#___________________________________________________________
		#______________________ X 80 _______________________________
		cardinal_direction.X80:
			var formula = 360.0 / 80.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) and animation_frame <= (formula*16)+(formula/2.0):
				grado = 16
			elif animation_frame  > (formula*16)+(formula/2.0) and animation_frame <= (formula*17)+(formula/2.0):
				grado = 17
			elif animation_frame  > (formula*17)+(formula/2.0) and animation_frame <= (formula*18)+(formula/2.0):
				grado = 18
			elif animation_frame  > (formula*18)+(formula/2.0) and animation_frame <= (formula*19)+(formula/2.0):
				grado = 19
			elif animation_frame  > (formula*19)+(formula/2.0) and animation_frame <= (formula*20)+(formula/2.0):
				grado = 20
			elif animation_frame  > (formula*20)+(formula/2.0) and animation_frame <= (formula*21)+(formula/2.0):
				grado = 21
			elif animation_frame  > (formula*21)+(formula/2.0) and animation_frame <= (formula*22)+(formula/2.0):
				grado = 22
			elif animation_frame  > (formula*22)+(formula/2.0) and animation_frame <= (formula*23)+(formula/2.0):
				grado = 23
			elif animation_frame  > (formula*23)+(formula/2.0) and animation_frame <= (formula*24)+(formula/2.0):
				grado = 24
			elif animation_frame  > (formula*24)+(formula/2.0) and animation_frame <= (formula*25)+(formula/2.0):
				grado = 25
			elif animation_frame  > (formula*25)+(formula/2.0) and animation_frame <= (formula*26)+(formula/2.0):
				grado = 26
			elif animation_frame  > (formula*26)+(formula/2.0) and animation_frame <= (formula*27)+(formula/2.0):
				grado = 27
			elif animation_frame  > (formula*27)+(formula/2.0) and animation_frame <= (formula*28)+(formula/2.0):
				grado = 28
			elif animation_frame  > (formula*28)+(formula/2.0) and animation_frame <= (formula*29)+(formula/2.0):
				grado = 29
			elif animation_frame  > (formula*29)+(formula/2.0) and animation_frame <= (formula*30)+(formula/2.0):
				grado = 30
			elif animation_frame  > (formula*30)+(formula/2.0) and animation_frame <= (formula*31)+(formula/2.0):
				grado = 31
			elif animation_frame  > (formula*31)+(formula/2.0) and animation_frame <= (formula*32)+(formula/2.0):
				grado = 32
			elif animation_frame  > (formula*32)+(formula/2.0) and animation_frame <= (formula*33)+(formula/2.0):
				grado = 33
			elif animation_frame  > (formula*33)+(formula/2.0) and animation_frame <= (formula*34)+(formula/2.0):
				grado = 34
			elif animation_frame  > (formula*34)+(formula/2.0) and animation_frame <= (formula*35)+(formula/2.0):
				grado = 35
			elif animation_frame  > (formula*35)+(formula/2.0) and animation_frame <= (formula*36)+(formula/2.0):
				grado = 36
			elif animation_frame  > (formula*36)+(formula/2.0) and animation_frame <= (formula*37)+(formula/2.0):
				grado = 37
			elif animation_frame  > (formula*37)+(formula/2.0) and animation_frame <= (formula*38)+(formula/2.0):
				grado = 38
			elif animation_frame  > (formula*38)+(formula/2.0) and animation_frame <= (formula*39)+(formula/2.0):
				grado = 39
			elif animation_frame  > (formula*39)+(formula/2.0) or animation_frame < -((formula*39)+(formula/2.0)):
				grado = 40
				
				
			elif animation_frame  >= -((formula*39)+(formula/2.0)) and animation_frame < -((formula*38)+(formula/2.0)):
				grado = 41
			elif animation_frame  >= -((formula*38)+(formula/2.0)) and animation_frame < -((formula*37)+(formula/2.0)):
				grado = 42
			elif animation_frame  >= -((formula*37)+(formula/2.0)) and animation_frame < -((formula*36)+(formula/2.0)):
				grado = 43
			elif animation_frame  >= -((formula*36)+(formula/2.0)) and animation_frame < -((formula*35)+(formula/2.0)):
				grado = 44
			elif animation_frame  >= -((formula*35)+(formula/2.0)) and animation_frame < -((formula*34)+(formula/2.0)):
				grado = 45
			elif animation_frame  >= -((formula*34)+(formula/2.0)) and animation_frame < -((formula*33)+(formula/2.0)):
				grado = 46
			elif animation_frame  >= -((formula*33)+(formula/2.0)) and animation_frame < -((formula*32)+(formula/2.0)):
				grado = 47
			elif animation_frame  >= -((formula*32)+(formula/2.0)) and animation_frame < -((formula*31)+(formula/2.0)):
				grado = 48
			elif animation_frame  >= -((formula*31)+(formula/2.0)) and animation_frame < -((formula*30)+(formula/2.0)):
				grado = 49
			elif animation_frame  >= -((formula*30)+(formula/2.0)) and animation_frame < -((formula*29)+(formula/2.0)):
				grado = 50
			elif animation_frame  >= -((formula*29)+(formula/2.0)) and animation_frame < -((formula*28)+(formula/2.0)):
				grado = 51
			elif animation_frame  >= -((formula*28)+(formula/2.0)) and animation_frame < -((formula*27)+(formula/2.0)):
				grado = 52
			elif animation_frame  >= -((formula*27)+(formula/2.0)) and animation_frame < -((formula*26)+(formula/2.0)):
				grado = 53
			elif animation_frame  >= -((formula*26)+(formula/2.0)) and animation_frame < -((formula*25)+(formula/2.0)):
				grado = 54
			elif animation_frame  >= -((formula*25)+(formula/2.0)) and animation_frame < -((formula*24)+(formula/2.0)):
				grado = 55
			elif animation_frame  >= -((formula*24)+(formula/2.0)) and animation_frame < -((formula*23)+(formula/2.0)):
				grado = 56
			elif animation_frame  >= -((formula*23)+(formula/2.0)) and animation_frame < -((formula*22)+(formula/2.0)):
				grado = 57
			elif animation_frame  >= -((formula*22)+(formula/2.0)) and animation_frame < -((formula*21)+(formula/2.0)):
				grado = 58
			elif animation_frame  >= -((formula*21)+(formula/2.0)) and animation_frame < -((formula*20)+(formula/2.0)):
				grado = 59
			elif animation_frame  >= -((formula*20)+(formula/2.0)) and animation_frame < -((formula*19)+(formula/2.0)):
				grado = 60
			elif animation_frame  >= -((formula*19)+(formula/2.0)) and animation_frame < -((formula*18)+(formula/2.0)):
				grado = 61
			elif animation_frame  >= -((formula*18)+(formula/2.0)) and animation_frame < -((formula*17)+(formula/2.0)):
				grado = 62
			elif animation_frame  >= -((formula*17)+(formula/2.0)) and animation_frame < -((formula*16)+(formula/2.0)):
				grado = 63
			elif animation_frame  >= -((formula*16)+(formula/2.0)) and animation_frame < -((formula*15)+(formula/2.0)):
				grado = 64
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 65
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 66
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 67
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 68
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 69
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 70
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 71
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 72
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 73
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 74
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 75
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 76
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 77
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 78
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 79
			
			#___________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal11.north
			if grado == 1:
				my_orientation = cardinal11.north_west19
			if grado == 2:
				my_orientation = cardinal11.north_west18
			if grado == 3:
				my_orientation = cardinal11.north_west17
			if grado == 4:
				my_orientation = cardinal11.north_west16
			if grado == 5:
				my_orientation = cardinal11.north_west15
			if grado == 6:
				my_orientation = cardinal11.north_west14
			if grado == 7:
				my_orientation = cardinal11.north_west13
			if grado == 8:
				my_orientation = cardinal11.north_west12
			if grado == 9:
				my_orientation = cardinal11.north_west11
			if grado == 10:
				my_orientation = cardinal11.north_west10
			if grado == 11:
				my_orientation = cardinal11.north_west9
			if grado == 12:
				my_orientation = cardinal11.north_west8
			if grado == 13:
				my_orientation = cardinal11.north_west7
			if grado == 14:
				my_orientation = cardinal11.north_west6
			if grado == 15:
				my_orientation = cardinal11.north_west5
			if grado == 16:
				my_orientation = cardinal11.north_west4
			if grado == 17:
				my_orientation = cardinal11.north_west3
			if grado == 18:
				my_orientation = cardinal11.north_west2
			if grado == 19:
				my_orientation = cardinal11.north_west1
			if grado == 20:
				my_orientation = cardinal11.west
			if grado == 21:
				my_orientation = cardinal11.south_west19
			if grado == 22:
				my_orientation = cardinal11.south_west18
			if grado == 23:
				my_orientation = cardinal11.south_west17
			if grado == 24:
				my_orientation = cardinal11.south_west16
			if grado == 25:
				my_orientation = cardinal11.south_west15
			if grado == 26:
				my_orientation = cardinal11.south_west14
			if grado == 27:
				my_orientation = cardinal11.south_west13
			if grado == 28:
				my_orientation = cardinal11.south_west12
			if grado == 29:
				my_orientation = cardinal11.south_west11
			if grado == 30:
				my_orientation = cardinal11.south_west10
			if grado == 31:
				my_orientation = cardinal11.south_west9
			if grado == 32:
				my_orientation = cardinal11.south_west8
			if grado == 33:
				my_orientation = cardinal11.south_west7
			if grado == 34:
				my_orientation = cardinal11.south_west6
			if grado == 35:
				my_orientation = cardinal11.south_west5
			if grado == 36:
				my_orientation = cardinal11.south_west4
			if grado == 37:
				my_orientation = cardinal11.south_west3
			if grado == 38:
				my_orientation = cardinal11.south_west2
			if grado == 39:
				my_orientation = cardinal11.south_west1
			
			
			
			if grado == 40:
				my_orientation = cardinal11.south
			if grado == 41:
				my_orientation = cardinal11.south_east19
			if grado == 42:
				my_orientation = cardinal11.south_east18
			if grado == 43:
				my_orientation = cardinal11.south_east17
			if grado == 44:
				my_orientation = cardinal11.south_east16
			if grado == 45:
				my_orientation = cardinal11.south_east15
			if grado == 46:
				my_orientation = cardinal11.south_east14
			if grado == 47:
				my_orientation = cardinal11.south_east13
			if grado == 48:
				my_orientation = cardinal11.south_east12
			if grado == 49:
				my_orientation = cardinal11.south_east11
			if grado == 50:
				my_orientation = cardinal11.south_east10
			if grado == 51:
				my_orientation = cardinal11.south_east9
			if grado == 52:
				my_orientation = cardinal11.south_east8
			if grado == 53:
				my_orientation = cardinal11.south_east7
			if grado == 54:
				my_orientation = cardinal11.south_east6
			if grado == 55:
				my_orientation = cardinal11.south_east5
			if grado == 56:
				my_orientation = cardinal11.south_east4
			if grado == 57:
				my_orientation = cardinal11.south_east3
			if grado == 58:
				my_orientation = cardinal11.south_east2
			if grado == 59:
				my_orientation = cardinal11.south_east1
			if grado == 60:
				my_orientation = cardinal11.east
			if grado == 61:
				my_orientation = cardinal11.north_east19
			if grado == 62:
				my_orientation = cardinal11.north_east18
			if grado == 63:
				my_orientation = cardinal11.north_east17
			if grado == 64:
				my_orientation = cardinal11.north_east16
			if grado == 65:
				my_orientation = cardinal11.north_east15
			if grado == 66:
				my_orientation = cardinal11.north_east14
			if grado == 67:
				my_orientation = cardinal11.north_east13
			if grado == 68:
				my_orientation = cardinal11.north_east12
			if grado == 69:
				my_orientation = cardinal11.north_east11
			if grado == 70:
				my_orientation = cardinal11.north_east10
			if grado == 71:
				my_orientation = cardinal11.north_east9
			if grado == 72:
				my_orientation = cardinal11.north_east8
			if grado == 73:
				my_orientation = cardinal11.north_east7
			if grado == 74:
				my_orientation = cardinal11.north_east6
			if grado == 75:
				my_orientation = cardinal11.north_east5
			if grado == 76:
				my_orientation = cardinal11.north_east4
			if grado == 77:
				my_orientation = cardinal11.north_east3
			if grado == 78:
				my_orientation = cardinal11.north_east2
			if grado == 79:
				my_orientation = cardinal11.north_east1
			

		#___________________________________________________________
		#______________________ X 96 _______________________________
		cardinal_direction.X96:
			var formula = 360.0 / 96.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) and animation_frame <= (formula*16)+(formula/2.0):
				grado = 16
			elif animation_frame  > (formula*16)+(formula/2.0) and animation_frame <= (formula*17)+(formula/2.0):
				grado = 17
			elif animation_frame  > (formula*17)+(formula/2.0) and animation_frame <= (formula*18)+(formula/2.0):
				grado = 18
			elif animation_frame  > (formula*18)+(formula/2.0) and animation_frame <= (formula*19)+(formula/2.0):
				grado = 19
			elif animation_frame  > (formula*19)+(formula/2.0) and animation_frame <= (formula*20)+(formula/2.0):
				grado = 20
			elif animation_frame  > (formula*20)+(formula/2.0) and animation_frame <= (formula*21)+(formula/2.0):
				grado = 21
			elif animation_frame  > (formula*21)+(formula/2.0) and animation_frame <= (formula*22)+(formula/2.0):
				grado = 22
			elif animation_frame  > (formula*22)+(formula/2.0) and animation_frame <= (formula*23)+(formula/2.0):
				grado = 23
			elif animation_frame  > (formula*23)+(formula/2.0) and animation_frame <= (formula*24)+(formula/2.0):
				grado = 24
			elif animation_frame  > (formula*24)+(formula/2.0) and animation_frame <= (formula*25)+(formula/2.0):
				grado = 25
			elif animation_frame  > (formula*25)+(formula/2.0) and animation_frame <= (formula*26)+(formula/2.0):
				grado = 26
			elif animation_frame  > (formula*26)+(formula/2.0) and animation_frame <= (formula*27)+(formula/2.0):
				grado = 27
			elif animation_frame  > (formula*27)+(formula/2.0) and animation_frame <= (formula*28)+(formula/2.0):
				grado = 28
			elif animation_frame  > (formula*28)+(formula/2.0) and animation_frame <= (formula*29)+(formula/2.0):
				grado = 29
			elif animation_frame  > (formula*29)+(formula/2.0) and animation_frame <= (formula*30)+(formula/2.0):
				grado = 30
			elif animation_frame  > (formula*30)+(formula/2.0) and animation_frame <= (formula*31)+(formula/2.0):
				grado = 31
			elif animation_frame  > (formula*31)+(formula/2.0) and animation_frame <= (formula*32)+(formula/2.0):
				grado = 32
			elif animation_frame  > (formula*32)+(formula/2.0) and animation_frame <= (formula*33)+(formula/2.0):
				grado = 33
			elif animation_frame  > (formula*33)+(formula/2.0) and animation_frame <= (formula*34)+(formula/2.0):
				grado = 34
			elif animation_frame  > (formula*34)+(formula/2.0) and animation_frame <= (formula*35)+(formula/2.0):
				grado = 35
			elif animation_frame  > (formula*35)+(formula/2.0) and animation_frame <= (formula*36)+(formula/2.0):
				grado = 36
			elif animation_frame  > (formula*36)+(formula/2.0) and animation_frame <= (formula*37)+(formula/2.0):
				grado = 37
			elif animation_frame  > (formula*37)+(formula/2.0) and animation_frame <= (formula*38)+(formula/2.0):
				grado = 38
			elif animation_frame  > (formula*38)+(formula/2.0) and animation_frame <= (formula*39)+(formula/2.0):
				grado = 39
			elif animation_frame  > (formula*39)+(formula/2.0) and animation_frame <= (formula*40)+(formula/2.0):
				grado = 40
			elif animation_frame  > (formula*40)+(formula/2.0) and animation_frame <= (formula*41)+(formula/2.0):
				grado = 41
			elif animation_frame  > (formula*41)+(formula/2.0) and animation_frame <= (formula*42)+(formula/2.0):
				grado = 42
			elif animation_frame  > (formula*42)+(formula/2.0) and animation_frame <= (formula*43)+(formula/2.0):
				grado = 43
			elif animation_frame  > (formula*43)+(formula/2.0) and animation_frame <= (formula*44)+(formula/2.0):
				grado = 44
			elif animation_frame  > (formula*44)+(formula/2.0) and animation_frame <= (formula*45)+(formula/2.0):
				grado = 45
			elif animation_frame  > (formula*45)+(formula/2.0) and animation_frame <= (formula*46)+(formula/2.0):
				grado = 46
			elif animation_frame  > (formula*46)+(formula/2.0) and animation_frame <= (formula*47)+(formula/2.0):
				grado = 47
			elif animation_frame  > (formula*47)+(formula/2.0) or animation_frame < -((formula*47)+(formula/2.0)):
				grado = 48
				
				
			elif animation_frame  >= -((formula*47)+(formula/2.0)) and animation_frame < -((formula*46)+(formula/2.0)):
				grado = 49
			elif animation_frame  >= -((formula*46)+(formula/2.0)) and animation_frame < -((formula*45)+(formula/2.0)):
				grado = 50
			elif animation_frame  >= -((formula*45)+(formula/2.0)) and animation_frame < -((formula*44)+(formula/2.0)):
				grado = 51
			elif animation_frame  >= -((formula*44)+(formula/2.0)) and animation_frame < -((formula*43)+(formula/2.0)):
				grado = 52
			elif animation_frame  >= -((formula*43)+(formula/2.0)) and animation_frame < -((formula*42)+(formula/2.0)):
				grado = 53
			elif animation_frame  >= -((formula*42)+(formula/2.0)) and animation_frame < -((formula*41)+(formula/2.0)):
				grado = 54
			elif animation_frame  >= -((formula*41)+(formula/2.0)) and animation_frame < -((formula*40)+(formula/2.0)):
				grado = 55
			elif animation_frame  >= -((formula*40)+(formula/2.0)) and animation_frame < -((formula*39)+(formula/2.0)):
				grado = 56
			elif animation_frame  >= -((formula*39)+(formula/2.0)) and animation_frame < -((formula*38)+(formula/2.0)):
				grado = 57
			elif animation_frame  >= -((formula*38)+(formula/2.0)) and animation_frame < -((formula*37)+(formula/2.0)):
				grado = 58
			elif animation_frame  >= -((formula*37)+(formula/2.0)) and animation_frame < -((formula*36)+(formula/2.0)):
				grado = 59
			elif animation_frame  >= -((formula*36)+(formula/2.0)) and animation_frame < -((formula*35)+(formula/2.0)):
				grado = 60
			elif animation_frame  >= -((formula*35)+(formula/2.0)) and animation_frame < -((formula*34)+(formula/2.0)):
				grado = 61
			elif animation_frame  >= -((formula*34)+(formula/2.0)) and animation_frame < -((formula*33)+(formula/2.0)):
				grado = 62
			elif animation_frame  >= -((formula*33)+(formula/2.0)) and animation_frame < -((formula*32)+(formula/2.0)):
				grado = 63
			elif animation_frame  >= -((formula*32)+(formula/2.0)) and animation_frame < -((formula*31)+(formula/2.0)):
				grado = 64
			elif animation_frame  >= -((formula*31)+(formula/2.0)) and animation_frame < -((formula*30)+(formula/2.0)):
				grado = 65
			elif animation_frame  >= -((formula*30)+(formula/2.0)) and animation_frame < -((formula*29)+(formula/2.0)):
				grado = 66
			elif animation_frame  >= -((formula*29)+(formula/2.0)) and animation_frame < -((formula*28)+(formula/2.0)):
				grado = 67
			elif animation_frame  >= -((formula*28)+(formula/2.0)) and animation_frame < -((formula*27)+(formula/2.0)):
				grado = 68
			elif animation_frame  >= -((formula*27)+(formula/2.0)) and animation_frame < -((formula*26)+(formula/2.0)):
				grado = 69
			elif animation_frame  >= -((formula*26)+(formula/2.0)) and animation_frame < -((formula*25)+(formula/2.0)):
				grado = 70
			elif animation_frame  >= -((formula*25)+(formula/2.0)) and animation_frame < -((formula*24)+(formula/2.0)):
				grado = 71
			elif animation_frame  >= -((formula*24)+(formula/2.0)) and animation_frame < -((formula*23)+(formula/2.0)):
				grado = 72
			elif animation_frame  >= -((formula*23)+(formula/2.0)) and animation_frame < -((formula*22)+(formula/2.0)):
				grado = 73
			elif animation_frame  >= -((formula*22)+(formula/2.0)) and animation_frame < -((formula*21)+(formula/2.0)):
				grado = 74
			elif animation_frame  >= -((formula*21)+(formula/2.0)) and animation_frame < -((formula*20)+(formula/2.0)):
				grado = 75
			elif animation_frame  >= -((formula*20)+(formula/2.0)) and animation_frame < -((formula*19)+(formula/2.0)):
				grado = 76
			elif animation_frame  >= -((formula*19)+(formula/2.0)) and animation_frame < -((formula*18)+(formula/2.0)):
				grado = 77
			elif animation_frame  >= -((formula*18)+(formula/2.0)) and animation_frame < -((formula*17)+(formula/2.0)):
				grado = 78
			elif animation_frame  >= -((formula*17)+(formula/2.0)) and animation_frame < -((formula*16)+(formula/2.0)):
				grado = 79
			elif animation_frame  >= -((formula*16)+(formula/2.0)) and animation_frame < -((formula*15)+(formula/2.0)):
				grado = 80
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 81
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 82
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 83
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 84
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 85
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 86
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 87
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 88
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 89
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 90
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 91
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 92
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 93
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 94
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 95
			
			#___________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal12.north
			if grado == 1:
				my_orientation = cardinal12.north_west23
			if grado == 2:
				my_orientation = cardinal12.north_west22
			if grado == 3:
				my_orientation = cardinal12.north_west21
			if grado == 4:
				my_orientation = cardinal12.north_west20
			if grado == 5:
				my_orientation = cardinal12.north_west19
			if grado == 6:
				my_orientation = cardinal12.north_west18
			if grado == 7:
				my_orientation = cardinal12.north_west17
			if grado == 8:
				my_orientation = cardinal12.north_west16
			if grado == 9:
				my_orientation = cardinal12.north_west15
			if grado == 10:
				my_orientation = cardinal12.north_west14
			if grado == 11:
				my_orientation = cardinal12.north_west13
			if grado == 12:
				my_orientation = cardinal12.north_west12
			if grado == 13:
				my_orientation = cardinal12.north_west11
			if grado == 14:
				my_orientation = cardinal12.north_west10
			if grado == 15:
				my_orientation = cardinal12.north_west9
			if grado == 16:
				my_orientation = cardinal12.north_west8
			if grado == 17:
				my_orientation = cardinal12.north_west7
			if grado == 18:
				my_orientation = cardinal12.north_west6
			if grado == 19:
				my_orientation = cardinal12.north_west5
			if grado == 20:
				my_orientation = cardinal12.north_west4
			if grado == 21:
				my_orientation = cardinal12.north_west3
			if grado == 22:
				my_orientation = cardinal12.north_west2
			if grado == 23:
				my_orientation = cardinal12.north_west1
			if grado == 24:
				my_orientation = cardinal12.west
			if grado == 25:
				my_orientation = cardinal12.south_west23
			if grado == 26:
				my_orientation = cardinal12.south_west22
			if grado == 27:
				my_orientation = cardinal12.south_west21
			if grado == 28:
				my_orientation = cardinal12.south_west20
			if grado == 29:
				my_orientation = cardinal12.south_west19
			if grado == 30:
				my_orientation = cardinal12.south_west18
			if grado == 31:
				my_orientation = cardinal12.south_west17
			if grado == 32:
				my_orientation = cardinal12.south_west16
			if grado == 33:
				my_orientation = cardinal12.south_west15
			if grado == 34:
				my_orientation = cardinal12.south_west14
			if grado == 35:
				my_orientation = cardinal12.south_west13
			if grado == 36:
				my_orientation = cardinal12.south_west12
			if grado == 37:
				my_orientation = cardinal12.south_west11
			if grado == 38:
				my_orientation = cardinal12.south_west10
			if grado == 39:
				my_orientation = cardinal12.south_west9
			if grado == 40:
				my_orientation = cardinal12.south_west8
			if grado == 41:
				my_orientation = cardinal12.south_west7
			if grado == 42:
				my_orientation = cardinal12.south_west6
			if grado == 43:
				my_orientation = cardinal12.south_west5
			if grado == 44:
				my_orientation = cardinal12.south_west4
			if grado == 45:
				my_orientation = cardinal12.south_west3
			if grado == 46:
				my_orientation = cardinal12.south_west2
			if grado == 47:
				my_orientation = cardinal12.south_west1
				
				
			if grado == 48:
				my_orientation = cardinal12.south
			if grado == 49:
				my_orientation = cardinal12.south_east23
			if grado == 50:
				my_orientation = cardinal12.south_east22
			if grado == 51:
				my_orientation = cardinal12.south_east21
			if grado == 52:
				my_orientation = cardinal12.south_east20
			if grado == 53:
				my_orientation = cardinal12.south_east19
			if grado == 54:
				my_orientation = cardinal12.south_east18
			if grado == 55:
				my_orientation = cardinal12.south_east17
			if grado == 56:
				my_orientation = cardinal12.south_east16
			if grado == 57:
				my_orientation = cardinal12.south_east15
			if grado == 58:
				my_orientation = cardinal12.south_east14
			if grado == 59:
				my_orientation = cardinal12.south_east13
			if grado == 60:
				my_orientation = cardinal12.south_east12
			if grado == 61:
				my_orientation = cardinal12.south_east11
			if grado == 62:
				my_orientation = cardinal12.south_east10
			if grado == 63:
				my_orientation = cardinal12.south_east9
			if grado == 64:
				my_orientation = cardinal12.south_east8
			if grado == 65:
				my_orientation = cardinal12.south_east7
			if grado == 66:
				my_orientation = cardinal12.south_east6
			if grado == 67:
				my_orientation = cardinal12.south_east5
			if grado == 68:
				my_orientation = cardinal12.south_east4
			if grado == 69:
				my_orientation = cardinal12.south_east3
			if grado == 70:
				my_orientation = cardinal12.south_east2
			if grado == 71:
				my_orientation = cardinal12.south_east1
			if grado == 72:
				my_orientation = cardinal12.east
			if grado == 73:
				my_orientation = cardinal12.north_east23
			if grado == 74:
				my_orientation = cardinal12.north_east22
			if grado == 75:
				my_orientation = cardinal12.north_east21
			if grado == 76:
				my_orientation = cardinal12.north_east20
			if grado == 77:
				my_orientation = cardinal12.north_east19
			if grado == 78:
				my_orientation = cardinal12.north_east18
			if grado == 79:
				my_orientation = cardinal12.north_east17
			if grado == 80:
				my_orientation = cardinal12.north_east16
			if grado == 81:
				my_orientation = cardinal12.north_east15
			if grado == 82:
				my_orientation = cardinal12.north_east14
			if grado == 83:
				my_orientation = cardinal12.north_east13
			if grado == 84:
				my_orientation = cardinal12.north_east12
			if grado == 85:
				my_orientation = cardinal12.north_east11
			if grado == 86:
				my_orientation = cardinal12.north_east10
			if grado == 87:
				my_orientation = cardinal12.north_east9
			if grado == 88:
				my_orientation = cardinal12.north_east8
			if grado == 89:
				my_orientation = cardinal12.north_east7
			if grado == 90:
				my_orientation = cardinal12.north_east6
			if grado == 91:
				my_orientation = cardinal12.north_east5
			if grado == 92:
				my_orientation = cardinal12.north_east4
			if grado == 93:
				my_orientation = cardinal12.north_east3
			if grado == 94:
				my_orientation = cardinal12.north_east2
			if grado == 95:
				my_orientation = cardinal12.north_east1


		#___________________________________________________________
		#______________________ X 100 _______________________________
		cardinal_direction.X100:
			var formula = 360.0 / 100.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) and animation_frame <= (formula*16)+(formula/2.0):
				grado = 16
			elif animation_frame  > (formula*16)+(formula/2.0) and animation_frame <= (formula*17)+(formula/2.0):
				grado = 17
			elif animation_frame  > (formula*17)+(formula/2.0) and animation_frame <= (formula*18)+(formula/2.0):
				grado = 18
			elif animation_frame  > (formula*18)+(formula/2.0) and animation_frame <= (formula*19)+(formula/2.0):
				grado = 19
			elif animation_frame  > (formula*19)+(formula/2.0) and animation_frame <= (formula*20)+(formula/2.0):
				grado = 20
			elif animation_frame  > (formula*20)+(formula/2.0) and animation_frame <= (formula*21)+(formula/2.0):
				grado = 21
			elif animation_frame  > (formula*21)+(formula/2.0) and animation_frame <= (formula*22)+(formula/2.0):
				grado = 22
			elif animation_frame  > (formula*22)+(formula/2.0) and animation_frame <= (formula*23)+(formula/2.0):
				grado = 23
			elif animation_frame  > (formula*23)+(formula/2.0) and animation_frame <= (formula*24)+(formula/2.0):
				grado = 24
			elif animation_frame  > (formula*24)+(formula/2.0) and animation_frame <= (formula*25)+(formula/2.0):
				grado = 25
			elif animation_frame  > (formula*25)+(formula/2.0) and animation_frame <= (formula*26)+(formula/2.0):
				grado = 26
			elif animation_frame  > (formula*26)+(formula/2.0) and animation_frame <= (formula*27)+(formula/2.0):
				grado = 27
			elif animation_frame  > (formula*27)+(formula/2.0) and animation_frame <= (formula*28)+(formula/2.0):
				grado = 28
			elif animation_frame  > (formula*28)+(formula/2.0) and animation_frame <= (formula*29)+(formula/2.0):
				grado = 29
			elif animation_frame  > (formula*29)+(formula/2.0) and animation_frame <= (formula*30)+(formula/2.0):
				grado = 30
			elif animation_frame  > (formula*30)+(formula/2.0) and animation_frame <= (formula*31)+(formula/2.0):
				grado = 31
			elif animation_frame  > (formula*31)+(formula/2.0) and animation_frame <= (formula*32)+(formula/2.0):
				grado = 32
			elif animation_frame  > (formula*32)+(formula/2.0) and animation_frame <= (formula*33)+(formula/2.0):
				grado = 33
			elif animation_frame  > (formula*33)+(formula/2.0) and animation_frame <= (formula*34)+(formula/2.0):
				grado = 34
			elif animation_frame  > (formula*34)+(formula/2.0) and animation_frame <= (formula*35)+(formula/2.0):
				grado = 35
			elif animation_frame  > (formula*35)+(formula/2.0) and animation_frame <= (formula*36)+(formula/2.0):
				grado = 36
			elif animation_frame  > (formula*36)+(formula/2.0) and animation_frame <= (formula*37)+(formula/2.0):
				grado = 37
			elif animation_frame  > (formula*37)+(formula/2.0) and animation_frame <= (formula*38)+(formula/2.0):
				grado = 38
			elif animation_frame  > (formula*38)+(formula/2.0) and animation_frame <= (formula*39)+(formula/2.0):
				grado = 39
			elif animation_frame  > (formula*39)+(formula/2.0) and animation_frame <= (formula*40)+(formula/2.0):
				grado = 40
			elif animation_frame  > (formula*40)+(formula/2.0) and animation_frame <= (formula*41)+(formula/2.0):
				grado = 41
			elif animation_frame  > (formula*41)+(formula/2.0) and animation_frame <= (formula*42)+(formula/2.0):
				grado = 42
			elif animation_frame  > (formula*42)+(formula/2.0) and animation_frame <= (formula*43)+(formula/2.0):
				grado = 43
			elif animation_frame  > (formula*43)+(formula/2.0) and animation_frame <= (formula*44)+(formula/2.0):
				grado = 44
			elif animation_frame  > (formula*44)+(formula/2.0) and animation_frame <= (formula*45)+(formula/2.0):
				grado = 45
			elif animation_frame  > (formula*45)+(formula/2.0) and animation_frame <= (formula*46)+(formula/2.0):
				grado = 46
			elif animation_frame  > (formula*46)+(formula/2.0) and animation_frame <= (formula*47)+(formula/2.0):
				grado = 47
			elif animation_frame  > (formula*47)+(formula/2.0) and animation_frame <= (formula*48)+(formula/2.0):
				grado = 48
			elif animation_frame  > (formula*48)+(formula/2.0) and animation_frame <= (formula*49)+(formula/2.0):
				grado = 49
			elif animation_frame  > (formula*49)+(formula/2.0) or animation_frame < -((formula*49)+(formula/2.0)):
				grado = 50
				
				
			elif animation_frame  >= -((formula*49)+(formula/2.0)) and animation_frame < -((formula*48)+(formula/2.0)):
				grado = 51
			elif animation_frame  >= -((formula*48)+(formula/2.0)) and animation_frame < -((formula*47)+(formula/2.0)):
				grado = 52
			elif animation_frame  >= -((formula*47)+(formula/2.0)) and animation_frame < -((formula*46)+(formula/2.0)):
				grado = 53
			elif animation_frame  >= -((formula*46)+(formula/2.0)) and animation_frame < -((formula*45)+(formula/2.0)):
				grado = 54
			elif animation_frame  >= -((formula*45)+(formula/2.0)) and animation_frame < -((formula*44)+(formula/2.0)):
				grado = 55
			elif animation_frame  >= -((formula*44)+(formula/2.0)) and animation_frame < -((formula*43)+(formula/2.0)):
				grado = 56
			elif animation_frame  >= -((formula*43)+(formula/2.0)) and animation_frame < -((formula*42)+(formula/2.0)):
				grado = 57
			elif animation_frame  >= -((formula*42)+(formula/2.0)) and animation_frame < -((formula*41)+(formula/2.0)):
				grado = 58
			elif animation_frame  >= -((formula*41)+(formula/2.0)) and animation_frame < -((formula*40)+(formula/2.0)):
				grado = 59
			elif animation_frame  >= -((formula*40)+(formula/2.0)) and animation_frame < -((formula*39)+(formula/2.0)):
				grado = 60
			elif animation_frame  >= -((formula*39)+(formula/2.0)) and animation_frame < -((formula*38)+(formula/2.0)):
				grado = 61
			elif animation_frame  >= -((formula*38)+(formula/2.0)) and animation_frame < -((formula*37)+(formula/2.0)):
				grado = 62
			elif animation_frame  >= -((formula*37)+(formula/2.0)) and animation_frame < -((formula*36)+(formula/2.0)):
				grado = 63
			elif animation_frame  >= -((formula*36)+(formula/2.0)) and animation_frame < -((formula*35)+(formula/2.0)):
				grado = 64
			elif animation_frame  >= -((formula*35)+(formula/2.0)) and animation_frame < -((formula*34)+(formula/2.0)):
				grado = 65
			elif animation_frame  >= -((formula*34)+(formula/2.0)) and animation_frame < -((formula*33)+(formula/2.0)):
				grado = 66
			elif animation_frame  >= -((formula*33)+(formula/2.0)) and animation_frame < -((formula*32)+(formula/2.0)):
				grado = 67
			elif animation_frame  >= -((formula*32)+(formula/2.0)) and animation_frame < -((formula*31)+(formula/2.0)):
				grado = 68
			elif animation_frame  >= -((formula*31)+(formula/2.0)) and animation_frame < -((formula*30)+(formula/2.0)):
				grado = 69
			elif animation_frame  >= -((formula*30)+(formula/2.0)) and animation_frame < -((formula*29)+(formula/2.0)):
				grado = 70
			elif animation_frame  >= -((formula*29)+(formula/2.0)) and animation_frame < -((formula*28)+(formula/2.0)):
				grado = 71
			elif animation_frame  >= -((formula*28)+(formula/2.0)) and animation_frame < -((formula*27)+(formula/2.0)):
				grado = 72
			elif animation_frame  >= -((formula*27)+(formula/2.0)) and animation_frame < -((formula*26)+(formula/2.0)):
				grado = 73
			elif animation_frame  >= -((formula*26)+(formula/2.0)) and animation_frame < -((formula*25)+(formula/2.0)):
				grado = 74
			elif animation_frame  >= -((formula*25)+(formula/2.0)) and animation_frame < -((formula*24)+(formula/2.0)):
				grado = 75
			elif animation_frame  >= -((formula*24)+(formula/2.0)) and animation_frame < -((formula*23)+(formula/2.0)):
				grado = 76
			elif animation_frame  >= -((formula*23)+(formula/2.0)) and animation_frame < -((formula*22)+(formula/2.0)):
				grado = 77
			elif animation_frame  >= -((formula*22)+(formula/2.0)) and animation_frame < -((formula*21)+(formula/2.0)):
				grado = 78
			elif animation_frame  >= -((formula*21)+(formula/2.0)) and animation_frame < -((formula*20)+(formula/2.0)):
				grado = 79
			elif animation_frame  >= -((formula*20)+(formula/2.0)) and animation_frame < -((formula*19)+(formula/2.0)):
				grado = 80
			elif animation_frame  >= -((formula*19)+(formula/2.0)) and animation_frame < -((formula*18)+(formula/2.0)):
				grado = 81
			elif animation_frame  >= -((formula*18)+(formula/2.0)) and animation_frame < -((formula*17)+(formula/2.0)):
				grado = 82
			elif animation_frame  >= -((formula*17)+(formula/2.0)) and animation_frame < -((formula*16)+(formula/2.0)):
				grado = 83
			elif animation_frame  >= -((formula*16)+(formula/2.0)) and animation_frame < -((formula*15)+(formula/2.0)):
				grado = 84
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 85
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 86
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 87
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 88
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 89
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 90
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 91
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 92
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 93
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 94
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 95
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 96
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 97
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 98
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 99
			
			#____________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal13.north
			if grado == 1:
				my_orientation = cardinal13.north_west24
			if grado == 2:
				my_orientation = cardinal13.north_west23
			if grado == 3:
				my_orientation = cardinal13.north_west22
			if grado == 4:
				my_orientation = cardinal13.north_west21
			if grado == 5:
				my_orientation = cardinal13.north_west20
			if grado == 6:
				my_orientation = cardinal13.north_west19
			if grado == 7:
				my_orientation = cardinal13.north_west18
			if grado == 8:
				my_orientation = cardinal13.north_west17
			if grado == 9:
				my_orientation = cardinal13.north_west16
			if grado == 10:
				my_orientation = cardinal13.north_west15
			if grado == 11:
				my_orientation = cardinal13.north_west14
			if grado == 12:
				my_orientation = cardinal13.north_west13
			if grado == 13:
				my_orientation = cardinal13.north_west12
			if grado == 14:
				my_orientation = cardinal13.north_west11
			if grado == 15:
				my_orientation = cardinal13.north_west10
			if grado == 16:
				my_orientation = cardinal13.north_west9
			if grado == 17:
				my_orientation = cardinal13.north_west8
			if grado == 18:
				my_orientation = cardinal13.north_west7
			if grado == 19:
				my_orientation = cardinal13.north_west6
			if grado == 20:
				my_orientation = cardinal13.north_west5
			if grado == 21:
				my_orientation = cardinal13.north_west4
			if grado == 22:
				my_orientation = cardinal13.north_west3
			if grado == 23:
				my_orientation = cardinal13.north_west2
			if grado == 24:
				my_orientation = cardinal13.north_west1
			if grado == 25:
				my_orientation = cardinal13.west
			if grado == 26:
				my_orientation = cardinal13.south_west24
			if grado == 27:
				my_orientation = cardinal13.south_west23
			if grado == 28:
				my_orientation = cardinal13.south_west22
			if grado == 29:
				my_orientation = cardinal13.south_west21
			if grado == 30:
				my_orientation = cardinal13.south_west20
			if grado == 31:
				my_orientation = cardinal13.south_west19
			if grado == 32:
				my_orientation = cardinal13.south_west18
			if grado == 33:
				my_orientation = cardinal13.south_west17
			if grado == 34:
				my_orientation = cardinal13.south_west16
			if grado == 35:
				my_orientation = cardinal13.south_west15
			if grado == 36:
				my_orientation = cardinal13.south_west14
			if grado == 37:
				my_orientation = cardinal13.south_west13
			if grado == 38:
				my_orientation = cardinal13.south_west12
			if grado == 39:
				my_orientation = cardinal13.south_west11
			if grado == 40:
				my_orientation = cardinal13.south_west10
			if grado == 41:
				my_orientation = cardinal13.south_west9
			if grado == 42:
				my_orientation = cardinal13.south_west8
			if grado == 43:
				my_orientation = cardinal13.south_west7
			if grado == 44:
				my_orientation = cardinal13.south_west6
			if grado == 45:
				my_orientation = cardinal13.south_west5
			if grado == 46:
				my_orientation = cardinal13.south_west4
			if grado == 47:
				my_orientation = cardinal13.south_west3
			if grado == 48:
				my_orientation = cardinal13.south_west2
			if grado == 49:
				my_orientation = cardinal13.south_west1
				
				
			if grado == 50:
				my_orientation = cardinal13.south
			if grado == 51:
				my_orientation = cardinal13.south_east24
			if grado == 52:
				my_orientation = cardinal13.south_east23
			if grado == 53:
				my_orientation = cardinal13.south_east22
			if grado == 54:
				my_orientation = cardinal13.south_east21
			if grado == 55:
				my_orientation = cardinal13.south_east20
			if grado == 56:
				my_orientation = cardinal13.south_east19
			if grado == 57:
				my_orientation = cardinal13.south_east18
			if grado == 58:
				my_orientation = cardinal13.south_east17
			if grado == 59:
				my_orientation = cardinal13.south_east16
			if grado == 60:
				my_orientation = cardinal13.south_east15
			if grado == 61:
				my_orientation = cardinal13.south_east14
			if grado == 62:
				my_orientation = cardinal13.south_east13
			if grado == 63:
				my_orientation = cardinal13.south_east12
			if grado == 64:
				my_orientation = cardinal13.south_east11
			if grado == 65:
				my_orientation = cardinal13.south_east10
			if grado == 66:
				my_orientation = cardinal13.south_east9
			if grado == 67:
				my_orientation = cardinal13.south_east8
			if grado == 68:
				my_orientation = cardinal13.south_east7
			if grado == 69:
				my_orientation = cardinal13.south_east6
			if grado == 70:
				my_orientation = cardinal13.south_east5
			if grado == 71:
				my_orientation = cardinal13.south_east4
			if grado == 72:
				my_orientation = cardinal13.south_east3
			if grado == 73:
				my_orientation = cardinal13.south_east2
			if grado == 74:
				my_orientation = cardinal13.south_east1
			if grado == 75:
				my_orientation = cardinal13.east
			if grado == 76:
				my_orientation = cardinal13.north_east24
			if grado == 77:
				my_orientation = cardinal13.north_east23
			if grado == 78:
				my_orientation = cardinal13.north_east22
			if grado == 79:
				my_orientation = cardinal13.north_east21
			if grado == 80:
				my_orientation = cardinal13.north_east20
			if grado == 81:
				my_orientation = cardinal13.north_east19
			if grado == 82:
				my_orientation = cardinal13.north_east18
			if grado == 83:
				my_orientation = cardinal13.north_east17
			if grado == 84:
				my_orientation = cardinal13.north_east16
			if grado == 85:
				my_orientation = cardinal13.north_east15
			if grado == 86:
				my_orientation = cardinal13.north_east14
			if grado == 87:
				my_orientation = cardinal13.north_east13
			if grado == 88:
				my_orientation = cardinal13.north_east12
			if grado == 89:
				my_orientation = cardinal13.north_east11
			if grado == 90:
				my_orientation = cardinal13.north_east10
			if grado == 91:
				my_orientation = cardinal13.north_east9
			if grado == 92:
				my_orientation = cardinal13.north_east8
			if grado == 93:
				my_orientation = cardinal13.north_east7
			if grado == 94:
				my_orientation = cardinal13.north_east6
			if grado == 95:
				my_orientation = cardinal13.north_east5
			if grado == 96:
				my_orientation = cardinal13.north_east4
			if grado == 97:
				my_orientation = cardinal13.north_east3
			if grado == 98:
				my_orientation = cardinal13.north_east2
			if grado == 99:
				my_orientation = cardinal13.north_east1
				
			
#*******************************************************************
#*******************************************************************
#_____ SECCION 3 ___________________________________________________
#*******************************************************************
#*******************************************************************
		#___________________________________________________________
		#______________________ X 144 _______________________________
		cardinal_direction.X144:
			var formula = 360.0 / 144.0
			
			if animation_frame >= -(formula/2.0) and animation_frame <= (formula/2.0):
				grado = 0
			elif animation_frame  > (formula/2.0) and animation_frame <= (formula*1)+(formula/2.0):
				grado = 1
			elif animation_frame  > (formula*1)+(formula/2.0) and animation_frame <= (formula*2)+(formula/2.0):
				grado = 2
			elif animation_frame  > (formula*2)+(formula/2.0) and animation_frame <= (formula*3)+(formula/2.0):
				grado = 3
			elif animation_frame  > (formula*3)+(formula/2.0) and animation_frame <= (formula*4)+(formula/2.0):
				grado = 4
			elif animation_frame  > (formula*4)+(formula/2.0) and animation_frame <= (formula*5)+(formula/2.0):
				grado = 5
			elif animation_frame  > (formula*5)+(formula/2.0) and animation_frame <= (formula*6)+(formula/2.0):
				grado = 6
			elif animation_frame  > (formula*6)+(formula/2.0) and animation_frame <= (formula*7)+(formula/2.0):
				grado = 7
			elif animation_frame  > (formula*7)+(formula/2.0) and animation_frame <= (formula*8)+(formula/2.0):
				grado = 8
			elif animation_frame  > (formula*8)+(formula/2.0) and animation_frame <= (formula*9)+(formula/2.0):
				grado = 9
			elif animation_frame  > (formula*9)+(formula/2.0) and animation_frame <= (formula*10)+(formula/2.0):
				grado = 10
			elif animation_frame  > (formula*10)+(formula/2.0) and animation_frame <= (formula*11)+(formula/2.0):
				grado = 11
			elif animation_frame  > (formula*11)+(formula/2.0) and animation_frame <= (formula*12)+(formula/2.0):
				grado = 12
			elif animation_frame  > (formula*12)+(formula/2.0) and animation_frame <= (formula*13)+(formula/2.0):
				grado = 13
			elif animation_frame  > (formula*13)+(formula/2.0) and animation_frame <= (formula*14)+(formula/2.0):
				grado = 14
			elif animation_frame  > (formula*14)+(formula/2.0) and animation_frame <= (formula*15)+(formula/2.0):
				grado = 15
			elif animation_frame  > (formula*15)+(formula/2.0) and animation_frame <= (formula*16)+(formula/2.0):
				grado = 16
			elif animation_frame  > (formula*16)+(formula/2.0) and animation_frame <= (formula*17)+(formula/2.0):
				grado = 17
			elif animation_frame  > (formula*17)+(formula/2.0) and animation_frame <= (formula*18)+(formula/2.0):
				grado = 18
			elif animation_frame  > (formula*18)+(formula/2.0) and animation_frame <= (formula*19)+(formula/2.0):
				grado = 19
			elif animation_frame  > (formula*19)+(formula/2.0) and animation_frame <= (formula*20)+(formula/2.0):
				grado = 20
			elif animation_frame  > (formula*20)+(formula/2.0) and animation_frame <= (formula*21)+(formula/2.0):
				grado = 21
			elif animation_frame  > (formula*21)+(formula/2.0) and animation_frame <= (formula*22)+(formula/2.0):
				grado = 22
			elif animation_frame  > (formula*22)+(formula/2.0) and animation_frame <= (formula*23)+(formula/2.0):
				grado = 23
			elif animation_frame  > (formula*23)+(formula/2.0) and animation_frame <= (formula*24)+(formula/2.0):
				grado = 24
			elif animation_frame  > (formula*24)+(formula/2.0) and animation_frame <= (formula*25)+(formula/2.0):
				grado = 25
			elif animation_frame  > (formula*25)+(formula/2.0) and animation_frame <= (formula*26)+(formula/2.0):
				grado = 26
			elif animation_frame  > (formula*26)+(formula/2.0) and animation_frame <= (formula*27)+(formula/2.0):
				grado = 27
			elif animation_frame  > (formula*27)+(formula/2.0) and animation_frame <= (formula*28)+(formula/2.0):
				grado = 28
			elif animation_frame  > (formula*28)+(formula/2.0) and animation_frame <= (formula*29)+(formula/2.0):
				grado = 29
			elif animation_frame  > (formula*29)+(formula/2.0) and animation_frame <= (formula*30)+(formula/2.0):
				grado = 30
			elif animation_frame  > (formula*30)+(formula/2.0) and animation_frame <= (formula*31)+(formula/2.0):
				grado = 31
			elif animation_frame  > (formula*31)+(formula/2.0) and animation_frame <= (formula*32)+(formula/2.0):
				grado = 32
			elif animation_frame  > (formula*32)+(formula/2.0) and animation_frame <= (formula*33)+(formula/2.0):
				grado = 33
			elif animation_frame  > (formula*33)+(formula/2.0) and animation_frame <= (formula*34)+(formula/2.0):
				grado = 34
			elif animation_frame  > (formula*34)+(formula/2.0) and animation_frame <= (formula*35)+(formula/2.0):
				grado = 35
			elif animation_frame  > (formula*35)+(formula/2.0) and animation_frame <= (formula*36)+(formula/2.0):
				grado = 36
			elif animation_frame  > (formula*36)+(formula/2.0) and animation_frame <= (formula*37)+(formula/2.0):
				grado = 37
			elif animation_frame  > (formula*37)+(formula/2.0) and animation_frame <= (formula*38)+(formula/2.0):
				grado = 38
			elif animation_frame  > (formula*38)+(formula/2.0) and animation_frame <= (formula*39)+(formula/2.0):
				grado = 39
			elif animation_frame  > (formula*39)+(formula/2.0) and animation_frame <= (formula*40)+(formula/2.0):
				grado = 40
			elif animation_frame  > (formula*40)+(formula/2.0) and animation_frame <= (formula*41)+(formula/2.0):
				grado = 41
			elif animation_frame  > (formula*41)+(formula/2.0) and animation_frame <= (formula*42)+(formula/2.0):
				grado = 42
			elif animation_frame  > (formula*42)+(formula/2.0) and animation_frame <= (formula*43)+(formula/2.0):
				grado = 43
			elif animation_frame  > (formula*43)+(formula/2.0) and animation_frame <= (formula*44)+(formula/2.0):
				grado = 44
			elif animation_frame  > (formula*44)+(formula/2.0) and animation_frame <= (formula*45)+(formula/2.0):
				grado = 45
			elif animation_frame  > (formula*45)+(formula/2.0) and animation_frame <= (formula*46)+(formula/2.0):
				grado = 46
			elif animation_frame  > (formula*46)+(formula/2.0) and animation_frame <= (formula*47)+(formula/2.0):
				grado = 47
			elif animation_frame  > (formula*47)+(formula/2.0) and animation_frame <= (formula*48)+(formula/2.0):
				grado = 48
			elif animation_frame  > (formula*48)+(formula/2.0) and animation_frame <= (formula*49)+(formula/2.0):
				grado = 49
			elif animation_frame  > (formula*49)+(formula/2.0) and animation_frame <= (formula*50)+(formula/2.0):
				grado = 50
			elif animation_frame  > (formula*50)+(formula/2.0) and animation_frame <= (formula*51)+(formula/2.0):
				grado = 51
			elif animation_frame  > (formula*51)+(formula/2.0) and animation_frame <= (formula*52)+(formula/2.0):
				grado = 52
			elif animation_frame  > (formula*52)+(formula/2.0) and animation_frame <= (formula*53)+(formula/2.0):
				grado = 53
			elif animation_frame  > (formula*53)+(formula/2.0) and animation_frame <= (formula*54)+(formula/2.0):
				grado = 54
			elif animation_frame  > (formula*54)+(formula/2.0) and animation_frame <= (formula*55)+(formula/2.0):
				grado = 55
			elif animation_frame  > (formula*55)+(formula/2.0) and animation_frame <= (formula*56)+(formula/2.0):
				grado = 56
			elif animation_frame  > (formula*56)+(formula/2.0) and animation_frame <= (formula*57)+(formula/2.0):
				grado = 57
			elif animation_frame  > (formula*57)+(formula/2.0) and animation_frame <= (formula*58)+(formula/2.0):
				grado = 58
			elif animation_frame  > (formula*58)+(formula/2.0) and animation_frame <= (formula*59)+(formula/2.0):
				grado = 59
			elif animation_frame  > (formula*59)+(formula/2.0) and animation_frame <= (formula*60)+(formula/2.0):
				grado = 60
			elif animation_frame  > (formula*60)+(formula/2.0) and animation_frame <= (formula*61)+(formula/2.0):
				grado = 61
			elif animation_frame  > (formula*61)+(formula/2.0) and animation_frame <= (formula*62)+(formula/2.0):
				grado = 62
			elif animation_frame  > (formula*62)+(formula/2.0) and animation_frame <= (formula*63)+(formula/2.0):
				grado = 63
			elif animation_frame  > (formula*63)+(formula/2.0) and animation_frame <= (formula*64)+(formula/2.0):
				grado = 64
			elif animation_frame  > (formula*64)+(formula/2.0) and animation_frame <= (formula*65)+(formula/2.0):
				grado = 65
			elif animation_frame  > (formula*65)+(formula/2.0) and animation_frame <= (formula*66)+(formula/2.0):
				grado = 66
			elif animation_frame  > (formula*66)+(formula/2.0) and animation_frame <= (formula*67)+(formula/2.0):
				grado = 67
			elif animation_frame  > (formula*67)+(formula/2.0) and animation_frame <= (formula*68)+(formula/2.0):
				grado = 68
			elif animation_frame  > (formula*68)+(formula/2.0) and animation_frame <= (formula*69)+(formula/2.0):
				grado = 69
			elif animation_frame  > (formula*69)+(formula/2.0) and animation_frame <= (formula*70)+(formula/2.0):
				grado = 70
			elif animation_frame  > (formula*70)+(formula/2.0) and animation_frame <= (formula*71)+(formula/2.0):
				grado = 71
			elif animation_frame  > (formula*71)+(formula/2.0) or animation_frame < -((formula*71)+(formula/2.0)):
				grado = 72
				
				
			elif animation_frame  >= -((formula*71)+(formula/2.0)) and animation_frame < -((formula*70)+(formula/2.0)):
				grado = 73
			elif animation_frame  >= -((formula*70)+(formula/2.0)) and animation_frame < -((formula*69)+(formula/2.0)):
				grado = 74
			elif animation_frame  >= -((formula*69)+(formula/2.0)) and animation_frame < -((formula*68)+(formula/2.0)):
				grado = 75
			elif animation_frame  >= -((formula*68)+(formula/2.0)) and animation_frame < -((formula*67)+(formula/2.0)):
				grado = 76
			elif animation_frame  >= -((formula*67)+(formula/2.0)) and animation_frame < -((formula*66)+(formula/2.0)):
				grado = 77
			elif animation_frame  >= -((formula*66)+(formula/2.0)) and animation_frame < -((formula*65)+(formula/2.0)):
				grado = 78
			elif animation_frame  >= -((formula*65)+(formula/2.0)) and animation_frame < -((formula*64)+(formula/2.0)):
				grado = 79
			elif animation_frame  >= -((formula*64)+(formula/2.0)) and animation_frame < -((formula*63)+(formula/2.0)):
				grado = 80
			elif animation_frame  >= -((formula*63)+(formula/2.0)) and animation_frame < -((formula*62)+(formula/2.0)):
				grado = 81
			elif animation_frame  >= -((formula*62)+(formula/2.0)) and animation_frame < -((formula*61)+(formula/2.0)):
				grado = 82
			elif animation_frame  >= -((formula*61)+(formula/2.0)) and animation_frame < -((formula*60)+(formula/2.0)):
				grado = 83
			elif animation_frame  >= -((formula*60)+(formula/2.0)) and animation_frame < -((formula*59)+(formula/2.0)):
				grado = 84
			elif animation_frame  >= -((formula*59)+(formula/2.0)) and animation_frame < -((formula*58)+(formula/2.0)):
				grado = 85
			elif animation_frame  >= -((formula*58)+(formula/2.0)) and animation_frame < -((formula*57)+(formula/2.0)):
				grado = 86
			elif animation_frame  >= -((formula*57)+(formula/2.0)) and animation_frame < -((formula*56)+(formula/2.0)):
				grado = 87
			elif animation_frame  >= -((formula*56)+(formula/2.0)) and animation_frame < -((formula*55)+(formula/2.0)):
				grado = 88
			elif animation_frame  >= -((formula*55)+(formula/2.0)) and animation_frame < -((formula*54)+(formula/2.0)):
				grado = 89
			elif animation_frame  >= -((formula*54)+(formula/2.0)) and animation_frame < -((formula*53)+(formula/2.0)):
				grado = 90
			elif animation_frame  >= -((formula*53)+(formula/2.0)) and animation_frame < -((formula*52)+(formula/2.0)):
				grado = 91
			elif animation_frame  >= -((formula*52)+(formula/2.0)) and animation_frame < -((formula*51)+(formula/2.0)):
				grado = 92
			elif animation_frame  >= -((formula*51)+(formula/2.0)) and animation_frame < -((formula*50)+(formula/2.0)):
				grado = 93
			elif animation_frame  >= -((formula*50)+(formula/2.0)) and animation_frame < -((formula*49)+(formula/2.0)):
				grado = 94
			elif animation_frame  >= -((formula*49)+(formula/2.0)) and animation_frame < -((formula*48)+(formula/2.0)):
				grado = 95
			elif animation_frame  >= -((formula*48)+(formula/2.0)) and animation_frame < -((formula*47)+(formula/2.0)):
				grado = 96
			elif animation_frame  >= -((formula*47)+(formula/2.0)) and animation_frame < -((formula*46)+(formula/2.0)):
				grado = 97
			elif animation_frame  >= -((formula*46)+(formula/2.0)) and animation_frame < -((formula*45)+(formula/2.0)):
				grado = 98
			elif animation_frame  >= -((formula*45)+(formula/2.0)) and animation_frame < -((formula*44)+(formula/2.0)):
				grado = 99
			elif animation_frame  >= -((formula*44)+(formula/2.0)) and animation_frame < -((formula*43)+(formula/2.0)):
				grado = 100
			elif animation_frame  >= -((formula*43)+(formula/2.0)) and animation_frame < -((formula*42)+(formula/2.0)):
				grado = 101
			elif animation_frame  >= -((formula*42)+(formula/2.0)) and animation_frame < -((formula*41)+(formula/2.0)):
				grado = 102
			elif animation_frame  >= -((formula*41)+(formula/2.0)) and animation_frame < -((formula*40)+(formula/2.0)):
				grado = 103
			elif animation_frame  >= -((formula*40)+(formula/2.0)) and animation_frame < -((formula*39)+(formula/2.0)):
				grado = 104
			elif animation_frame  >= -((formula*39)+(formula/2.0)) and animation_frame < -((formula*38)+(formula/2.0)):
				grado = 105
			elif animation_frame  >= -((formula*38)+(formula/2.0)) and animation_frame < -((formula*37)+(formula/2.0)):
				grado = 106
			elif animation_frame  >= -((formula*37)+(formula/2.0)) and animation_frame < -((formula*36)+(formula/2.0)):
				grado = 107
			elif animation_frame  >= -((formula*36)+(formula/2.0)) and animation_frame < -((formula*35)+(formula/2.0)):
				grado = 108
			elif animation_frame  >= -((formula*35)+(formula/2.0)) and animation_frame < -((formula*34)+(formula/2.0)):
				grado = 109
			elif animation_frame  >= -((formula*34)+(formula/2.0)) and animation_frame < -((formula*33)+(formula/2.0)):
				grado = 110
			elif animation_frame  >= -((formula*33)+(formula/2.0)) and animation_frame < -((formula*32)+(formula/2.0)):
				grado = 111
			elif animation_frame  >= -((formula*32)+(formula/2.0)) and animation_frame < -((formula*31)+(formula/2.0)):
				grado = 112
			elif animation_frame  >= -((formula*31)+(formula/2.0)) and animation_frame < -((formula*30)+(formula/2.0)):
				grado = 113
			elif animation_frame  >= -((formula*30)+(formula/2.0)) and animation_frame < -((formula*29)+(formula/2.0)):
				grado = 114
			elif animation_frame  >= -((formula*29)+(formula/2.0)) and animation_frame < -((formula*28)+(formula/2.0)):
				grado = 115
			elif animation_frame  >= -((formula*28)+(formula/2.0)) and animation_frame < -((formula*27)+(formula/2.0)):
				grado = 116
			elif animation_frame  >= -((formula*27)+(formula/2.0)) and animation_frame < -((formula*26)+(formula/2.0)):
				grado = 117
			elif animation_frame  >= -((formula*26)+(formula/2.0)) and animation_frame < -((formula*25)+(formula/2.0)):
				grado = 118
			elif animation_frame  >= -((formula*25)+(formula/2.0)) and animation_frame < -((formula*24)+(formula/2.0)):
				grado = 119
			elif animation_frame  >= -((formula*24)+(formula/2.0)) and animation_frame < -((formula*23)+(formula/2.0)):
				grado = 120
			elif animation_frame  >= -((formula*23)+(formula/2.0)) and animation_frame < -((formula*22)+(formula/2.0)):
				grado = 121
			elif animation_frame  >= -((formula*22)+(formula/2.0)) and animation_frame < -((formula*21)+(formula/2.0)):
				grado = 122
			elif animation_frame  >= -((formula*21)+(formula/2.0)) and animation_frame < -((formula*20)+(formula/2.0)):
				grado = 123
			elif animation_frame  >= -((formula*20)+(formula/2.0)) and animation_frame < -((formula*19)+(formula/2.0)):
				grado = 124
			elif animation_frame  >= -((formula*19)+(formula/2.0)) and animation_frame < -((formula*18)+(formula/2.0)):
				grado = 125
			elif animation_frame  >= -((formula*18)+(formula/2.0)) and animation_frame < -((formula*17)+(formula/2.0)):
				grado = 126
			elif animation_frame  >= -((formula*17)+(formula/2.0)) and animation_frame < -((formula*16)+(formula/2.0)):
				grado = 127
			elif animation_frame  >= -((formula*16)+(formula/2.0)) and animation_frame < -((formula*15)+(formula/2.0)):
				grado = 128
			elif animation_frame  >= -((formula*15)+(formula/2.0)) and animation_frame < -((formula*14)+(formula/2.0)):
				grado = 129
			elif animation_frame  >= -((formula*14)+(formula/2.0)) and animation_frame < -((formula*13)+(formula/2.0)):
				grado = 130
			elif animation_frame  >= -((formula*13)+(formula/2.0)) and animation_frame < -((formula*12)+(formula/2.0)):
				grado = 131
			elif animation_frame  >= -((formula*12)+(formula/2.0)) and animation_frame < -((formula*11)+(formula/2.0)):
				grado = 132
			elif animation_frame  >= -((formula*11)+(formula/2.0)) and animation_frame < -((formula*10)+(formula/2.0)):
				grado = 133
			elif animation_frame  >= -((formula*10)+(formula/2.0)) and animation_frame < -((formula*9)+(formula/2.0)):
				grado = 134
			elif animation_frame  >= -((formula*9)+(formula/2.0)) and animation_frame < -((formula*8)+(formula/2.0)):
				grado = 135
			elif animation_frame  >= -((formula*8)+(formula/2.0)) and animation_frame < -((formula*7)+(formula/2.0)):
				grado = 136
			elif animation_frame  >= -((formula*7)+(formula/2.0)) and animation_frame < -((formula*6)+(formula/2.0)):
				grado = 137
			elif animation_frame  >= -((formula*6)+(formula/2.0)) and animation_frame < -((formula*5)+(formula/2.0)):
				grado = 138
			elif animation_frame  >= -((formula*5)+(formula/2.0)) and animation_frame < -((formula*4)+(formula/2.0)):
				grado = 139
			elif animation_frame  >= -((formula*4)+(formula/2.0)) and animation_frame < -((formula*3)+(formula/2.0)):
				grado = 140
			elif animation_frame  >= -((formula*3)+(formula/2.0)) and animation_frame < -((formula*2)+(formula/2.0)):
				grado = 141
			elif animation_frame  >= -((formula*2)+(formula/2.0)) and animation_frame < -((formula*1)+(formula/2.0)):
				grado = 142
			elif animation_frame  >= -((formula*1)+(formula/2.0)) and animation_frame < -(formula/2.0):
				grado = 143
			
			#____________________________
			# From the north, counterclockwise ___________________
			if grado == 0:
				my_orientation = cardinal15.north
			if grado == 1:
				my_orientation = cardinal15.north_west35
			if grado == 2:
				my_orientation = cardinal15.north_west34
			if grado == 3:
				my_orientation = cardinal15.north_west33
			if grado == 4:
				my_orientation = cardinal15.north_west32
			if grado == 5:
				my_orientation = cardinal15.north_west31
			if grado == 6:
				my_orientation = cardinal15.north_west30
			if grado == 7:
				my_orientation = cardinal15.north_west29
			if grado == 8:
				my_orientation = cardinal15.north_west28
			if grado == 9:
				my_orientation = cardinal15.north_west27
			if grado == 10:
				my_orientation = cardinal15.north_west26
			if grado == 11:
				my_orientation = cardinal15.north_west25
			if grado == 12:
				my_orientation = cardinal15.north_west24
			if grado == 13:
				my_orientation = cardinal15.north_west23
			if grado == 14:
				my_orientation = cardinal15.north_west22
			if grado == 15:
				my_orientation = cardinal15.north_west21
			if grado == 16:
				my_orientation = cardinal15.north_west20
			if grado == 17:
				my_orientation = cardinal15.north_west19
			if grado == 18:
				my_orientation = cardinal15.north_west18
			if grado == 19:
				my_orientation = cardinal15.north_west17
			if grado == 20:
				my_orientation = cardinal15.north_west16
			if grado == 21:
				my_orientation = cardinal15.north_west15
			if grado == 22:
				my_orientation = cardinal15.north_west14
			if grado == 23:
				my_orientation = cardinal15.north_west13
			if grado == 24:
				my_orientation = cardinal15.north_west12
			if grado == 25:
				my_orientation = cardinal15.north_west11
			if grado == 26:
				my_orientation = cardinal15.north_west10
			if grado == 27:
				my_orientation = cardinal15.north_west9
			if grado == 28:
				my_orientation = cardinal15.north_west8
			if grado == 29:
				my_orientation = cardinal15.north_west7
			if grado == 30:
				my_orientation = cardinal15.north_west6
			if grado == 31:
				my_orientation = cardinal15.north_west5
			if grado == 32:
				my_orientation = cardinal15.north_west4
			if grado == 33:
				my_orientation = cardinal15.north_west3
			if grado == 34:
				my_orientation = cardinal15.north_west2
			if grado == 35:
				my_orientation = cardinal15.north_west1
			if grado == 36:
				my_orientation = cardinal15.west
			if grado == 37:
				my_orientation = cardinal15.south_west35
			if grado == 38:
				my_orientation = cardinal15.south_west34
			if grado == 39:
				my_orientation = cardinal15.south_west33
			if grado == 40:
				my_orientation = cardinal15.south_west32
			if grado == 41:
				my_orientation = cardinal15.south_west31
			if grado == 42:
				my_orientation = cardinal15.south_west30
			if grado == 43:
				my_orientation = cardinal15.south_west29
			if grado == 44:
				my_orientation = cardinal15.south_west28
			if grado == 45:
				my_orientation = cardinal15.south_west27
			if grado == 46:
				my_orientation = cardinal15.south_west26
			if grado == 47:
				my_orientation = cardinal15.south_west25
			if grado == 48:
				my_orientation = cardinal15.south_west24
			if grado == 49:
				my_orientation = cardinal15.south_west23
			if grado == 50:
				my_orientation = cardinal15.south_west22
			if grado == 51:
				my_orientation = cardinal15.south_west21
			if grado == 52:
				my_orientation = cardinal15.south_west20
			if grado == 53:
				my_orientation = cardinal15.south_west19
			if grado == 54:
				my_orientation = cardinal15.south_west18
			if grado == 55:
				my_orientation = cardinal15.south_west17
			if grado == 56:
				my_orientation = cardinal15.south_west16
			if grado == 57:
				my_orientation = cardinal15.south_west15
			if grado == 58:
				my_orientation = cardinal15.south_west14
			if grado == 59:
				my_orientation = cardinal15.south_west13
			if grado == 60:
				my_orientation = cardinal15.south_west12
			if grado == 61:
				my_orientation = cardinal15.south_west11
			if grado == 62:
				my_orientation = cardinal15.south_west10
			if grado == 63:
				my_orientation = cardinal15.south_west9
			if grado == 64:
				my_orientation = cardinal15.south_west8
			if grado == 65:
				my_orientation = cardinal15.south_west7
			if grado == 66:
				my_orientation = cardinal15.south_west6
			if grado == 67:
				my_orientation = cardinal15.south_west5
			if grado == 68:
				my_orientation = cardinal15.south_west4
			if grado == 69:
				my_orientation = cardinal15.south_west3
			if grado == 70:
				my_orientation = cardinal15.south_west2
			if grado == 71:
				my_orientation = cardinal15.south_west1
				
				
			if grado == 72:
				my_orientation = cardinal15.south
			if grado == 73:
				my_orientation = cardinal15.south_east35
			if grado == 74:
				my_orientation = cardinal15.south_east34
			if grado == 75:
				my_orientation = cardinal15.south_east33
			if grado == 76:
				my_orientation = cardinal15.south_east32
			if grado == 77:
				my_orientation = cardinal15.south_east31
			if grado == 78:
				my_orientation = cardinal15.south_east30
			if grado == 79:
				my_orientation = cardinal15.south_east29
			if grado == 80:
				my_orientation = cardinal15.south_east28
			if grado == 81:
				my_orientation = cardinal15.south_east27
			if grado == 82:
				my_orientation = cardinal15.south_east26
			if grado == 83:
				my_orientation = cardinal15.south_east25
			if grado == 84:
				my_orientation = cardinal15.south_east24
			if grado == 85:
				my_orientation = cardinal15.south_east23
			if grado == 86:
				my_orientation = cardinal15.south_east22
			if grado == 87:
				my_orientation = cardinal15.south_east21
			if grado == 88:
				my_orientation = cardinal15.south_east20
			if grado == 89:
				my_orientation = cardinal15.south_east19
			if grado == 90:
				my_orientation = cardinal15.south_east18
			if grado == 91:
				my_orientation = cardinal15.south_east17
			if grado == 92:
				my_orientation = cardinal15.south_east16
			if grado == 93:
				my_orientation = cardinal15.south_east15
			if grado == 94:
				my_orientation = cardinal15.south_east14
			if grado == 95:
				my_orientation = cardinal15.south_east13
			if grado == 96:
				my_orientation = cardinal15.south_east12
			if grado == 97:
				my_orientation = cardinal15.south_east11
			if grado == 98:
				my_orientation = cardinal15.south_east10
			if grado == 99:
				my_orientation = cardinal15.south_east9
			if grado == 100:
				my_orientation = cardinal15.south_east8
			if grado == 101:
				my_orientation = cardinal15.south_east7
			if grado == 102:
				my_orientation = cardinal15.south_east6
			if grado == 103:
				my_orientation = cardinal15.south_east5
			if grado == 104:
				my_orientation = cardinal15.south_east4
			if grado == 105:
				my_orientation = cardinal15.south_east3
			if grado == 106:
				my_orientation = cardinal15.south_east2
			if grado == 107:
				my_orientation = cardinal15.south_east1
			if grado == 108:
				my_orientation = cardinal15.east
			if grado == 109:
				my_orientation = cardinal15.north_east35
			if grado == 110:
				my_orientation = cardinal15.north_east34
			if grado == 111:
				my_orientation = cardinal15.north_east33
			if grado == 112:
				my_orientation = cardinal15.north_east32
			if grado == 113:
				my_orientation = cardinal15.north_east31
			if grado == 114:
				my_orientation = cardinal15.north_east30
			if grado == 115:
				my_orientation = cardinal15.north_east29
			if grado == 116:
				my_orientation = cardinal15.north_east28
			if grado == 117:
				my_orientation = cardinal15.north_east27
			if grado == 118:
				my_orientation = cardinal15.north_east26
			if grado == 119:
				my_orientation = cardinal15.north_east25
			if grado == 120:
				my_orientation = cardinal15.north_east24
			if grado == 121:
				my_orientation = cardinal15.north_east23
			if grado == 122:
				my_orientation = cardinal15.north_east22
			if grado == 123:
				my_orientation = cardinal15.north_east21
			if grado == 124:
				my_orientation = cardinal15.north_east20
			if grado == 125:
				my_orientation = cardinal15.north_east19
			if grado == 126:
				my_orientation = cardinal15.north_east18
			if grado == 127:
				my_orientation = cardinal15.north_east17
			if grado == 128:
				my_orientation = cardinal15.north_east16
			if grado == 129:
				my_orientation = cardinal15.north_east15
			if grado == 130:
				my_orientation = cardinal15.north_east14
			if grado == 131:
				my_orientation = cardinal15.north_east13
			if grado == 132:
				my_orientation = cardinal15.north_east12
			if grado == 133:
				my_orientation = cardinal15.north_east11
			if grado == 134:
				my_orientation = cardinal15.north_east10
			if grado == 135:
				my_orientation = cardinal15.north_east9
			if grado == 136:
				my_orientation = cardinal15.north_east8
			if grado == 137:
				my_orientation = cardinal15.north_east7
			if grado == 138:
				my_orientation = cardinal15.north_east6
			if grado == 139:
				my_orientation = cardinal15.north_east5
			if grado == 140:
				my_orientation = cardinal15.north_east4
			if grado == 141:
				my_orientation = cardinal15.north_east3
			if grado == 142:
				my_orientation = cardinal15.north_east2
			if grado == 143:
				my_orientation = cardinal15.north_east1
					
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


func CheckRotation2D(_target:Node2D) ->float:
	var point:Vector2 = _target.global_position + (_target.global_transform.basis_xform(Vector2.UP)*1)
	var dir_target :Vector2 = (_target.global_position - point).normalized()
	var rotation_target :float = rad_to_deg(atan2(dir_target.x, dir_target.y))
	return  rotation_target


func CheckRotation3D(_target:Node3D, _distance_point:float) ->float:
	var point:Vector3 = _target.global_position + (_target.global_basis.z.normalized() * _distance_point)
	var dir_target :Vector3 = (_target.global_position - point).normalized()
	var rotation_target :float = rad_to_deg(atan2(dir_target.x, dir_target.z))
	return  rotation_target

func CheckCameraAngle( reference_point:Vector3, direction_normal: Vector3, target_point:Vector3)  -> float:
	var direction_radar = target_point - reference_point
	var front = direction_normal
	var angulo_rotacion = Vector2(front.x, front.z).angle_to(Vector2(direction_radar.x, direction_radar.z))
	return angulo_rotacion
