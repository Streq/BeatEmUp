extends State

export (String) var start_state

var current: State = null
var states:= {}

func _ready():
	for state in get_children():
		states[state.name] = state
		state.connect("finish", self, "_on_finish")
	current = states[start_state]

func _on_finish(next_state: String, params):
	emit_signal("finish", next_state, params)

func set_state(name: String):
	current = states[name]
	
func _enter(params):
	current.enter(params)
func _exit():
	current.exit()
func _update(delta: float):
	current.update(delta)
func _physics_update(delta: float):
	current.physics_update(delta)
func _handle_input(event: InputEvent):
	current._handle_input(event)
