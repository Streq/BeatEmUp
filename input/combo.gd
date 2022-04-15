extends Node

export (String) var state_to
export (PoolStringArray) var states_from
export (bool) var requires_combo
export (PoolStringArray) var combos
export (bool) var requires_held_direction
export (PoolVector2Array) var held_directions : PoolVector2Array

func check(buffer: String, held_direction: Vector2):
	return (
		(!requires_held_direction or PoolArray.contains(held_directions, held_direction)) 
		and 
		(!requires_combo or _check_buffer_for_combo(buffer)) 
	)

func _check_buffer_for_combo(buffer: String):
	for combo in combos:
		if buffer.ends_with(combo):
			return true
	return false
