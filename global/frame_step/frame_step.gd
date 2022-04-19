extends Node

var pause = false
var next_frame = false
func _physics_process(delta):
	get_tree().paused = pause and !next_frame
	next_frame = false
	

onready var FPS = 60.0
var pow_of_2 = 0 setget set_pow_of_2


func set_pow_of_2(val):
	pow_of_2 = val
	var factor = pow(2.0, pow_of_2)
	Engine.set_time_scale(factor)
	Engine.set_target_fps(factor * FPS)
#	Engine.set_target_fps(60)
	print(
		"pow_of_2: ", val,
		", time_scale: ", Engine.time_scale,
		", target_fps: ", Engine.target_fps, 
		", factor: ", factor, 
		", mspf: ", 1.0/Engine.target_fps*Engine.time_scale*1000)

func _input(event):
	if event is InputEventKey:
		var e = event as InputEventKey
		if e.is_pressed():
			match e.scancode:
				KEY_O:
					next_frame = true
				KEY_P:
					pause = !pause
				KEY_U:
					self.pow_of_2 -= 1
				KEY_I:
					self.pow_of_2 += 1

