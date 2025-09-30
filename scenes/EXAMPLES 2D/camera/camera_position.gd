extends Node2D


#@onready var joystick = get_node("CanvasLayer/main_joystick")
@onready var camera_rotation = $camera_rotation
@onready var fade = $CanvasLayer/Control/fade

var joystick :Node2D = null
var mouse_sen := 0.1
var camera_zoom := 0.8
var zoom_smooth := 0.8
var camara_position := 0.0
var position_smooth := 0.0
var position_up := 0.0

const adjust_distance = {
	0:-192.0,
	1:-128.0,
	2:-96.0,
}

var zoom_number := 1
const focal = {
	0:0.3,
	1:0.5,
	2:0.8
}

var syn_rot := 0.0
var syn_rot2 := 0.0



func _ready() ->void:
	if !GameManager.MOBILE_PLATFORM:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	camera_rotation.set_as_top_level(true)
	zoom_smooth = focal[zoom_number]
	$Camera2D.zoom = Vector2(zoom_smooth, zoom_smooth)
	position_smooth = adjust_distance[zoom_number]
	self.position.y = position_smooth
	await get_tree().create_timer(1.0).timeout
	OpenFade(2.5)
	
	
func _input(event) ->void:
	mouse_sen = GameManager.joystick_sensitivity
		
	if event is InputEventMouseMotion:
		if GameManager.player2d != null:
			if GameManager.player2d.state == "shoot_standing" or  GameManager.player2d.state == "shoot_crouching":
				GameManager.player2d.rotate(deg_to_rad(event.relative.x * mouse_sen))
			else:
				camera_rotation.rotate(deg_to_rad(event.relative.x * mouse_sen))
		
	else:
		if GameManager.player2d != null:
			if GameManager.player2d.state == "shoot_standing" or  GameManager.player2d.state == "shoot_crouching":
				GameManager.player2d.rotate(-deg_to_rad((Input.get_action_strength("ui_left")-Input.get_action_strength("ui_right")) * 10 * mouse_sen))
			else:
				camera_rotation.rotate(-deg_to_rad((Input.get_action_strength("ui_left")-Input.get_action_strength("ui_right")) * 10 * mouse_sen))
			

func _process(delta:float) ->void:
	if Input.is_action_just_pressed("zoom"):
		camera_zoom = wrapf( camera_zoom + 0.2, 0.6, 1.2)
		zoom_number = wrapi(zoom_number+1, 0, focal.size())
	
	zoom_smooth = lerp(zoom_smooth, focal[zoom_number], 5 * delta)
	$Camera2D.zoom = Vector2(zoom_smooth, zoom_smooth)
	#______________________________________________
	position_smooth = lerp(position_smooth, adjust_distance[zoom_number],5 * delta)
	if GameManager.player2d != null:
		var pl = GameManager.player2d 
		var dir_look_player = 0.0
		var rotBot = camera_rotation.rotation_degrees
		var rotCar = pl.rotation_degrees
		
		syn_rot = (rotBot - rotCar)
	
		if syn_rot >= -180  and syn_rot <= 180:
			syn_rot2 =  syn_rot
		else:
			if rotBot >= 0:
				syn_rot2 = ((rotBot) - (360 + (rotCar )))
			else:
				syn_rot2 = ((rotBot) + (360 - (rotCar )))

		if abs(syn_rot2)>90:
			dir_look_player = (( abs(syn_rot2) - 90 ) / 90.0)
		else:
			dir_look_player = -((90 - abs(syn_rot2)) / 90.0)

		self.position.y = lerp(self.position.y ,-64 + (position_smooth * -dir_look_player) + position_up, 1 * delta)
		
		#-________________________
		if pl.is_grounded:
			position_up = pl.proyector.ground_position
	
	# limit rotation ______________________________________
	if abs(camera_rotation.rotation) > deg_to_rad(360):
		camera_rotation.rotation = 0
		#camera_rotation.rotation += camera_rotation.rotation * -2
	#  mouse capture _______________________________________
	if !GameManager.MOBILE_PLATFORM:
		if Input.is_action_just_pressed("ui_cancel"):
			if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#_________________________________________________


func _physics_process(_delta:float) ->void:
	if GameManager.player2d != null:
		Keyboard()


func Keyboard() ->void:
	var fwd = (Input.get_action_strength("up") - Input.get_action_strength("down"))# - joystick.get_value().y
	var hwd = (Input.get_action_strength("left") - Input.get_action_strength("right"))# - joystick.get_value().x

	var _datos1:  Vector2 =  (Vector2(0,fwd) + Vector2(hwd,0)).normalized()
	var _datos2 = _datos1.length()

	if GameManager.player2d != null:
		GameManager.player2d._on_get_value_joystick(_datos1, _datos2)
		GameManager.player2d.joystick = joystick


func OpenFade(_time:float) ->void:
	var colores =  Color(1.0, 1.0, 1.0, 0.0)
	var tween = create_tween()
	tween.tween_property(fade, "modulate", colores, _time)
	#tween.tween_callback(Reciclar)

func ClosedFade(_time:float) ->void:
	var colores =  Color(1.0, 1.0, 1.0, 1.0)
	var tween = create_tween()
	tween.tween_property(fade, "modulate", colores, _time)
