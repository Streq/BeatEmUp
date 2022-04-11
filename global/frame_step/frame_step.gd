extends Node

var pause = false
var next_frame = false
func _physics_process(delta):
	get_tree().paused = pause and !next_frame
	next_frame = false
func _input(event):
	if event is InputEventKey:
		var e = event as InputEventKey
		if e.is_pressed():
			match e.scancode:
				KEY_PLUS:
					next_frame = true
				KEY_P:
					pause = !pause
