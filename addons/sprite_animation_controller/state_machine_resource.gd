extends Node
class_name StateMachineResource

@export var player2D :Node2D
@export var player3D :Node2D
@export var animator :AnimatorController
@export var initial_state :String
@export var states_library :Dictionary[String,Resource]
var current_state :Resource = null
var active := false


func _ready() -> void:
	if states_library.size() > 0:
		# 1. Creamos un nuevo diccionario para guardar las copias únicas
		var local_states: Dictionary[String, Resource] = {}
		
		for state_name in states_library.keys():
			var state_res = states_library[state_name]
			
			if state_res is Resource:
				# 2. DUPLICAMOS EL RECURSO
				# Esto crea una copia única en RAM para este jugador
				var state_copy = state_res.duplicate()
				
				# 3. Guardamos la copia en nuestro diccionario local
				local_states[state_name] = state_copy
				
				# 4. Inicializamos la copia
				if state_copy.has_method("Setup"):
					if state_copy is BaseState2DResource:
						state_copy.Setup(state_name ,player2D, animator)
					elif state_copy is BaseState3DResource:
						state_copy.Setup(state_name ,player3D, animator)
				
				# 5. Conectamos señales a la COPIA, no al original
				if state_copy.has_signal("change_state"):
					state_copy.change_state.connect(ChangeState)
		
		# 6. Reemplazamos la librería original con la de copias únicas
		states_library = local_states
		
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

# En StateMachine.gd
func set_active(value: bool):
	if active != value:
		active = value
		set_process(value)
		set_physics_process(value)
		set_process_input(value)
		# Si encendemos la IA, obligamos al estado actual a 
		# ejecutar su lógica de entrada (donde pusimos el if de seguridad)
		if active and current_state != null:
			if current_state.has_method("enter"):
				current_state.enter()
