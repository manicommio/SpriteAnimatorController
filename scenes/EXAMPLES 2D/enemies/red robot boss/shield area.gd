extends Area2D


@onready var collision_shape_l = $CollisionShapeL
@onready var collision_shape_r = $CollisionShapeR
#_________________________________________________
@export var player :Node2D
@export var sprite_shield_L: Sprite2D
@export var sprite_shield_R: Sprite2D
@export var health_L := 1500.0
@export var health_R := 1500.0
var current_health_L := 1500.0
var current_health_R := 1500.0
var broken_shield_L := false
var broken_shield_R := false


func _ready() -> void:
	current_health_L = health_L
	current_health_R = health_R


func _process(_delta: float) ->void:
	if current_health_L <= 0:
		collision_shape_l.set_deferred("disabled",true)
		sprite_shield_L.hide()
		if !broken_shield_L:
			broken_shield_L = true
			player.state_machine.ChangeState("heavy_damage")

	
	if current_health_R <= 0:
		collision_shape_r.set_deferred("disabled",true)
		sprite_shield_R.hide()
		if !broken_shield_R:
			broken_shield_R = true
			player.state_machine.ChangeState("heavy_damage")

		
	var colorL = 0.8 * (current_health_L / health_L)
	var colorR = 0.8 * (current_health_R / health_R)
	sprite_shield_L.self_modulate = Color(0.2 + colorL, 0.2 + colorL, 0.2 + colorL, 1.0)
	sprite_shield_R.self_modulate = Color(0.2 + colorR, 0.2 + colorR, 0.2 + colorR, 1.0)
	

func Damage(_damage, _bullet, _fuerza_bala, _tipo_disparo, _shape) ->void:
	if _shape == 0:
		current_health_L -= _damage
		$AudioHit.play()
	elif _shape == 1:
		current_health_R -= _damage
		$AudioHit.play()
	
	if player.state == "idle" or player.state == "looking_left" or player.state == "looking_right":
		player.state_machine.ChangeState("hunt")
