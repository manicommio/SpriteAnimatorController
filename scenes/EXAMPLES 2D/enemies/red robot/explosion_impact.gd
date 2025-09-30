extends Node2D

var world :Node2D = null
var terrain :Node2D = null
var Ysort :Node2D = null
var camera : Node2D



func _ready():

	#$CollisionShape.set_deferred("disabled", true)
	var mCam = get_tree().get_nodes_in_group("camera")
	if mCam.size()>0:
		camera = mCam[0]
	var miMundo = get_tree().get_nodes_in_group("world")
	if miMundo.size()>0:
		world = miMundo[0]
	var miPista = get_tree().get_nodes_in_group("map_position")
	if miPista.size()>0:
		terrain = miPista[0]
	var miYsort = get_tree().get_nodes_in_group("Ysort")
	if miYsort.size()>0:
		Ysort = miYsort[0]
	
	set_process(false)


		
func Start(new_global_transform:Node2D, _scale:float) ->void:
	#self.global_transform.origin = new_global_transform.origin
	var padre_pos = new_global_transform.global_position
	var terreno_pos = terrain.global_position + (terrain.global_transform.basis_xform(Vector2.RIGHT) * padre_pos.x) + (terrain.global_transform.basis_xform(Vector2.DOWN) * padre_pos.y)
	self.global_position = terreno_pos
	self.scale = Vector2(_scale,_scale)
	#animation_direction = _direction
	self.rotation_degrees = randf_range(-90.0,90.0)
