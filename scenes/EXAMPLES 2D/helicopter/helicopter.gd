extends Node2D


@onready var helicopter1 = $Helicopter1
@onready var helicopter2 = $Helicopter2

var timer := 0.0
var timer2 := 0.0

func _ready() ->void:
	helicopter1.show()
	helicopter2.hide()


func _process(delta:float) ->void:
	timer += delta
	
	if timer >= 0.08:
		timer = 0
		helicopter1.visible =! helicopter1.visible
		helicopter2.visible =! helicopter2.visible
	
	if timer2 < 2.0:
		timer2 += delta
		var dir = global_transform.basis_xform(Vector2.RIGHT)
		global_translate(dir * 64 * delta)
