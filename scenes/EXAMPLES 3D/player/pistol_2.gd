extends Node2D


@onready var audio = $Audio
@export var ray_cast :RayCast3D
@export var animator_controller :AnimatorController
var bullet_force := 0.0 
var bullet_type :String
var shot_time := 0.0
var fire_rate := 0.5
var is_firing := false


func _ready():
	animator_controller.pause_clip = true
	animator_controller.frame_index = 0


func Update(delta:float) ->void:
	if shot_time <= fire_rate:
		shot_time += delta
	
	if Input.is_action_pressed("fire1") and animator_controller.frame_index == 0 and shot_time >= fire_rate:
		shot_time = 0
		animator_controller.pause_clip = false

		
	if animator_controller.KeyFrame(1,true):
		Shoot()

	if animator_controller.Finished():
		animator_controller.pause_clip = true
		animator_controller.frame_index = 0
		animator_controller.PlayAgain()
	
	#___________________________________
	if !Input.is_action_pressed("fire1") and animator_controller.frame_index == 0:
		is_firing = false
	else:
		is_firing = true
	
	
func Shoot():
	audio.play()
	if ray_cast.is_colliding():
		var body = ray_cast.get_collider()
		var shape = ray_cast.get_collider_shape()
		if body.has_method("Damage"):
			body.Damage(35.0, ray_cast, bullet_force, bullet_type, shape)
