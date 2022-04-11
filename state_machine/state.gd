extends Node
class_name State
signal finish(next_state, params)


# Initialize the state. E.g. change the animation
func _enter(params):
	pass

# Clean up the state. Reinitialize values like a timer
func _exit():
	return

# Called during _process
func _update(delta: float):
	return

# Called during _physics_process
func _physics_update(delta: float):
	return

# Called during _input
func _handle_input(event: InputEvent):
	return

# Called when current animation finished
func _on_animation_finished(name:String):
	return
