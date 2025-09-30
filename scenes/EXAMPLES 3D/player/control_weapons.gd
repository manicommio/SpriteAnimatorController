extends Node2D

var is_firing := false
# Called when the node enters the scene tree for the first time.
func _ready() ->void:
	if get_children().size() != 0:
		for i in range(get_children().size()):
			if i == 0:
				get_child(i).show()
			else:
				get_child(i).hide()


func _physics_process(delta:float) ->void:
	if get_children().size() != 0:
		get_child(0).Update(delta)
		is_firing = get_child(0).is_firing
