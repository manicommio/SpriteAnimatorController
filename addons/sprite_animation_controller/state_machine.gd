extends Node
class_name StateMachine


var states_library :Dictionary[String,Node]
var current_state :Node= null
var active := false


func _ready() -> void:
	if self.get_children().size() > 0:
		for son in get_children():
			if son is BaseState2D or son is BaseState3D: 
				states_library[son.get_name()] = son
				if son.has_signal("change_state"):
					son.change_state.connect(ChangeState)
		active = true
		ChangeState(self.get_child(0).get_name())
	else:
		active = false


func _input(event) -> void:
	if current_state != null:
		if current_state.has_method("update_input") and active:
			current_state.update_input(event)
		else:
			set_process_input(false)
			

func _physics_process(delta:float) -> void:
	if current_state != null:
		if current_state.has_method("physics_update") and active:
			current_state.physics_update(delta)
		else:
			set_physics_process(false)


func _process(delta) -> void:
	if current_state != null:
		if current_state.has_method("update") and active:
			current_state.update(delta)
		else:
			set_process(false)


func ChangeState(new_state:String) -> void:
	if !active:
		return
	current_state = states_library[new_state]
	if current_state.has_method("enter"):
		current_state.enter()
	set_physics_process(active)
	set_process(active)
	set_process_input(active)
