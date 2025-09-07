extends Node
class_name BaseState3D

@warning_ignore("unused_signal")
signal change_state(new_state)

## Drag the owner "player" here
@export var player :Node3D
## Drag an "AnimatorController" node here
@export var animator :AnimatorController

""" IMPORTANT! """
"""	Please don't overwrite this code. Create a new script that inherits it.
 	To make the state machine work, use the functions described below. """

# This function will be executed only once each time you enter the state
#func enter() -> void:
	#pass

# Use this function in your new scripts if you want to make use of the "_input(events)" function.
#func update_input(event) -> void:
	#pass

# Use this function in your new scripts if you want to make use of the "_physics_process(delta)" function.
#func physics_update(delta:float) -> void:
	#pass
	
# Use this function in your new scripts if you want to make use of the "_process(delta)" function.
#func update(delta:float) -> void:
	#pass
