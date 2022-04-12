extends Node

export (PoolStringArray) var combinations


func check(buffer:String):
	for combo in combinations:
		if buffer.ends_with(combo):
			return true
