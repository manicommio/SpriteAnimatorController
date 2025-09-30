extends Node
class_name AnimatorController


@warning_ignore("unused_signal")
signal stop_all_animations()

@export var active := true
@export var call_before_loading :String = ""
var clip_library :Dictionary[String, AnimatorClip]
var previus_clip :AnimatorClip = null
var current_clip :AnimatorClip = null
var space_library :Dictionary[String,AnimatorSpace]
var current_space :AnimatorSpace = null


func _ready() -> void:
	for son in get_children():
		if son is AnimatorClip:
			clip_library[son.get_name()] = son
			self.stop_all_animations.connect(son.Stop)
		
		if son is AnimatorSpace:
			space_library[son.get_name()] = son


func _process(_delta:float) ->void:
	if clip_library.size()>0:
		if call_before_loading != "":
			PlayAnimation(call_before_loading)
		set_process(false)


func PlayAnimation(new_animation:String) -> void:
	if active :
		if clip_library.size()>0:
			if !clip_library[new_animation].active: 
				previus_clip = current_clip
				if previus_clip != null:
					previus_clip.Stop()
				current_clip = clip_library[new_animation]
				current_clip.Start()
		else:
			if call_before_loading == "":
				call_before_loading = new_animation


func PlayAnimationSpace(new_space:String) -> void:
	if space_library.size()>0:
		current_space = space_library[new_space]
		PlayAnimation(current_space.PlaySpace(self))


func Activate(value:bool) ->void:
	active = value
	if !active:
		emit_signal("stop_all_animations")
