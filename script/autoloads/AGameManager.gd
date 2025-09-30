extends Node


var player2d :Node2D = null
var player3d :Node3D = null
var MOBILE_PLATFORM :bool = false
var joystick_sensitivity := 0.5
#__________________________________________________________________
var current_scene = null
var canvas_layer = null
var number_scene := 1

func _ready() -> void:
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
	canvas_layer = CanvasLayer.new()
	canvas_layer.layer = 2
	add_child(canvas_layer)
	
	Engine.max_fps = 60
	
	if OS.get_name() == "Android" or OS.get_name() == "iOS":
		MOBILE_PLATFORM = true
		joystick_sensitivity = 1.6
	else:
		MOBILE_PLATFORM = false
		joystick_sensitivity = 0.5


func goto_scene(path:String) -> void:
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path:String) -> void:
	# It is now safe to remove the current scene
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)
