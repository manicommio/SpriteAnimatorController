extends Control

var scene_path = {
	0:"res://menu/menu_main.tscn",
	1:"res://demos/Example of isometric by rotation/lunar_core.tscn",
	2:"res://demos/Example of a platform game/demo_plataforma.tscn" ,
	3:"res://demos/Example of a Doom-style game/demo_doom.tscn",
	}

var progress = []

func _ready() -> void:
	set_process(false)
	if ResourceLoader.exists(scene_path[GameManager.number_scene], "PackedScene"):
		ResourceLoader.load_threaded_request(scene_path[GameManager.number_scene], "PackedScene")
	else:
		print("Requested resource does not exist at path!")

#func _on_pressed():
func _process(_delta):
	var result = ResourceLoader.load_threaded_get_status(scene_path[GameManager.number_scene], progress)
	if result == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		print("Loading in progress: " + str(progress[0]))
		get_node("ProgressBar").set_value(progress[0])
		
	elif result == ResourceLoader.THREAD_LOAD_LOADED:
		var scene_to_load = ResourceLoader.load_threaded_get(scene_path[GameManager.number_scene])
		var scene_instance = scene_to_load.instantiate()
		get_tree().root.add_child(scene_instance)
		get_tree().root.remove_child(self)
		queue_free()
		#get_node("/root").add_child(next_scene)
		#get_node("/root").remove_child(self)
		#queue_free()


func _on_timer_timeout():
	set_process(true)
