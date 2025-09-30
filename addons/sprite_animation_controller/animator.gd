@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("AnimatorController", "Node", preload("res://addons/sprite_animation_controller/animator_controller.gd"), preload("res://addons/sprite_animation_controller/icon/animator.png"))
	add_custom_type("AnimatorDirection", "Node", preload("res://addons/sprite_animation_controller/animator_direction.gd"), preload("res://addons/sprite_animation_controller/icon/direction.png"))
	add_custom_type("AnimatorClip", "Node", preload("res://addons/sprite_animation_controller/animator_clip.gd"), preload("res://addons/sprite_animation_controller/icon/clip.png"))
	add_custom_type("AnimatorSpace", "Node", preload("res://addons/sprite_animation_controller/animator_space.gd"), preload("res://addons/sprite_animation_controller/icon/animator_space.png"))
	add_custom_type("SpriteProyector2D", "Sprite2D", preload("res://addons/sprite_animation_controller/sprite_proyector_2d.gd"), preload("res://addons/sprite_animation_controller/icon/sprite_proyector2D.png"))
	add_custom_type("SpriteProyector3D", "Sprite3D", preload("res://addons/sprite_animation_controller/sprite_proyector_3d.gd"), preload("res://addons/sprite_animation_controller/icon/sprite_proyector3D.png"))
	add_custom_type("MeshProyector3D", "MeshInstance3D", preload("res://addons/sprite_animation_controller/mesh_proyector_3d.gd"), preload("res://addons/sprite_animation_controller/icon/mesh_proyector3D.png"))
	add_custom_type("StateMachine", "Node", preload("res://addons/sprite_animation_controller/state_machine.gd"), preload("res://addons/sprite_animation_controller/icon/state_machine.png"))
	add_custom_type("BaseState2D", "Node", preload("res://addons/sprite_animation_controller/state_base_2d.gd"), preload("res://addons/sprite_animation_controller/icon/base_state2D.png"))
	add_custom_type("BaseState3D", "Node", preload("res://addons/sprite_animation_controller/state_base_3d.gd"), preload("res://addons/sprite_animation_controller/icon/base_state3D.png"))
	
	
func _exit_tree():
	remove_custom_type("animator_controller")
	remove_custom_type("AnimatorDirection")
	remove_custom_type("AnimatorClip")
	remove_custom_type("AnimatorSpace")
	remove_custom_type("SpriteProyector2D")
	remove_custom_type("SpriteProyector3D")
	remove_custom_type("MeshProyector3D")
	remove_custom_type("StateMachine")
	remove_custom_type("BaseState2D")
	remove_custom_type("BaseState3D")
