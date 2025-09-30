extends Node2D


@onready var shadow = $shadow
@onready var lift = $lift
@onready var sprite_2d = $lift/Sprite2D

#____________________________________
@export var shadow_sprite :Sprite2D
@export var adjust_top_height := 32.0
@export var adjust_bottom_height := 0.0
#____________________________________
var father : Node2D 
var top_height := 0.0
var bottom_height := 0.0
var ground_position := 0.0
var lift_position := 0.0
var state_lift := "GROUND"
var shadow_position := 0.0
#____________________________________
var camera : Node2D = null
var world : Node2D = null
var terrain : Node2D = null
var Ysort : Node2D = null
var initial_shadow_scale : Vector2


func _ready() ->void:
	var mCam = get_tree().get_nodes_in_group("camera")
	if mCam.size()>0:
		camera = mCam[0] 
	var miYsort = get_tree().get_nodes_in_group("Ysort")
	if miYsort.size()>0:
		Ysort = miYsort[0]
	var miMundo = get_tree().get_nodes_in_group("world")
	if miMundo.size()>0:
		world = miMundo[0]
	var miTerreno = get_tree().get_nodes_in_group("map_position")
	if miTerreno.size()>0:
		terrain = miTerreno[0]
		
	if shadow_sprite != null:
		initial_shadow_scale = shadow_sprite.scale
	

func Update(_delta:float) ->void:
	#________________________________________
	if shadow_sprite != null:
		var n_scale =  -(ground_position - lift_position) / 100.0
		n_scale = clamp(n_scale, -0.7,0.0)
		shadow_sprite.scale = initial_shadow_scale + Vector2(n_scale,n_scale)

	#______________________________________________________
	top_height = (lift_position) - adjust_top_height
	bottom_height = (lift_position) - adjust_bottom_height
