extends Node2D

var PS = PhysicsServer2D
var shape_rid
var query := PhysicsShapeQueryParameters2D.new()
@onready var direct_space_state := get_world_2d().direct_space_state

var speed := 512.0 + 512.0
var tiempo := 0.0
var distancia_recorrido := 512.0
var tiempo_recorrido := 0.0
var direction:Vector2
var escalar := 0.0
var from_who := []
var damage := 10.0
var explosion_activada := false

func _init() -> void:

	shape_rid = PS.circle_shape_create()
	var radius = 5.0
	PS.shape_set_data(shape_rid, radius)
	query.shape_rid = shape_rid
	query.collide_with_bodies = true
	query.collide_with_areas = true
	query.collision_mask = (4)
	set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var forward_direction = self.global_transform.basis_xform(Vector2.UP)
	if !explosion_activada:
		tiempo_recorrido = distancia_recorrido  / speed
		var desplazamiento = Vector2(direction.x * speed, direction.y * (speed/2.0))
		tiempo += delta
		
		query.transform = global_transform
		var result := direct_space_state.intersect_shape(query, 1)
		if result:
			var body = result[0].collider
			if from_who.has(body):
				self.global_translate(desplazamiento * delta)
			elif is_instance_valid(body):
				if body.has_method("Damage"):
					body.Damage(damage)
				
				explosion_activada = true
		
		elif tiempo >= tiempo_recorrido:
			self.queue_free()
		else:
			self.global_translate(desplazamiento * delta)
	
	else:
		if !$explosion.active:
			$explosion.Start()
			$rotacion/Sprite2D.show()
			$rotacion/bola.hide()
		else:
			if $explosion.Finished():
				self.queue_free()
	
	
	escalar += 15 * delta
	if escalar >= 1.5:
		escalar = 0
	
	$rotacion/bola.scale = Vector2(0.25 + escalar, 0.75 + escalar)

func Start(_position:Vector2, _direction:Vector2 , adjust_direction:float, _from_who:Array, _damage:float):
	self.global_position = _position
	#self.rotation = atan2(direction.x, direction.y)
	direction = _direction
	$rotacion.rotation = atan2(_direction.x, -_direction.y / adjust_direction)
	from_who = _from_who
	query.set_exclude(_from_who)
	damage = _damage

func _exit_tree() ->void:
	PS.free_rid(shape_rid)
