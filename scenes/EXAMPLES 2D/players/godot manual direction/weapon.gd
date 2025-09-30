extends Marker2D

@export var player :Node2D
@export var proyector :Node2D

var exepcion_colision :Array
var fire_rate := 0.06
var tiempo_disparo := 0.0
var collision_mask := 256
var altura_vuelo := -44.0
var altura_underground := 0.0
var altura_final := 0.0
var recargando := false
var tiempo_recarga := 0.0
var cantidad_balas := 1

var spawn_bullet = preload("res://scenes/EXAMPLES 2D/bullet/bullet_manual_direction.tscn")

var numero_arma := 0
const lista_armas = {
	0:"GUN",
}


func _process(delta:float) ->void:
	if tiempo_disparo <= 10.0:
		tiempo_disparo += delta
	#__________________________________________________
	altura_underground =  proyector.lift_position
	#________________________________________________
	exepcion_colision = [player]
	#_______________________________________
	collision_mask = 1+2
	
func Disparar(delta:float) ->void:
	match GameData.lista_armas[lista_armas[numero_arma]]["function"]:
		"GenerateBullet":
			GenerateBullet(delta)


func GenerateBullet(delta:float) ->void:
	fire_rate = GameData.lista_armas[lista_armas[numero_arma]]["fire_rate"]
	#_______________________________________
	
	if tiempo_disparo >= fire_rate and cantidad_balas > 0 and !recargando:
		tiempo_disparo = 0
		cantidad_balas -= 1

		var audio_arma = GameData.lista_armas[lista_armas[numero_arma]]["audio"]
		if audio_arma != null:
			if $Audio.stream == null:
				$Audio.stream = load(audio_arma)
			else:
				if $Audio.stream.resource_path != audio_arma:
					$Audio.stream = load(audio_arma)
			#if !$Audio.is_playing():
			$Audio.play()
		
		var velocidad_disparo = GameData.lista_armas[lista_armas[numero_arma]]["velocidad_disparo"]
		var alcance = GameData.lista_armas[lista_armas[numero_arma]]["alcence"]
		var damage = GameData.lista_armas[lista_armas[numero_arma]]["damage"]
		var lista_tipo_bala = GameData.lista_armas[lista_armas[numero_arma]]["tipo_bala"]
		var tipo_bala = lista_tipo_bala[randi()%lista_tipo_bala.size()]
		var fuerza_disparo = GameData.lista_armas[lista_armas[numero_arma]]["fuerza_disparo"]
		var cantidad_disparo = GameData.lista_armas[lista_armas[numero_arma]]["cantidad_disparo"]

		for i in range(cantidad_disparo):
			var clon = spawn_bullet.instantiate()
			player.Ysort.add_child(clon)
			clon.Start(self.global_position, Vector2(player.animation_direction.x, player.animation_direction.y), 2.0, exepcion_colision, damage, (altura_vuelo + altura_underground ))
	
	
	if cantidad_balas <= 0:
		recargando = true
	
	if recargando:
		tiempo_recarga += delta
		if tiempo_recarga >= GameData.lista_armas[lista_armas[numero_arma]]["tiempo_recarga"]:
			tiempo_recarga = 0
			recargando = false
			cantidad_balas = GameData.lista_armas[lista_armas[numero_arma]]["capacidad"]

		
