extends Node
class_name State
signal finish(next_state, params)
signal entered
signal exited
signal updated(delta)
signal physics_updated(delta)

func enter(params):
	_enter(params)
	emit_signal("entered")
func exit():
	_exit()
	emit_signal("exited")
func update(delta: float):
	_update(delta)
	emit_signal("updated", delta)
func physics_update(delta: float):
	_physics_update(delta)
	emit_signal("physics_updated", delta)

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
