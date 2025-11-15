extends Node


const lista_armas = {

	"GUN":{
		"fire_rate": 0.25,
		"damage": 35.0,
		"cantidad_balas" : 1,
		"capacidad": 1,
		"tiempo_recarga": 0.125,# 0.75,
		"tipo_bala": ["bullet"],
		"cantidad_disparo": 1,
		"fuerza_disparo": 0.0,
		"velocidad_disparo": 1536.0,
		"dispersion_bala":Vector2(1.2,1.2),
		"grados_dispersion" : 7.0,
		"size_bullet" : 10.0,
		"alcence" : 768.0, 
		"recargando":false,
		"audio" : "res://sounds/tps godot4/player_audio_shoot.wav",
		"look_aim": 30.0,
		"pool_type" : 0,
		"function": "GenerateBullet",
	}
}
