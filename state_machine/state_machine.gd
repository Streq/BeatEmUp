extends Node
class_name StateMachine
export (String) var start_state

var current: State = null
var states:= {}

func _ready():
	for state in get_children():
		states[state.name] = state
		state.connect("finish", self, "_change_state")
	current = states[start_state]
	current.enter(null)
	
func _process(delta: float):
	current._update(delta)

func _physics_process(delta: float):
	current._physics_update(delta)

func _input(event: InputEvent):
	current._handle_input(event)

func _change_state(state_name: String, params):
	current._exit()
	current = states[state_name]
	current.enter(params)
