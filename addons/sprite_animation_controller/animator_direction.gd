class_name AnimatorDirection
extends Resource

## Choose the corresponding section you are working on,
## depending on whether your game is 2D or 3D
@export_enum(
	"Editor 2D", 
	"Editor 3D",
)  var tipo_apartado:int
	
enum cardinal_direction {
	X4, X8,	X12, X16, X20, X24, X32, X36, X40,
	X48, X64, X80, X96, X100,
	X144
}

# Diccionario para mapeo instantáneo
var DATA_MAP = {
	cardinal_direction.X4: X4_GRADO_TO_ENUM, # (Nota: en tu código usabas X8 para X4, corrígelo si es necesario)
	cardinal_direction.X8: X8_GRADO_TO_ENUM,
	cardinal_direction.X12: X12_GRADO_TO_ENUM,
	cardinal_direction.X16: X16_GRADO_TO_ENUM,
	cardinal_direction.X20: X20_GRADO_TO_ENUM,
	cardinal_direction.X24: X24_GRADO_TO_ENUM,
	cardinal_direction.X32: X32_GRADO_TO_ENUM,
	cardinal_direction.X36: X36_GRADO_TO_ENUM,
	cardinal_direction.X40: X40_GRADO_TO_ENUM,
	cardinal_direction.X48: X48_GRADO_TO_ENUM,
	cardinal_direction.X64: X64_GRADO_TO_ENUM,
	cardinal_direction.X80: X80_GRADO_TO_ENUM,
	cardinal_direction.X96: X96_GRADO_TO_ENUM,
	cardinal_direction.X100: X100_GRADO_TO_ENUM,
	cardinal_direction.X144: X144_GRADO_TO_ENUM
}
## Choose the number of "directions" to calculate,
## verify that it corresponds to the same number of "directions" in your sprite sheet in the corresponding animation
@export var directions_number : cardinal_direction
## corresponds to the camera node of the active environment, or failing that, a node that fulfills this function for 2D cases,
## a specific node must be added to the group
@export  var actor_target_group : String = "camera"
@export_category("EDITOR 2D")
## MANUAL: performs the calculation directly without the camera in between, 
## the direction in which the player moves must be manually entered
## ROTATE NODE: Performs the calculation taking into account the direction of rotation of the players with respect to the direction of rotation of the camera,
## this mode is special when the configuration of the players' nodes are rotating, even the camera node can rotate.
@export_enum(
	"ROTATE NODE",
	"MANUAL DIRECTION",
	"AUTOMATIC DIRECTION",
) var type_calculation :String = "ROTATE NODE"
### Direction in which the player is facing forward,
### for it to work correctly the player must move forward on the -y axis
#@export var manual_direction :Vector2
##
@export var adjust_velocity_up :float = 1.0
#_______________________________________________
@export_category("EDITOR 3D")
@export var compensate_camera_perspective :bool = true
#___ seccion 1 ___________
enum cardinal0 {south,west, north, east}

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

const X4_GRADO_TO_ENUM = [
	cardinal1.north,
	cardinal1.west,
	cardinal1.south,
	cardinal1.east,
]

const X8_GRADO_TO_ENUM = [
	cardinal1.north,
	cardinal1.north_west,
	cardinal1.west,
	cardinal1.south_west,
	cardinal1.south,
	cardinal1.south_east,
	cardinal1.east,
	cardinal1.north_east
]

const X12_GRADO_TO_ENUM = [
	cardinal2.north,        # Grado 0: Norte
	cardinal2.north_west2,  # Grado 1: Noroeste 2
	cardinal2.north_west1,  # Grado 2: Noroeste 1
	cardinal2.west,         # Grado 3: Oeste
	cardinal2.south_west2,  # Grado 4: Suroeste 2
	cardinal2.south_west1,  # Grado 5: Suroeste 1
	cardinal2.south,        # Grado 6: Sur
	cardinal2.south_east2,  # Grado 7: Sureste 2
	cardinal2.south_east1,  # Grado 8: Sureste 1
	cardinal2.east,         # Grado 9: Este
	cardinal2.north_east2,  # Grado 10: Noreste 2
	cardinal2.north_east1,  # Grado 11: Noreste 1
]

const X16_GRADO_TO_ENUM = [
	cardinal3.north,
	cardinal3.north_west3,
	cardinal3.north_west2,
	cardinal3.north_west1,
	cardinal3.west,
	cardinal3.south_west3,
	cardinal3.south_west2,
	cardinal3.south_west1,
	cardinal3.south,
	cardinal3.south_east3,
	cardinal3.south_east2,
	cardinal3.south_east1,
	cardinal3.east,
	cardinal3.north_east3,
	cardinal3.north_east2,
	cardinal3.north_east1
]

const X20_GRADO_TO_ENUM = [
	cardinal4.north,
	cardinal4.north_west4,
	cardinal4.north_west3,
	cardinal4.north_west2,
	cardinal4.north_west1,
	cardinal4.west,
	cardinal4.south_west4,
	cardinal4.south_west3,
	cardinal4.south_west2,
	cardinal4.south_west1,
	cardinal4.south,
	cardinal4.south_east4,
	cardinal4.south_east3,
	cardinal4.south_east2,
	cardinal4.south_east1,
	cardinal4.east,
	cardinal4.north_east4,
	cardinal4.north_east3,
	cardinal4.north_east2,
	cardinal4.north_east1,
]

const X24_GRADO_TO_ENUM = [
	cardinal5.north,
	cardinal5.north_west5,
	cardinal5.north_west4,
	cardinal5.north_west3,
	cardinal5.north_west2,
	cardinal5.north_west1,
	cardinal5.west,
	cardinal5.south_west5,
	cardinal5.south_west4,
	cardinal5.south_west3,
	cardinal5.south_west2,
	cardinal5.south_west1,
	cardinal5.south,
	cardinal5.south_east5,
	cardinal5.south_east4,
	cardinal5.south_east3,
	cardinal5.south_east2,
	cardinal5.south_east1,
	cardinal5.east,
	cardinal5.north_east5,
	cardinal5.north_east4,
	cardinal5.north_east3,
	cardinal5.north_east2,
	cardinal5.north_east1,
]


const X32_GRADO_TO_ENUM = [
	# Sector NORTE (Grado 0 - 7)
	cardinal6.north,
	cardinal6.north_west7, cardinal6.north_west6, cardinal6.north_west5,
	cardinal6.north_west4, cardinal6.north_west3, cardinal6.north_west2,
	cardinal6.north_west1,
	
	# Sector OESTE (Grado 8 - 15)
	cardinal6.west,
	cardinal6.south_west7, cardinal6.south_west6, cardinal6.south_west5,
	cardinal6.south_west4, cardinal6.south_west3, cardinal6.south_west2,
	cardinal6.south_west1,
	
	# Sector SUR (Grado 16 - 23)
	cardinal6.south,
	cardinal6.south_east7, cardinal6.south_east6, cardinal6.south_east5,
	cardinal6.south_east4, cardinal6.south_east3, cardinal6.south_east2,
	cardinal6.south_east1,
	
	# Sector ESTE (Grado 24 - 31)
	cardinal6.east,
	cardinal6.north_east7, cardinal6.north_east6, cardinal6.north_east5,
	cardinal6.north_east4, cardinal6.north_east3, cardinal6.north_east2,
	cardinal6.north_east1,
]

const X36_GRADO_TO_ENUM = [
	# Sector NORTE (Grado 0 - 8)
	cardinal7.north,
	cardinal7.north_west8, cardinal7.north_west7, cardinal7.north_west6,
	cardinal7.north_west5, cardinal7.north_west4, cardinal7.north_west3,
	cardinal7.north_west2, cardinal7.north_west1,
	
	# Sector OESTE (Grado 9 - 17)
	cardinal7.west,
	cardinal7.south_west8, cardinal7.south_west7, cardinal7.south_west6,
	cardinal7.south_west5, cardinal7.south_west4, cardinal7.south_west3,
	cardinal7.south_west2, cardinal7.south_west1,
	
	# Sector SUR (Grado 18 - 26)
	cardinal7.south,
	cardinal7.south_east8, cardinal7.south_east7, cardinal7.south_east6,
	cardinal7.south_east5, cardinal7.south_east4, cardinal7.south_east3,
	cardinal7.south_east2, cardinal7.south_east1,
	
	# Sector ESTE (Grado 27 - 35)
	cardinal7.east,
	cardinal7.north_east8, cardinal7.north_east7, cardinal7.north_east6,
	cardinal7.north_east5, cardinal7.north_east4, cardinal7.north_east3,
	cardinal7.north_east2, cardinal7.north_east1,
]

const X40_GRADO_TO_ENUM = [
	# Sector NORTE (Grado 0 - 9)
	cardinal8.north,
	cardinal8.north_west9, cardinal8.north_west8, cardinal8.north_west7,
	cardinal8.north_west6, cardinal8.north_west5, cardinal8.north_west4,
	cardinal8.north_west3, cardinal8.north_west2, cardinal8.north_west1,
	
	# Sector OESTE (Grado 10 - 19)
	cardinal8.west,
	cardinal8.south_west9, cardinal8.south_west8, cardinal8.south_west7,
	cardinal8.south_west6, cardinal8.south_west5, cardinal8.south_west4,
	cardinal8.south_west3, cardinal8.south_west2, cardinal8.south_west1,
	
	# Sector SUR (Grado 20 - 29)
	cardinal8.south,
	cardinal8.south_east9, cardinal8.south_east8, cardinal8.south_east7,
	cardinal8.south_east6, cardinal8.south_east5, cardinal8.south_east4,
	cardinal8.south_east3, cardinal8.south_east2, cardinal8.south_east1,
	
	# Sector ESTE (Grado 30 - 39)
	cardinal8.east,
	cardinal8.north_east9, cardinal8.north_east8, cardinal8.north_east7,
	cardinal8.north_east6, cardinal8.north_east5, cardinal8.north_east4,
	cardinal8.north_east3, cardinal8.north_east2, cardinal8.north_east1,
]

const X48_GRADO_TO_ENUM = [
	# ---------------------- SECTOR NORTE ----------------------
	cardinal9.north, 
	
	
	cardinal9.north_west11, cardinal9.north_west10, cardinal9.north_west9,
	cardinal9.north_west8, cardinal9.north_west7, cardinal9.north_west6,
	cardinal9.north_west5, cardinal9.north_west4, cardinal9.north_west3,
	cardinal9.north_west2, cardinal9.north_west1,

	# ---------------------- SECTOR OESTE ----------------------
	cardinal9.west,

	
	cardinal9.south_west11, cardinal9.south_west10, cardinal9.south_west9,
	cardinal9.south_west8, cardinal9.south_west7, cardinal9.south_west6,
	cardinal9.south_west5, cardinal9.south_west4, cardinal9.south_west3,
	cardinal9.south_west2, cardinal9.south_west1,

	# ---------------------- SECTOR SUR  ----------------------
	cardinal9.south,

	
	cardinal9.south_east11, cardinal9.south_east10, cardinal9.south_east9,
	cardinal9.south_east8, cardinal9.south_east7, cardinal9.south_east6,
	cardinal9.south_east5, cardinal9.south_east4, cardinal9.south_east3,
	cardinal9.south_east2, cardinal9.south_east1,

	# ---------------------- SECTOR ESTE  ----------------------
	cardinal9.east,

	
	cardinal9.north_east11, cardinal9.north_east10, cardinal9.north_east9,
	cardinal9.north_east8, cardinal9.north_east7, cardinal9.north_east6,
	cardinal9.north_east5, cardinal9.north_east4, cardinal9.north_east3,
	cardinal9.north_east2, cardinal9.north_east1,
]

const X64_GRADO_TO_ENUM = [
	# ---------------------- SECTOR NORTE ----------------------
	cardinal10.north, 
	
	
	cardinal10.north_west15,
	cardinal10.north_west14, cardinal10.north_west13, cardinal10.north_west12,
	cardinal10.north_west11, cardinal10.north_west10, cardinal10.north_west9,
	cardinal10.north_west8, cardinal10.north_west7, cardinal10.north_west6,
	cardinal10.north_west5, cardinal10.north_west4, cardinal10.north_west3,
	cardinal10.north_west2, cardinal10.north_west1,

	# ---------------------- SECTOR OESTE ----------------------
	cardinal10.west,
	
	
	cardinal10.south_west15,
	cardinal10.south_west14, cardinal10.south_west13, cardinal10.south_west12,
	cardinal10.south_west11, cardinal10.south_west10, cardinal10.south_west9,
	cardinal10.south_west8, cardinal10.south_west7, cardinal10.south_west6,
	cardinal10.south_west5, cardinal10.south_west4, cardinal10.south_west3,
	cardinal10.south_west2, cardinal10.south_west1,
	
	# ---------------------- SECTOR SUR  ----------------------
	cardinal10.south,
	
	
	cardinal10.south_east15,
	cardinal10.south_east14, cardinal10.south_east13, cardinal10.south_east12,
	cardinal10.south_east11, cardinal10.south_east10, cardinal10.south_east9,
	cardinal10.south_east8, cardinal10.south_east7, cardinal10.south_east6,
	cardinal10.south_east5, cardinal10.south_east4, cardinal10.south_east3,
	cardinal10.south_east2, cardinal10.south_east1,
	
	# ---------------------- SECTOR ESTE  ----------------------
	cardinal10.east,
	
	
	cardinal10.north_east15,
	cardinal10.north_east14, cardinal10.north_east13, cardinal10.north_east12,
	cardinal10.north_east11, cardinal10.north_east10, cardinal10.north_east9,
	cardinal10.north_east8, cardinal10.north_east7, cardinal10.north_east6,
	cardinal10.north_east5, cardinal10.north_east4, cardinal10.north_east3,
	cardinal10.north_east2, cardinal10.north_east1,
]

const X80_GRADO_TO_ENUM = [
	# ---------------------- SECTOR NORTE ----------------------
	cardinal11.north,
	
	
	cardinal11.north_west19, cardinal11.north_west18,
	cardinal11.north_west17, cardinal11.north_west16, cardinal11.north_west15,
	cardinal11.north_west14, cardinal11.north_west13, cardinal11.north_west12,
	cardinal11.north_west11, cardinal11.north_west10, cardinal11.north_west9,
	cardinal11.north_west8, cardinal11.north_west7, cardinal11.north_west6,
	cardinal11.north_west5, cardinal11.north_west4, cardinal11.north_west3,
	cardinal11.north_west2, cardinal11.north_west1,

	# ---------------------- SECTOR OESTE ----------------------
	cardinal11.west,
	
	
	cardinal11.south_west19, cardinal11.south_west18,
	cardinal11.south_west17, cardinal11.south_west16, cardinal11.south_west15,
	cardinal11.south_west14, cardinal11.south_west13, cardinal11.south_west12,
	cardinal11.south_west11, cardinal11.south_west10, cardinal11.south_west9,
	cardinal11.south_west8, cardinal11.south_west7, cardinal11.south_west6,
	cardinal11.south_west5, cardinal11.south_west4, cardinal11.south_west3,
	cardinal11.south_west2, cardinal11.south_west1,
	
	# ---------------------- SECTOR SUR  ----------------------
	cardinal11.south,
	
	
	cardinal11.south_east19, cardinal11.south_east18,
	cardinal11.south_east17, cardinal11.south_east16, cardinal11.south_east15,
	cardinal11.south_east14, cardinal11.south_east13, cardinal11.south_east12,
	cardinal11.south_east11, cardinal11.south_east10, cardinal11.south_east9,
	cardinal11.south_east8, cardinal11.south_east7, cardinal11.south_east6,
	cardinal11.south_east5, cardinal11.south_east4, cardinal11.south_east3,
	cardinal11.south_east2, cardinal11.south_east1,
	
	# ---------------------- SECTOR ESTE  ----------------------
	cardinal11.east,
	
	
	cardinal11.north_east19, cardinal11.north_east18,
	cardinal11.north_east17, cardinal11.north_east16, cardinal11.north_east15,
	cardinal11.north_east14, cardinal11.north_east13, cardinal11.north_east12,
	cardinal11.north_east11, cardinal11.north_east10, cardinal11.north_east9,
	cardinal11.north_east8, cardinal11.north_east7, cardinal11.north_east6,
	cardinal11.north_east5, cardinal11.north_east4, cardinal11.north_east3,
	cardinal11.north_east2, cardinal11.north_east1,
]

const X96_GRADO_TO_ENUM = [
	# ---------------------- SECTOR NORTE ----------------------
	cardinal12.north, 
	
	
	cardinal12.north_west23, cardinal12.north_west22, cardinal12.north_west21,
	cardinal12.north_west20, cardinal12.north_west19, cardinal12.north_west18,
	cardinal12.north_west17, cardinal12.north_west16, cardinal12.north_west15,
	cardinal12.north_west14, cardinal12.north_west13, cardinal12.north_west12,
	cardinal12.north_west11, cardinal12.north_west10, cardinal12.north_west9,
	cardinal12.north_west8, cardinal12.north_west7, cardinal12.north_west6,
	cardinal12.north_west5, cardinal12.north_west4, cardinal12.north_west3,
	cardinal12.north_west2, cardinal12.north_west1,

	# ---------------------- SECTOR OESTE ----------------------
	cardinal12.west,
	
	
	cardinal12.south_west23, cardinal12.south_west22, cardinal12.south_west21,
	cardinal12.south_west20, cardinal12.south_west19, cardinal12.south_west18,
	cardinal12.south_west17, cardinal12.south_west16, cardinal12.south_west15,
	cardinal12.south_west14, cardinal12.south_west13, cardinal12.south_west12,
	cardinal12.south_west11, cardinal12.south_west10, cardinal12.south_west9,
	cardinal12.south_west8, cardinal12.south_west7, cardinal12.south_west6,
	cardinal12.south_west5, cardinal12.south_west4, cardinal12.south_west3,
	cardinal12.south_west2, cardinal12.south_west1,
	
	# ---------------------- SECTOR SUR  ----------------------
	cardinal12.south,
	
	
	cardinal12.south_east23, cardinal12.south_east22, cardinal12.south_east21,
	cardinal12.south_east20, cardinal12.south_east19, cardinal12.south_east18,
	cardinal12.south_east17, cardinal12.south_east16, cardinal12.south_east15,
	cardinal12.south_east14, cardinal12.south_east13, cardinal12.south_east12,
	cardinal12.south_east11, cardinal12.south_east10, cardinal12.south_east9,
	cardinal12.south_east8, cardinal12.south_east7, cardinal12.south_east6,
	cardinal12.south_east5, cardinal12.south_east4, cardinal12.south_east3,
	cardinal12.south_east2, cardinal12.south_east1,
	
	# ---------------------- SECTOR ESTE  ----------------------
	cardinal12.east,
	
	
	cardinal12.north_east23, cardinal12.north_east22, cardinal12.north_east21,
	cardinal12.north_east20, cardinal12.north_east19, cardinal12.north_east18,
	cardinal12.north_east17, cardinal12.north_east16, cardinal12.north_east15,
	cardinal12.north_east14, cardinal12.north_east13, cardinal12.north_east12,
	cardinal12.north_east11, cardinal12.north_east10, cardinal12.north_east9,
	cardinal12.north_east8, cardinal12.north_east7, cardinal12.north_east6,
	cardinal12.north_east5, cardinal12.north_east4, cardinal12.north_east3,
	cardinal12.north_east2, cardinal12.north_east1,
]

const X100_GRADO_TO_ENUM = [
	# ---------------------- SECTOR NORTE ----------------------
	cardinal13.north, 
	
	
	cardinal13.north_west23, cardinal13.north_west22, cardinal13.north_west21,
	cardinal13.north_west20, cardinal13.north_west19, cardinal13.north_west18,
	cardinal13.north_west17, cardinal13.north_west16, cardinal13.north_west15,
	cardinal13.north_west14, cardinal13.north_west13, cardinal13.north_west12,
	cardinal13.north_west11, cardinal13.north_west10, cardinal13.north_west9,
	cardinal13.north_west8, cardinal13.north_west7, cardinal13.north_west6,
	cardinal13.north_west5, cardinal13.north_west4, cardinal13.north_west3,
	cardinal13.north_west2, cardinal13.north_west1,

	# ---------------------- SECTOR OESTE ----------------------
	cardinal13.west,
	
	
	cardinal13.south_west23, cardinal13.south_west22, cardinal13.south_west21,
	cardinal13.south_west20, cardinal13.south_west19, cardinal13.south_west18,
	cardinal13.south_west17, cardinal13.south_west16, cardinal13.south_west15,
	cardinal13.south_west14, cardinal13.south_west13, cardinal13.south_west12,
	cardinal13.south_west11, cardinal13.south_west10, cardinal13.south_west9,
	cardinal13.south_west8, cardinal13.south_west7, cardinal13.south_west6,
	cardinal13.south_west5, cardinal13.south_west4, cardinal13.south_west3,
	cardinal13.south_west2, cardinal13.south_west1,
	
	# ---------------------- SECTOR SUR  ----------------------
	cardinal13.south,
	
	
	cardinal13.south_east23, cardinal13.south_east22, cardinal13.south_east21,
	cardinal13.south_east20, cardinal13.south_east19, cardinal13.south_east18,
	cardinal13.south_east17, cardinal13.south_east16, cardinal13.south_east15,
	cardinal13.south_east14, cardinal13.south_east13, cardinal13.south_east12,
	cardinal13.south_east11, cardinal13.south_east10, cardinal13.south_east9,
	cardinal13.south_east8, cardinal13.south_east7, cardinal13.south_east6,
	cardinal13.south_east5, cardinal13.south_east4, cardinal13.south_east3,
	cardinal13.south_east2, cardinal13.south_east1,
	
	# ---------------------- SECTOR ESTE  ----------------------
	cardinal13.east,
	
	
	cardinal13.north_east23, cardinal13.north_east22, cardinal13.north_east21,
	cardinal13.north_east20, cardinal13.north_east19, cardinal13.north_east18,
	cardinal13.north_east17, cardinal13.north_east16, cardinal13.north_east15,
	cardinal13.north_east14, cardinal13.north_east13, cardinal13.north_east12,
	cardinal13.north_east11, cardinal13.north_east10, cardinal13.north_east9,
	cardinal13.north_east8, cardinal13.north_east7, cardinal13.north_east6,
	cardinal13.north_east5, cardinal13.north_east4, cardinal13.north_east3,
	cardinal13.north_east2, cardinal13.north_east1,
]

const X144_GRADO_TO_ENUM = [
	# ---------------------- SECTOR NORTE ----------------------
	cardinal15.north, 
	
	
	cardinal15.north_west35, cardinal15.north_west34, cardinal15.north_west33,
	cardinal15.north_west32, cardinal15.north_west31, cardinal15.north_west30,
	cardinal15.north_west29, cardinal15.north_west28, cardinal15.north_west27,
	cardinal15.north_west26, cardinal15.north_west25, cardinal15.north_west24,
	cardinal15.north_west23, cardinal15.north_west22, cardinal15.north_west21,
	cardinal15.north_west20, cardinal15.north_west19, cardinal15.north_west18,
	cardinal15.north_west17, cardinal15.north_west16, cardinal15.north_west15,
	cardinal15.north_west14, cardinal15.north_west13, cardinal15.north_west12,
	cardinal15.north_west11, cardinal15.north_west10, cardinal15.north_west9,
	cardinal15.north_west8, cardinal15.north_west7, cardinal15.north_west6,
	cardinal15.north_west5, cardinal15.north_west4, cardinal15.north_west3,
	cardinal15.north_west2, cardinal15.north_west1,

	# ---------------------- SECTOR OESTE ----------------------
	cardinal15.west,
	
	
	cardinal15.south_west35, cardinal15.south_west34, cardinal15.south_west33,
	cardinal15.south_west32, cardinal15.south_west31, cardinal15.south_west30,
	cardinal15.south_west29, cardinal15.south_west28, cardinal15.south_west27,
	cardinal15.south_west26, cardinal15.south_west25, cardinal15.south_west24,
	cardinal15.south_west23, cardinal15.south_west22, cardinal15.south_west21,
	cardinal15.south_west20, cardinal15.south_west19, cardinal15.south_west18,
	cardinal15.south_west17, cardinal15.south_west16, cardinal15.south_west15,
	cardinal15.south_west14, cardinal15.south_west13, cardinal15.south_west12,
	cardinal15.south_west11, cardinal15.south_west10, cardinal15.south_west9,
	cardinal15.south_west8, cardinal15.south_west7, cardinal15.south_west6,
	cardinal15.south_west5, cardinal15.south_west4, cardinal15.south_west3,
	cardinal15.south_west2, cardinal15.south_west1,
	
	# ---------------------- SECTOR SUR  ----------------------
	cardinal15.south,
	
	
	cardinal15.south_east35, cardinal15.south_east34, cardinal15.south_east33,
	cardinal15.south_east32, cardinal15.south_east31, cardinal15.south_east30,
	cardinal15.south_east29, cardinal15.south_east28, cardinal15.south_east27,
	cardinal15.south_east26, cardinal15.south_east25, cardinal15.south_east24,
	cardinal15.south_east23, cardinal15.south_east22, cardinal15.south_east21,
	cardinal15.south_east20, cardinal15.south_east19, cardinal15.south_east18,
	cardinal15.south_east17, cardinal15.south_east16, cardinal15.south_east15,
	cardinal15.south_east14, cardinal15.south_east13, cardinal15.south_east12,
	cardinal15.south_east11, cardinal15.south_east10, cardinal15.south_east9,
	cardinal15.south_east8, cardinal15.south_east7, cardinal15.south_east6,
	cardinal15.south_east5, cardinal15.south_east4, cardinal15.south_east3,
	cardinal15.south_east2, cardinal15.south_east1,
	
	# ---------------------- SECTOR ESTE  ----------------------
	cardinal15.east,
	
	
	cardinal15.north_east35, cardinal15.north_east34, cardinal15.north_east33,
	cardinal15.north_east32, cardinal15.north_east31, cardinal15.north_east30,
	cardinal15.north_east29, cardinal15.north_east28, cardinal15.north_east27,
	cardinal15.north_east26, cardinal15.north_east25, cardinal15.north_east24,
	cardinal15.north_east23, cardinal15.north_east22, cardinal15.north_east21,
	cardinal15.north_east20, cardinal15.north_east19, cardinal15.north_east18,
	cardinal15.north_east17, cardinal15.north_east16, cardinal15.north_east15,
	cardinal15.north_east14, cardinal15.north_east13, cardinal15.north_east12,
	cardinal15.north_east11, cardinal15.north_east10, cardinal15.north_east9,
	cardinal15.north_east8, cardinal15.north_east7, cardinal15.north_east6,
	cardinal15.north_east5, cardinal15.north_east4, cardinal15.north_east3,
	cardinal15.north_east2, cardinal15.north_east1,
]
#_______________________________________________________
@export var IMPRIMIR := false


func CalculateOrientation(player_2d:Node2D, target_2d:Node2D, player_3d:Node3D, target_3d:Node3D, manual_direction:Vector2) -> int:
	var rot_actor_player : float = 0.0
	var rot_actor_camera : float = 0.0
	
	if tipo_apartado == 0: # 2D
		match type_calculation:
			"ROTATE NODE":
				rot_actor_player = CheckRotation2D(player_2d)
				rot_actor_camera = CheckRotation2D(target_2d)
			"MANUAL DIRECTION":
				rot_actor_player = rad_to_deg(atan2(-manual_direction.x, -manual_direction.y))
				rot_actor_camera = 0.0
			"AUTOMATIC DIRECTION":
				if player_2d.get("velocity"):
					var LRFB = CalculateAxisMovement2D(player_2d, player_2d.velocity)
					rot_actor_player = rad_to_deg(atan2(LRFB.x, LRFB.y * adjust_velocity_up))
				rot_actor_camera = 0.0
	else: # 3D
		var comp_fov = 0.0
		if compensate_camera_perspective:
			comp_fov = rad_to_deg(CheckCameraAngle(target_3d.global_position, -target_3d.global_basis.z.normalized(), player_3d.global_position))
		
		rot_actor_player = CheckRotation3D(player_3d, 1.0)
		rot_actor_camera = CheckRotation3D(target_3d, -1.0) + comp_fov

	var angulo_final : float = fposmod(rot_actor_player - rot_actor_camera, 360.0)
	
	var map_array = DATA_MAP.get(directions_number, X8_GRADO_TO_ENUM)
	var num_dirs = map_array.size()
	
	var grado_logico = int((angulo_final * num_dirs / 360.0) + 0.5) % num_dirs
	
	return map_array[grado_logico]
	
	
func CalculateAxisMovement2D(target: Node2D, velocity: Vector2) -> Vector2:
	if velocity.is_zero_approx():
		return Vector2.ZERO
	
	var v_norm = velocity.normalized()
	var forward_vector = -target.global_transform.y.normalized() # Hacia "adelante" relativo al nodo
	var right_vector = target.global_transform.x.normalized()    # Hacia la "derecha" relativa al nodo
	
	var FB_movement = forward_vector.dot(v_norm)
	var LR_movement = right_vector.dot(v_norm)
	
	return Vector2(LR_movement, FB_movement)


func CalculateAxisMovement3D(target: Node3D, velocity: Vector3) -> Vector2:
	if velocity.is_zero_approx():
		return Vector2.ZERO
		
	var v_norm = velocity.normalized()
	var forward_vector = target.global_transform.basis.z.normalized()
	var right_vector = target.global_transform.basis.x.normalized()
	
	var FB_movement = forward_vector.dot(v_norm)
	var LR_movement = right_vector.dot(v_norm)
	
	return Vector2(LR_movement, FB_movement)


func CheckRotation2D(_target: Node2D) -> float:
	var dir = _target.global_transform.y
	return rad_to_deg(atan2(dir.x, dir.y))


func CheckRotation3D(_target: Node3D, _distance_point: float) -> float:
	var dir = _target.global_basis.z * _distance_point
	return rad_to_deg(atan2(dir.x, dir.z))


func CheckCameraAngle(reference_point: Vector3, direction_normal: Vector3, target_point: Vector3) -> float:
	var dx = target_point.x - reference_point.x
	var dz = target_point.z - reference_point.z
	
	var fx = direction_normal.x
	var fz = direction_normal.z
	
	var angle_radar = atan2(dx, dz)
	var angle_front = atan2(fx, fz)
	
	return angle_radar - angle_front
