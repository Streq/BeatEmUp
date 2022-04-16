extends Node

signal combo(combo)

export (NodePath) onready var input_state = get_node(input_state) as InputState
export (NodePath) onready var state_machine = get_node(state_machine) as StateMachine



func _physics_process(delta):
	check_for_combo()

func check_for_combo():
	for child in get_children():
		var move = child as Move
		if child.check(input_state, state_machine.current.name):
			emit_signal("combo", child.name)
			if move.state_to:
				state_machine._change_state(move.state_to, null)
			return
		
