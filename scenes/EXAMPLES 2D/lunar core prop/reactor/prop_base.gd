extends Node2D


@onready var proyector = $proyector
#_________________________________________
var world :Node2D = null
var terrain :Node2D = null
var Ysort :Node2D = null
var camera :Node2D = null
#_________________________________________


func _ready() ->void:
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
	
	self.remove_child(proyector)
	Ysort.add_child(proyector)
	proyector.father = self
	proyector.Start()
	
	
func _process(delta:float) ->void:
	#____________________________________
	proyector.Update(delta)
	# LIMITAR ROTACION _____________________________
	if abs(self.rotation) > deg_to_rad(360):
		self.rotation += self.rotation * -2
	
	#if proyector.has_node("shadow/shadow"):
		#
		##_____________________________________
		#var punto_f = self.global_position + (self.global_transform.basis_xform(Vector2.UP) * 1024)
		#var terrain_pos_ini = terrain.global_position + (terrain.global_transform.basis_xform(Vector2.RIGHT) * punto_f.x) + (terrain.global_transform.basis_xform(Vector2.DOWN) * punto_f.y)
		#
		#var padre_pos = self.global_position
		#var terrain_pos_end =  self.global_position + (terrain.global_transform.basis_xform(Vector2.RIGHT) * padre_pos.x) + (terrain.global_transform.basis_xform(Vector2.DOWN) * padre_pos.y)
#
		#var dir_crosshair = (terrain_pos_ini - terrain_pos_end).normalized()
		#proyector.get_node("shadow/shadow").rotation = atan2(dir_crosshair.x, -dir_crosshair.y)  #+ camera.camera_rotation.rotation
		#if abs(proyector.get_node("shadow/shadow").rotation) > deg_to_rad(360):
			#proyector.get_node("shadow/shadow").rotation = -2
		#proyector.get_node("shadow/shadow").rotation = (rotation_ini + camera.camera_rotation.rotation) / 2.0
