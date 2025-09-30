extends Node2D


var camera_rotation : Node2D = null
var player : CharacterBody2D = null
@onready var terrain = $map_rotation/map_position
@onready var map_rotation = $map_rotation


func _ready() ->void:
	var mCam = get_tree().get_nodes_in_group("camera_rotation")
	if mCam.size()>0:
		camera_rotation = mCam[0]
	
	var mPlayer = get_tree().get_nodes_in_group("player")
	if mPlayer.size()>0:
		player = mPlayer[0]
		
	self.scale = Vector2(1.0,0.5)
	
	
func _process(_delta:float) ->void:
	if GameManager.player2d != null:
		player = GameManager.player2d

	
	if player != null:
		terrain.position = -player.global_position
	
	if camera_rotation != null:
		map_rotation.rotation_degrees =  -camera_rotation.rotation_degrees
		if abs(map_rotation.rotation_degrees) > 360:
			map_rotation.rotation_degrees = 0
