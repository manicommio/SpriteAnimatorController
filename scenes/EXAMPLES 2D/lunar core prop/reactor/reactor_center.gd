extends Node2D

#_________________________________________
var world :Node2D = null
var terrain :Node2D = null
var Ysort :Node2D = null
var camera :Node2D = null
@onready var proyector = $proyector

var sun_scale := 0.0
var invert := false
var tiempo :float = 0.0


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
	#_____________________________________
	if invert:
		if sun_scale > 0:
			sun_scale -=  delta
		else:
			sun_scale = 0
			invert = false
	else:
		if sun_scale < 2.0:
			sun_scale += 0.5 * delta
		else:
			sun_scale = 2.0
			invert = true
	var sun :Sprite2D = proyector.lift.get_node("sun")
	proyector.lift.get_node("sun").self_modulate = Color(1 + sun_scale, 1+ sun_scale, 1 + sun_scale, 1)
	
	tiempo += 12 * delta
	if tiempo >= 1:
		tiempo = 0
		sun.frame = wrapi(sun.frame + 1, 0, sun.hframes * sun.vframes)
