extends Node
class_name Move
export (String) var state_to
export (PoolStringArray) var states_from
export (bool) var continuous
export (bool) var requires_combo
export (PoolStringArray) var combos
export (bool) var requires_held_direction
export (PoolVector2Array) var held_directions : PoolVector2Array

func check(input: InputState, current_state: String):
	return (
		(continuous or input.is_latest)
		and
		PoolArray.contains(states_from, current_state) 
		and
		(!requires_held_direction or PoolArray.contains(held_directions, input.held_direction)) 
		and 
		(!requires_combo or _check_buffer_for_combo(input.buffer))
	)

func _check_buffer_for_combo(buffer: String):
	for combo in combos:
		if buffer.ends_with(combo):
			return true
	return false
