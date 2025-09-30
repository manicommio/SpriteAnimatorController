extends Node2D


#@onready var animator = $animator
@onready var proyector = $proyector
@export var nombre_animacion := ""
var mundo :Node2D = null
var terreno :Node2D = null
var Ysort :Node2D = null
var spawn_bullethole :Node2D = null

var ajustar_escala := 0

#const SHAPE := preload("res://escenas/bullets/player/bullet/circle_shape_2d.tres")
var PS = PhysicsServer2D
var shape_rid
var query := PhysicsShapeQueryParameters2D.new()
@onready var direct_space_state := get_world_2d().direct_space_state

var bullet_height := 0.0
var initial_bullet_height := 0.0
var final_bullet_height := 0.0
var interpolation_time := 0.0
var bullet_speed := 50.0
var bullet_force := 0.0
var distance_traveled := 0.0
var travel_time :=  0.0
var damage: float = 1.0
var max_distance_traveled: float = 60.0

var from_who := []
var tipo_disparo := "fuego"


var active_explosion := false
var timer :Timer


func _init() -> void:
	shape_rid = PS.circle_shape_create()
	var radius = 5.0
	PS.shape_set_data(shape_rid, radius)
	query.shape_rid = shape_rid
	query.collide_with_bodies = true
	query.collide_with_areas = true
	set_as_top_level(true)
	
func _ready() -> void:
	set_physics_process(false)

	var miMundo = get_tree().get_nodes_in_group("world")
	if miMundo.size()>0:
		mundo = miMundo[0]
	var miPista = get_tree().get_nodes_in_group("map_position")
	if miPista.size()>0:
		terreno = miPista[0]
	var miYsort = get_tree().get_nodes_in_group("Ysort")
	if miYsort.size()>0:
		Ysort = miYsort[0]
	
	timer = Timer.new()
	timer.wait_time = 2.0
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(_on_Timer_timeout)
	
	self.remove_child(proyector)
	Ysort.add_child(proyector)
	proyector.father = self



func _physics_process(delta: float) -> void:
	#___________________________________
	#if self.rotation > deg_to_rad(360) or self.rotation < -deg_to_rad(360):
		#self.rotation = 0
	#___________________________________
	proyector.Update(delta)

	bullet_height = proyector.lift.position.y
	
	if !active_explosion:
		travel_time = max_distance_traveled / bullet_speed
		var forwar_dir = global_transform.basis_xform(Vector2.UP).normalized()
		global_translate(forwar_dir * bullet_speed * delta)

		distance_traveled += delta
		
		#t += delta * 0.4
		#interpolation = A + (B - A) * t
		interpolation_time = distance_traveled / travel_time
		var interpolation = initial_bullet_height + ((initial_bullet_height - final_bullet_height) - initial_bullet_height) * interpolation_time
		proyector.lift.position.y = interpolation
		
		query.transform = global_transform
		var result := direct_space_state.intersect_shape(query, 1)
		if result:
			#var check_result = result[0].collider
			#if from_who.has(check_result):
				#pass
			#else:
				#body = check_result
			var body = result[0].collider
			var _shape = result[0].shape
			if from_who.has(body):
				pass
			elif is_instance_valid(body):
				if body.has_method("Damage"):
					#body.Damage(damage, self.global_transform, bullet_force, null, "fuego")
					
					if "player" in body:
						if "proyector" in body.player:
							if bullet_height <= body.player.proyector.bottom_height and bullet_height >= body.player.proyector.top_height:
								body.Damage(damage, self, bullet_force, tipo_disparo, _shape)
								if "color_sangre" in body:
									proyector.lift.get_node("sangre").color = body.color_sangre
									proyector.lift.get_node("sangre").emitting = true
								else:
									proyector.lift.get_node("explosion").emitting = true
								timer.start()
								active_explosion = true
								proyector.sprite_2d.hide()
								#proyector.ground.get_node("sombra").hide()
								#print("bala: ", bullet_height, "  min: ", body.player.proyector.bottom_height, "  max: ",  body.player.proyector.top_height )
							else:
								pass
						else:
							body.Damage(damage, self, bullet_force, tipo_disparo, _shape)
							if "color_sangre" in body:
								proyector.lift.get_node("sangre").color = body.color_sangre
								proyector.lift.get_node("sangre").emitting = true
							else:
								proyector.lift.get_node("explosion").emitting = true
							timer.start()
							active_explosion = true
							proyector.sprite_2d.hide()

					else:
						if "proyector" in body:
							if bullet_height <= body.proyector.bottom_height and bullet_height >= body.proyector.top_height:
								body.Damage(damage, self, bullet_force, tipo_disparo, _shape)
								if "color_sangre" in body:
									proyector.lift.get_node("sangre").color = body.color_sangre
									proyector.lift.get_node("sangre").emitting = true
								else:
									proyector.lift.get_node("explosion").emitting = true
								timer.start()
								active_explosion = true
								proyector.sprite_2d.hide()
								#proyector.ground.get_node("sombra").hide()
								#print("bala: ", bullet_height, "  min: ", body.proyector.bottom_height, "  max: ",  body.proyector.top_height )
							else:
								pass
						else:
							body.Damage(damage, self, bullet_force, tipo_disparo, _shape)
							if "color_sangre" in body:
								proyector.lift.get_node("sangre").color = body.color_sangre
								proyector.lift.get_node("sangre").emitting = true
							else:
								proyector.lift.get_node("explosion").emitting = true
							timer.start()
							active_explosion = true
							proyector.sprite_2d.hide()
							#proyector.ground.get_node("sombra").hide()
				else:
					if !body.is_in_group("enemy"):
						if "proyector" in body:
							if bullet_height <= body.proyector.bottom_height and bullet_height >= body.proyector.top_height:
								if "color_sangre" in body:
									proyector.lift.get_node("sangre").color = body.color_sangre
									proyector.lift.get_node("sangre").emitting = true
								else:
									proyector.lift.get_node("explosion").emitting = true
								timer.start()
								active_explosion = true
								proyector.sprite_2d.hide()
								#proyector.ground.get_node("sombra").hide()
								#print("bala: ", bullet_height, "  min: ", body.proyector.bottom_height, "  max: ",  body.proyector.top_height )
							else:
								pass
						else:
							if "color_sangre" in body:
								proyector.lift.get_node("sangre").color = body.color_sangre
								proyector.lift.get_node("sangre").emitting = true
							else:
								proyector.lift.get_node("explosion").emitting = true
							timer.start()
							active_explosion = true
							proyector.sprite_2d.hide()


		elif distance_traveled > travel_time:
			Destruir()
		
		if bullet_height > 0:
			proyector.lift.get_node("explosion").emitting = true
			timer.start()
			active_explosion = true
			proyector.sprite_2d.hide()


func Start(new_global_transform: Transform2D, rot: float, speed: float, _damage: float, distancia: float, _from_who: Array, _collision_mask: int, _fuerza: float, _altura_ini:float, _altura_fin:float, _tipo_bala: String) ->void:
	self.global_transform = new_global_transform
	rotation_degrees += rot
	bullet_speed = speed
	damage = _damage
	max_distance_traveled = distancia
	from_who = _from_who
	bullet_force = _fuerza
	query.collision_mask = _collision_mask
	query.set_exclude(from_who)
	tipo_disparo = _tipo_bala

	self.show()
	proyector.Start()
	proyector.show()
	
	proyector.lift_position = _altura_ini
	proyector.lift.position.y = _altura_ini
	initial_bullet_height = _altura_ini
	final_bullet_height = _altura_fin

	#proyector.lift.scale = Vector2(1.0,0.5)
	#animator.PlayAnimation(nombre_animacion,false)
	set_physics_process(true)

func Destruir()->void:
	if is_instance_valid(proyector):
		proyector.queue_free()
	self.queue_free()
	
func _on_Timer_timeout():
	Destruir()



func CalcularCastTo(_velocidad) -> float:
	var calculo = (_velocidad / 100) * 2.75
	return calculo



func _exit_tree() ->void:
	PhysicsServer2D.free_rid(shape_rid)
