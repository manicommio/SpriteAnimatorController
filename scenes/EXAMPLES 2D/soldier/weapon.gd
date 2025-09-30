extends Marker2D


@onready var muzzle_flash = $muzzle_flash


var exepcion_colision :Array
var fire_rate := 0.2
var tiempo_disparo := 0.0
var collision_mask := 256
var altura_vuelo := -44.0
var altura_underground := 0.0
var altura_final := 0.0
var recargando := false
var tiempo_recarga := 0.0
var cantidad_balas := 1

@export var animator :AnimatorController
@export var sprite_sheet  :Array[Texture]
var bala = preload("res://scenes/EXAMPLES 2D/bullet soldier/bullet_soldier.tscn")

var mundo :Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() ->void:
	var miMundo = get_tree().get_nodes_in_group("world")
	if miMundo.size()>0:
		mundo = miMundo[0]

func _process(delta:float) ->void:
	if tiempo_disparo <= 5.0:
		tiempo_disparo += delta

func Shoot(animation_direction:Vector2) ->void:
	
	if tiempo_disparo >= fire_rate:
		tiempo_disparo = 0
		var clon = bala.instantiate()
		mundo.add_child(clon)
		clon.Start(self.global_position, Vector2(animation_direction.x,animation_direction.y), 2.0, [owner], 40.0)
		muzzle_flash.Start()

		
func ChangeTexture(action:bool):
	if animator.current_clip != null:
		if action:
			animator.clip_library["shot_grenade"].spritesheet = sprite_sheet[1]
		else:
			animator.clip_library["shot_grenade"].spritesheet = sprite_sheet[0]
