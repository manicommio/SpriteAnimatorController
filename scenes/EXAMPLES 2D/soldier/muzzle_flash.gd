extends Node

var time_out := 0.0
var active := false

func _ready() ->void:
	set_process(false)

func Start() ->void:
	time_out = 0
	active = true
	get_parent().ChangeTexture(true)
	set_process(true)
	
	
func _process(delta:float) ->void:
	time_out += delta
	if time_out >= 0.05:
		time_out = 0
		active = false
		get_parent().ChangeTexture(false)
		set_process(false)
