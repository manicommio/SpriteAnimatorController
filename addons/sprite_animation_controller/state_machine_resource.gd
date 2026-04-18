extends Node
class_name StateMachineResource

@export var player2D :Node2D
@export var player3D :Node2D
@export var animator :AnimatorController
@export var initial_state :String
@export var duplicate_resource :bool = true
@export var states_library :Dictionary[String,Resource]

var current_state :Resource = null
var active := false


func _ready() -> void:
	if states_library.size() > 0:
		# Solo creamos el diccionario local si realmente vamos a duplicar
		var local_states: Dictionary[String, Resource] = {}
		
		for state_name in states_library.keys():
			var state_res = states_library[state_name]
			
			if state_res is Resource:
				# --- LÓGICA DE DUPLICACIÓN CONDICIONAL ---
				var state_to_use : Resource
				
				if duplicate_resource:
					state_to_use = state_res.duplicate()
					local_states[state_name] = state_to_use
				else:
					state_to_use = state_res
				
				# --- SETUP ---
				if state_to_use.has_method("Setup"):
					if state_to_use is BaseState2DResource:
						state_to_use.Setup(state_name, player2D, animator)
					elif state_to_use is BaseState3DResource:
						state_to_use.Setup(state_name, player3D, animator)
				
				# --- CONEXIÓN DE SEÑALES ---
				if state_to_use.has_signal("change_state"):
					if not state_to_use.change_state.is_connected(ChangeState):
						state_to_use.change_state.connect(ChangeState)
		
		
		if duplicate_resource:
			states_library = local_states
		
		if initial_state != "":
			active = true
			ChangeState(initial_state)
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


func set_active(value: bool):
	if active != value:
		active = value
		set_process(value)
		set_physics_process(value)
		set_process_input(value)

		if active and current_state != null:
			if current_state.has_method("enter"):
				current_state.enter()
